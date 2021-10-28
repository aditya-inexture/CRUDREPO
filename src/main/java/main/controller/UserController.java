package main.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import main.entity.Address;
import main.entity.Login;
import main.entity.User;
import main.service.LoginService;
import main.service.UserAddressService;
import main.service.UserService;

@Controller
public class UserController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserAddressService userAddressService;

	private boolean isAdmin = false;
	private boolean isUser = false;
	boolean isInvalid = false;
	
	
	@RequestMapping(path = {"/forgotPassword","/forgotPassword/{passwordError}"})
	public String forgotPassword(@PathVariable(required = false) String passwordError,Model model) {
		model.addAttribute("passwordError", passwordError);
		return "forgot-password";
	}
	
	//change user password if email is valid (if user exists in the system).
	@RequestMapping(path = "/forgotPasswordHandler")
	public String forgotPasswordHandler(Model model,@RequestParam("email") String email,@RequestParam("newPassword") String newPassword,@RequestParam("confirmNewPassword") String confirmNewPassword) {
	try {
		
		User user = userService.getuserByemail(email);
		if(user.getEmail().equalsIgnoreCase(email)) {
			
			if(newPassword.equals(confirmNewPassword)) {
				user.setPassword(newPassword);
				userService.saveUser(user);
				return "redirect:/login";
			}else {
				model.addAttribute("passwordError", "password must match");
				return "redirect:/forgotPassword/{passwordError}";
			}		
			
		}else {
			model.addAttribute("passwordError", "email does not exist, please enter registered email id");
			return "redirect:/forgotPassword/{passwordError}";
		}
		
	}catch(Exception e) {
			model.addAttribute("passwordError", "email does not exist, please enter registered email id");
			return "redirect:/forgotPassword/{passwordError}";
	}
		
	}

	@RequestMapping(path = { "/login", "/login/{isInvalid}" })
	public String loginRedirect(Model model, @PathVariable(name = "isInvalid", required = false) boolean isInvalid) {
		Login loginCredentials = new Login();

		model.addAttribute("loginCredentials", loginCredentials);
		
		//Check if invalid user (wrong username or password)
		if(isInvalid == true) {
			model.addAttribute("invalidLogin","Invalid username or password");
		}
		
		return "login";
	}

	@RequestMapping(path = "/loginH", method = RequestMethod.POST)
	public String loginHandler(@ModelAttribute("loginCredentials") Login login, Model model, HttpSession session) {
		System.out.println(login);
		String username = login.getUsername();
		String password = login.getPassword();

		try {
			String type = loginService.validateUser(username, password);
			if (type.equalsIgnoreCase("admin")) {
				isAdmin = true;
				isUser = false;
				session.setAttribute("isAdmin", isAdmin);
				session.setAttribute("isUser", isUser);
				session.setMaxInactiveInterval(300);

				return "index";
			} else if (type.equalsIgnoreCase("normalUser")) {
				User user = userService.getuserByemail(login.getUsername());
				int uid = user.getUid();
				model.addAttribute("user", user);
				isAdmin = false;
				isUser = true;
				session.setAttribute("isUser", isUser);
				session.setAttribute("isAdmin", isAdmin);
				session.setAttribute("uid", uid);

				return "index";
			} else {
				isInvalid = true;
				model.addAttribute("isInvalid", isInvalid);
				return "redirect:/login/{isInvalid}";
			}

		} catch (Exception e) {
			isInvalid = true;
			model.addAttribute("isInvalid", isInvalid);
			return "redirect:/login/{isInvalid}";
		}

	}

	@RequestMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("isAdmin");
		session.removeAttribute("isUser");
		session.removeAttribute("uid");

		session.invalidate();
		return "redirect:/login";
	}

	// For admin to add new user
	@GetMapping("/showForm")
	public String showFormToAdd(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user-form";
	}

	// save user
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute(name = "user") User user,
			@RequestParam("commonsMultipartFile") CommonsMultipartFile commonsMultipartFile, HttpSession session,
			Model model) {

		if (session != null) {

			List<Address> newAdr = new ArrayList<Address>();

			if (user != null) {
				for (Address adr : user.getAddresss()) {
					if ((adr.getInputAddress1() == null) && (adr.getCity() == null) && (adr.getState() == null)) {
						adr.setUser(user);
						// user.getAddresss().remove(adr);
					} else {
						adr.setUser(user);
						newAdr.add(adr);
					}
				}

				user.getAddresss().remove(user.getAddresss());
				user.setAddresss(newAdr);

				// Convert multipart file to byte array
				byte[] data = commonsMultipartFile.getBytes();
				user.setImage(data);

				user.setType("user");
				userService.saveUser(user);
				return "redirect:/login";
			}
			return "redirect:/login";
		} else {
			model.addAttribute("e", "Session expired please login again");
			return "error";
		}

	}

	// To show all users
	@GetMapping("/list")
	public String listUsers(Model model, HttpSession session) {
		if (session != null) {
			List<User> users = userService.getUsers();
			model.addAttribute("users", users);
			return "list-users";
		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}
	}

	// To show current user

	@GetMapping("/listUser")
	public String listUser(Model model, HttpSession session) {
		if (session != null) {
			try {
				int uid = (Integer) session.getAttribute("uid");

				User user = userService.getUser(uid);

				if (user == null) {
					session.removeAttribute("user");
					return "redirect:/logout";
				}

				// encode byte to UTF-8
				if (user.getImage() != null) {
					byte[] encodeBase64 = Base64.getEncoder().encode(user.getImage());
					String base64Encoded = new String(encodeBase64, "UTF-8");
					// Add encoded image into model attribute, to display in user-details page
					model.addAttribute("userImage", base64Encoded);
				}

				model.addAttribute("user", user);
				return "user-details";
			} catch (Exception e) {
				// model.addAttribute("user",session.getAttribute("user"));
				System.out.println(e);
				return "error";
			}
		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}

	}

	@RequestMapping("/userDetails")
	public String userDetails(@RequestParam("uid") int uid, Model model, HttpSession session) throws IOException {
		if (session != null) {
			User user = userService.getUser(uid);
			if (user != null) {
				if (user.getImage() != null) {
					byte[] encodeBase64 = Base64.getEncoder().encode(user.getImage());
					String base64Encoded = new String(encodeBase64, "UTF-8");
					// Add encoded image into model attribute, to display in user-details page
					model.addAttribute("userImage", base64Encoded);
				}
				model.addAttribute("user", user);
				// return "user-details";
				return "user-details";
			}
			if (isAdmin) {
				model.addAttribute("userNotFound", "userNotFound");
				return "redirect:/list";
			}
			return "error";
		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}

	}

	@RequestMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") User user, Model model,
			@RequestParam("commonsMultipartFile") CommonsMultipartFile commonsMultipartFile, HttpSession session) {
		if (session != null) {
			if (user != null) {
				
				
				User u = userService.getUser(user.getUid());
				List<Integer> tempAid = new ArrayList<Integer>();
				
				//check if address is not null before updating or deleting user address
				if(u.getAddresss() != null) {
					for(Address tempAddress : u.getAddresss()) {
						tempAid.add(tempAddress.getAid());
					}
				}
				
			
				if (user.getAddresss() != null) {
					for(Iterator<Address> a = user.getAddresss().iterator(); a.hasNext();) {
						
						Address adr = a.next();
						
						//System.out.println("before checking null: "+ adr);
						if ((adr.getInputAddress1() == null) || (adr.getCity() == null)
								|| (adr.getState() == null)) {
							System.out.println("Addres is null ,!, "+ adr);
							
							if(user.getAddresss().contains(adr)) {
								//remove current address i.e null from user.getAddresss iteration object
								a.remove();
							}
							
							//user.getAddresss().remove(adr);
							//continue;
						} else {
							if (adr != null && (adr.getInputAddress1() != null) && (adr.getCity() != null)
									&& (adr.getState() != null)) {
								
								adr.setUser(user);
								
								//check if our old user address contains newly updated address field
								if(tempAid.contains(adr.getAid()) || tempAid.isEmpty() || adr.getAid() == 0) {
									
									//remove contained element from previous address list so we can delete it later.
									if(tempAid.contains(adr.getAid())) {
										tempAid.remove((Object) adr.getAid());	
									}															
									
								}
								
							}

						}

						
					}//forEach for address iteration
					System.out.println("at last address: "+ user.getAddresss());
				}
				
				//System.out.println("tempaid array at last : " + tempAid);
				//lets iterate over tempAddress list and delete previous address
				if(!tempAid.isEmpty()) {
					for(int a : tempAid) {
						userAddressService.deleteAddress(a);
					}
				}

				if (commonsMultipartFile.getSize() != 0) {
					System.out.println("inside if part of multipart");
					// Convert multipart file to byte array
					byte[] data = commonsMultipartFile.getBytes();
					user.setImage(data);
				} else {

					user.setImage(userService.getUserImage(user.getUid()));
				}

				user.setType("user");
				//System.out.println("before saving user address : "+user +"\n---------\n"+user.getAddresss());
				userService.saveUser(user);
				String msg = "User updates successfully";
				model.addAttribute("msg", msg);
				
			}
			Object findIfAdmin = session.getAttribute("isAdmin").toString();

			if (findIfAdmin.equals("true")) {
				return "redirect:/list";
			} else {
				return "redirect:/listUser";
			}
		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}

	}//updateAddress

	// Address of user non ajax
	@GetMapping("/userAddress")
	public String userAddress(@RequestParam("uid") int uid, Model model, HttpSession session) {
		if (session != null) {
			List<Address> addresss = userAddressService.getAddresss(uid);
			model.addAttribute("addresss", addresss);
			return "user-address";
		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}
	}

	// for ajax call
	@GetMapping("/getUserAddress/{uid}")
	public @ResponseBody ArrayList<Address> getUserAddress(@PathVariable int uid, HttpSession session) {
		System.out.println("before getting address : " + uid);
		ArrayList<Address> addresss = userAddressService.getAddresss(uid);
		// model.addAttribute("addresss",addresss);
		// System.out.println(addresss);
		return addresss;
	}

	// Delete current address
	@RequestMapping(path = "/deleteAddress")
	public String deleteUserAddress(@RequestParam("aid") int aid, HttpSession session, Model model) {
		if (session != null) {
			userAddressService.deleteAddress(aid);
			// return "redirect:/list";
			Object findIfAdmin = session.getAttribute("isAdmin").toString();
			if (findIfAdmin.equals("true")) {
				return "redirect:/list";
			}
			return "redirect:/listUser";
		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}
	}

	@RequestMapping(path = "/updateAddress")
	public @ResponseBody String updateAddress(@ModelAttribute("ao") Address ao) {
		System.out.println("Inside ajax update method " + ao);
		userAddressService.saveAddress(ao);
		return "user Updated Successfully";
	}

	@GetMapping("/deleteUser/{uid}")
	public @ResponseBody String deleteUser(@PathVariable int uid, Model model, HttpSession session) {
		if (session != null) {
			try {
				userService.deleteUser(uid);
				return "user deleted";
			} catch (Exception e) {
				return "error while deleting user";
			}

		} else {
			model.addAttribute("errorMessage", "Session expired please login again");
			return "error";
		}

	}

}
