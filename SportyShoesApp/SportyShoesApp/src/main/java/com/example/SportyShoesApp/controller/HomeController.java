package com.example.SportyShoesApp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class HomeController {

	@RequestMapping("/userLogin")
	public String userLogin(ModelMap model)
	{
		return "userLogin";
	}
	
	@RequestMapping("/userRegister")
	public String userRegister(ModelMap model)
	{
		return "userRegistration";
	}
	
	@RequestMapping("/adminLogin")
	public String adminLogin(ModelMap model)
	{
		return "adminLogin";
	}
}
