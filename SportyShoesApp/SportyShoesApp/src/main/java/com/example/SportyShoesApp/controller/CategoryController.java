package com.example.SportyShoesApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.SportyShoesApp.entity.Product;
import com.example.SportyShoesApp.repository.ProductRepository;

@Controller
@RequestMapping("/Category")
public class CategoryController {

	@Autowired
	ProductRepository prodRepo;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getProducts(@RequestParam(name="category")String category,ModelMap model) {
		List<Product>product_list=prodRepo.findByCategory(category);
		model.addAttribute("product_list", product_list);
		return "userHome";
	}
}
