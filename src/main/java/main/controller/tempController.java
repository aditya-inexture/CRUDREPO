//package main.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import main.entity.Address;
//import main.entity.Login;
//import main.entity.User;
//import main.service.LoginService;
//import main.service.UserAddressService;
//import main.service.UserService;
//
//@Controller
//public class tempController {
//
//	@Autowired
//	private UserService userService;
//	
//	@Autowired
//	private UserAddressService userAddressService;
//	
//	@Autowired
//	private LoginService loginService;
//
//	
//	@RequestMapping("/")
//	public String home(HttpSession session) {
//		return "index";
//	}
//	
//	
//	
//	
//	
//	
//	
////	@RequestMapping("/register")
////	public String register() {
////		return "register";
////	}
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	@GetMapping("/delete")
//	public String deleteUser(@RequestParam("uid") int uid) {
//		userService.deleteUser(uid);
//		return "redirect:/list";
//	}
//	
//	/*
//	 * @GetMapping("/userAddress") public String userAddress(@RequestParam("aid")
//	 * int aid,Model model) { List<Address> addresss =
//	 * userAddressService.getAddresss(aid); model.addAttribute("addresss",addresss);
//	 * return "user-address"; }
//	 */
//	
//
//	
//	
//
//	
//}
