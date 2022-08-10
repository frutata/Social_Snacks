package com.codingdojo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.models.Snack;
import com.codingdojo.models.User;
import com.codingdojo.services.FlavorService;
import com.codingdojo.services.SnackService;
import com.codingdojo.services.UserService;

@Controller
@RequestMapping("/socialsnacks")
public class SnackController {

	@Autowired
	private SnackService snackService;
	
	@Autowired
	private FlavorService flavorService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if(session.getAttribute("user")==null) return "redirect:/";
		model.addAttribute("snacks", snackService.findAll());
		return "dashboard";
	}
	
	@GetMapping("/new")
	public String snackNew(Model model, HttpSession session) {
		if(session.getAttribute("user")==null) return "redirect:/";
		model.addAttribute("snack",new Snack());
		model.addAttribute("flavor", flavorService.findAll());
		return "snack_new";
	}
	
	@PostMapping("/new")
	public String snackCreate(@Valid @ModelAttribute("snack") Snack snack, BindingResult res, HttpSession session) {
		if(session.getAttribute("user")==null) return "redirect:/";
		if(res.hasErrors()) {
			return "snack_new";
		}
		snack.setUser((User)session.getAttribute("user"));
		snackService.createSnack(snack);
		return "redirect:/socialsnacks/dashboard";
	}
	
	@GetMapping("/edit/{id}")
	public String snackEdit(Model model, HttpSession session, @PathVariable("id") Long snackId) {
		if(session.getAttribute("user")==null) return "redirect:/";
		model.addAttribute("snack",snackService.findById(snackId));
		model.addAttribute("flavor",flavorService.findAll());
		return "snack_edit";
	}
	
	@PostMapping("/edit/{id}")
	public String snackUpdate(HttpSession session, @Valid @ModelAttribute("snack") Snack snack, BindingResult res) {
		if(session.getAttribute("user")==null) return "redirect:/";
		if(res.hasErrors()) {
			return "snack_edit";
		}
		snack.setUser((User)session.getAttribute("user"));
		snackService.updateSnack(snack);
		return "redirect:/socialsnacks/show/{id}";
	}
	
	@GetMapping("/show/{id}")
	public String snackShow(HttpSession session, @PathVariable("id") Long snackId, Model model) {
		if(session.getAttribute("user")==null) return "redirect:/";
		model.addAttribute("snack",snackService.findById(snackId));
		return "snack_show";
	}
	
	@GetMapping("/profile/{id}")
	public String snackProfile(HttpSession session, @PathVariable("id") Long userId, Model model) {
		if(session.getAttribute("user")==null) return "redirect:/";
		model.addAttribute("user", userService.findById(userId));
		return "snack_profile";
	}
	
	@PostMapping("/delete/{id}")
	public String snackDelete(@PathVariable("id") Long snackId) {
		snackService.deleteById(snackId);
		return "redirect:/socialsnacks/dashboard";
	}
}
