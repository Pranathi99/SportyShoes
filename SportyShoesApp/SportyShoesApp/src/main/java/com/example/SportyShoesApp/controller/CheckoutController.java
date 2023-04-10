package com.example.SportyShoesApp.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String payment(@RequestParam("cart_len")int cart_len, ModelMap model) {
		if(cart_len<=0)
		{
			model.addAttribute("errorMsg", "No items in cart!");
			return "/userHome";
		}
		return "payment";
	}
	
	@RequestMapping("/Checkout/receipt")
	public String checkout(@SessionAttribute(name="cart")Map<Integer,Integer>cart,@SessionAttribute(name="user_id")int user_id,ModelMap model) {
		
		List<Orders>cart_items=new ArrayList<Orders>();
		User user=userRepo.findById(user_id);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime=LocalDateTime.now();
		String formattedDateTime = dateTime.format(formatter);
		String date=dateTime.toLocalDate().toString();
		for (Entry<Integer, Integer> entry : cart.entrySet())
		{
			int prod_id=entry.getKey();
			int quantity=entry.getValue();
			Product prod=prodRepo.findById(prod_id);
			Orders order=new Orders();
			order.setDate_of_purchase(date);
			order.setProduct(prod);
			order.setUser(user);
			order.setPrice(prod.getPrice());
			order.setQuantity(quantity);
			order.setDate_time(formattedDateTime);
			orderRepo.save(order);
			cart_items.add(order);
		}
		cart.clear();
		model.addAttribute("cart_items", cart_items);
		return "checkout";
	}
}
