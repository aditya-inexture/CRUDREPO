package main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	
	@RequestMapping("/login")
	public String loginRedirect(Model model) {
		Login loginCredentials = new Login();
		model.addAttribute("loginCredentials",loginCredentials);
		return "login";
	}
	
	@RequestMapping(path = "/loginH", method = RequestMethod.POST)
	public String loginHandler(@ModelAttribute("loginCredentials") Login login, Model model,HttpSession session) {
		String username = login.getUsername();
		String password = login.getPassword();
		
		String type = loginService.validateUser(username,password);
		if(type.equalsIgnoreCase("admin")) {
			isAdmin = true;
			isUser = false;
			session.setAttribute("isAdmin", isAdmin);
			session.setAttribute("isUser", isUser);
			session.setMaxInactiveInterval(300);
			
			return "index";
		}
		else if (type.equalsIgnoreCase("normalUser")) {
			User user = userService.getuserByemail(login.getUsername());
			int uid = user.getUid();
			model.addAttribute("user",user);
			isAdmin = false;
			isUser = true;
			session.setAttribute("isUser", isUser);
			session.setAttribute("isAdmin", isAdmin);
			session.setAttribute("uid", uid);

			return "index";
		}

		return "redirect:/login";
	}
	
	@RequestMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("type");
		session.removeAttribute("user");
		session.removeAttribute("login");
		
		session.invalidate();
		return "redirect:/login";
	}

	
	//For admin to add new user
	@GetMapping("/showForm")
	public String showFormToAdd(Model model) {
		User user = new User();
		model.addAttribute("user",user);
		return "user-form";
	}
	
	//save user
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user) {
		
		if(user != null) {
			for(Address adr : user.getAddresss()) {
				adr.setUser(user);
			}
			userService.saveUser(user);
			return "redirect:/list";	
		}
		return "redirect:/list";
	}
	
	
	// To show all users
	@GetMapping("/list")
	public String listUsers(Model model) {
		List<User> users = userService.getUsers();
		model.addAttribute("users",users);
		return "list-users";
	}
	
	 // To show current user
	  
		@GetMapping("/listUser")
		public String listUser(Model model,HttpSession session) {
			try {
					int uid = (Integer) session.getAttribute("uid");			
					
					User user = userService.getUser(uid);
					
					if(user == null) {
						session.removeAttribute("user");
						return "redirect:/logout";
					}
					
					model.addAttribute("user", user);
					return "user-details";
				}
			catch(Exception e) {
				model.addAttribute("user",session.getAttribute("user"));
				return "error";
			}
		}
		
		@RequestMapping("/userDetails")
		public String userDetails(@RequestParam("uid") int uid, Model model) {
			User user = userService.getUser(uid);
			if(user != null) {
				model.addAttribute("user", user);
				return "user-details";
			}
			if(isAdmin) {
				model.addAttribute("userNotFound", "userNotFound");
				return "redirect:/list";
			}
			return "error";
		}
		
		
		
		@RequestMapping("/updateUser")
		public String updateUser(@ModelAttribute("user") User user,Model model,HttpSession session) {
			System.out.println("Before saving user " + user);
			System.out.println("Before saving user " + user.getAddresss());
			
			if(user != null) {
				if(user.getAddresss() != null) {
					for(Address adr : user.getAddresss()) {
						adr.setUser(user);
						//adr.setAid(aid);
						userAddressService.saveAddress(adr);
						System.out.println("This address saved " + adr.getAid());
					}
				}
				user.setType("user");
				userService.saveUser(user);
				String msg="User updates successfully";
				model.addAttribute("msg",msg);

			}
			Object findIfAdmin = session.getAttribute("isAdmin").toString();
			System.out.println("Object finfifString wala  " + findIfAdmin);
			if(findIfAdmin.equals("true")) {return "redirect:/list";}
			else {
				return "redirect:/listUser";
			}
		}
		
		//Address of user
		@GetMapping("/userAddress")
		public String userAddress(@RequestParam("uid") int uid,Model model) {
			List<Address> addresss = userAddressService.getAddresss(uid);
			model.addAttribute("addresss",addresss);
			return "user-address";
		}
		
		//Delete current address
		@RequestMapping("/deleteAddress")
		public String deleteUserAddress(@RequestParam("aid") int aid,HttpSession session) {
			userAddressService.deleteAddress(aid);
			//return "redirect:/list";
			Object findIfAdmin = session.getAttribute("isAdmin").toString();
			System.out.println("Object finfifString wala  " + findIfAdmin);
			if(findIfAdmin.equals("true")) {return "redirect:/list";}
			return "redirect:/listUser";
		}
		
		
}
