package com.example.SportyShoesApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.SportyShoesApp.entity.Admin;
import com.example.SportyShoesApp.entity.Product;
import com.example.SportyShoesApp.entity.User;
import com.example.SportyShoesApp.repository.AdminRepository;
import com.example.SportyShoesApp.repository.ProductRepository;

@Controller
public class AdminController {

	@Autowired
	AdminRepository adminRepo;
	
	@Autowired
	ProductRepository prodRepo;
	
	@RequestMapping("/AdminHome")
	public String adminHome()
	{
		return "adminHome";
	}
	
	@RequestMapping("/AdminLogin")
	public String getAdmin(@ModelAttribute("admin")Admin admin,ModelMap model) {
		Admin admin_details = adminRepo.findByUsername("admin");
		
	    if (admin != null && admin.getPassword().equals(admin_details.getPassword())) {
	    	return "adminHome";
	    } 
	    else
	    { 
	    	model.addAttribute("errorMsg","Invalid credentials.Try again!");
	    	return "adminLogin";
		}
	}
	
	@RequestMapping("/ChangePassword")
	public String changePassword(@ModelAttribute("admin")Admin admin,ModelMap model)
	{
		Admin admin_details = adminRepo.findByUsername("admin");
		admin_details.setPassword(admin.getPassword());
		adminRepo.save(admin_details);
		model.addAttribute("msg", "Password changed successfully!");
		return "changePassword";
	} 
	
	@RequestMapping("/changeAdminPassword")
	public String changeAdminPassword(@ModelAttribute("admin")Admin admin,ModelMap model)
	{
		return "changePassword";
	}
	
	@RequestMapping("/updateProd")
	public String updateProduct(@RequestParam(name="id")int id,ModelMap model)
	{
		System.out.println(id);
		Product product=prodRepo.findById(id);
		model.addAttribute("product", product);
		return "updateProduct";
	}
	
	@RequestMapping("/deleteProd")
	public String deleteProduct(@RequestParam(name="id")int id,ModelMap model,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addAttribute("id",id);
	    return "redirect:/Products/deleteProduct";
	}
	
	@RequestMapping("/addProd")
	public String addProduct(ModelMap model)
	{
		return "addProduct";
	}
	
}
