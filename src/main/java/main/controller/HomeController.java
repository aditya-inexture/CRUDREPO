package main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import main.entity.User;
import main.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
//	@RequestMapping("/register")
//	public String register() {
//		return "register";
//	}
	
	
	@GetMapping("/list")
	public String listUsers(Model model) {
		List<User> users = userService.getUsers();
		model.addAttribute("users",users);
		return "list-users";
	}
	
	@GetMapping("/showForm")
	public String showFormToAdd(Model model) {
		User user = new User();
		model.addAttribute("user",user);
		return "user-form";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user) {
		userService.saveUser(user);
		return "redirect:/list";
	}
	
	@GetMapping("/updateForm")
	public String showFormToUpdate(@RequestParam("uid") int uid, Model model) {
		User user = userService.getUser(uid);
		model.addAttribute("user", user);
		return "user-form";
	}
	
	@GetMapping("/delete")
	public String deleteUser(@RequestParam("uid") int uid) {
		userService.deleteUser(uid);
		return "redirect:/list";
	}
	
}
