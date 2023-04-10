package com.example.SportyShoesApp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.SportyShoesApp.repository.ProductRepository;
import com.example.SportyShoesApp.repository.UserRepository;
import com.example.SportyShoesApp.entity.Address;
import com.example.SportyShoesApp.entity.Product;
import com.example.SportyShoesApp.entity.User;

@Controller
@SessionAttributes({"user_id","cart","name"})
public class UserController {
	
	@Autowired
	UserRepository userRepo;

	@RequestMapping("/UserLogin")
	public String getUser(@ModelAttribute("user")User user,ModelMap model)
	{
		
		User dbUser = userRepo.findByUsername(user.getUsername());

	    if (dbUser != null && dbUser.getPassword().equals(user.getPassword())) {
	        model.addAttribute("user_id",dbUser.getId());
	        Map<Integer,Integer>cart=new HashMap<Integer,Integer>();
	        model.addAttribute("cart", cart);
	        model.addAttribute("name", dbUser.getFname());
	    	return "userHome";
	    } 
	    else
	    {
	    	model.addAttribute("errorMsg","Invalid credentials.Try again!");
	    	return "userLogin";
		}
	}
	
	@RequestMapping("/UserRegister")
	public String addUser(@ModelAttribute("user") User user,@ModelAttribute("address") Address address,ModelMap model)
	{
		User dbUser = userRepo.findByUsername(user.getUsername());
		if(dbUser==null)
		{
			user.setAddress(address);
			userRepo.save(user);
			model.addAttribute("user_id",user.getId());
			model.addAttribute("name", user.getFname());
			return "userHome";
		}
		else
		{
			model.addAttribute("errorMsg", "Username already exists!");
			return "userRegistration";
		}
	}
	
	@RequestMapping("/viewUsers")
	public String viewUsers(ModelMap model)
	{
		List<User>user_list=userRepo.findAll();
		System.out.println(user_list);
		model.addAttribute("user_list", user_list);
		return "viewAllUsers";
	}
	
	@RequestMapping("/updateCart")
	public String updateCart(@ModelAttribute(name="cart")Map<Integer,Integer>cart,@RequestParam("action")String action,@RequestParam("id") int id, ModelMap model)
	{
		if(action.equals("add"))
		{
			if(cart.get(id)==null)
			{ 
				cart.put(id, 1);
			}
			else
			{
				int quantity=(int) cart.get(id);
				cart.put(id,quantity+1);
			}
		}
		else
		{
			if(cart.get(id)!=null)
			{
				int quantity=(int) cart.get(id);
				cart.put(id,quantity-1);
				if(cart.get(id)==0)
					cart.remove(id);
			}
		}
		model.addAttribute("cart", cart);
		return "userHome";
	}
	
	@RequestMapping("/userHome")
	public String goToHome() {
		return "userHome";
	}
}
