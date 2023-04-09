package com.example.SportyShoesApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.SportyShoesApp.entity.Product;
import com.example.SportyShoesApp.repository.ProductRepository;

@Controller
public class ProductController {
	
	@Autowired
	ProductRepository prodRepo;
	
	@RequestMapping("/Products/updateProduct")
	public String updateProduct(@RequestParam(name="id")int id,@ModelAttribute("product")Product product,ModelMap model)
	{
		Product prod=prodRepo.findById(id);
		prod.setCategory(product.getCategory());
		prod.setName(product.getName());
		prod.setDesc(product.getDesc());
		prod.setQuantity(product.getQuantity());
		prod.setPrice(product.getPrice());
		prodRepo.save(prod);
		return "redirect:/Products/manageProducts";
	}
	
	@RequestMapping("/Products/deleteProduct")
	public String deleteProduct(@RequestParam(name="id")int id,ModelMap model)
	{
		prodRepo.deleteById(id);
		return "redirect:/Products/manageProducts";
	}
	
	@RequestMapping("/Products/manageProducts")
	public String manageProducts(ModelMap model)
	{
		List<Product>prod_list=prodRepo.findAll();
		//System.out.println(prod_list);
		model.addAttribute("prod_list", prod_list);
		return "manageProducts";
	}
	
	@RequestMapping("/Products/addProduct")
	public String addProduct(@ModelAttribute("product")Product product,ModelMap model)
	{
		System.out.println(product);
		prodRepo.save(product);
		return "redirect:/Products/manageProducts";
	}
}
