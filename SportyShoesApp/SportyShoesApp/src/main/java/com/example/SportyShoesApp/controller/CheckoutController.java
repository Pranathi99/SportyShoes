package com.example.SportyShoesApp.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.SportyShoesApp.entity.Orders;
import com.example.SportyShoesApp.entity.Product;
import com.example.SportyShoesApp.entity.User;
import com.example.SportyShoesApp.repository.OrderRepository;
import com.example.SportyShoesApp.repository.ProductRepository;
import com.example.SportyShoesApp.repository.UserRepository;

@Controller
public class CheckoutController {

	@Autowired
	OrderRepository orderRepo;
	
	@Autowired
	ProductRepository prodRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@RequestMapping("/Checkout/payment")
	public String payment(@RequestParam(name="id")int id,ModelMap model) {
		model.addAttribute("id",id);
		return "payment";
	}
	
	@RequestMapping("/Checkout/receipt")
	public String checkout(@RequestParam(name="id")String prod_id,@SessionAttribute(name="user_id")int user_id) {
		Product prod=(Product) prodRepo.findById(Integer.parseInt(prod_id));
		User user=userRepo.findById(user_id);
		Orders order=new Orders();
		LocalDate date=LocalDate.now();
		order.setDate_of_purchase(date.toString());
		order.setProduct(prod);
		order.setUser(user);
		order.setPrice(prod.getPrice());
		order.setQuantity(1);
		orderRepo.save(order);
		return "checkout";
	}
}
