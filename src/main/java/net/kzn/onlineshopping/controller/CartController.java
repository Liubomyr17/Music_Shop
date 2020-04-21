package net.kzn.onlineshopping.controller;

import net.kzn.onlineshopping.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @RequestMapping("/show")
    public ModelAndView showCart(@RequestParam(name = "result", required = false)String result) {
        ModelAndView mv = new ModelAndView("page");

        if(result!=null) {
            switch(result) {
                case "updated":
                    mv.addObject("message", "CartLine has been updated successfully!");
                    break;
                case "added":
                    mv.addObject("message", "CartLine has been added successfully!");
                    break;
                case "deleted":
                    mv.addObject("message", "CartLine has been removed successfully!");
                    break;
                case "error":
                    mv.addObject("message", "Something went wrong!");
                    break;
            }
        }


        mv.addObject("title", "User Cart");
        mv.addObject("userClickShowCart", true);
        mv.addObject("cartLines", cartService.getCartLines());

        return mv;

    }

    @RequestMapping("/{cartLineId}/update")
    public String updateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
        String response = cartService.updateCartLine(cartLineId, count);
        return "redirect:/cart/show?"+response;
    }

    @RequestMapping("/{cartLineId}/delete")
    public String updateCartLine(@PathVariable int cartLineId) {
        String response = cartService.deleteCartLine(cartLineId);
        return "redirect:/cart/show?"+response;
    }

    @RequestMapping("/add/{productId}/product")
    public String addCartLine(@PathVariable int productId) {
        String response = cartService.addCartLine(productId);
        return "redirect:/cart/show?"+response;
    }

    /* after validating it redirect to checkout
     * if result received is success proceed to checkout
     * else display the message to the user about the changes in cart page
     * */
    @RequestMapping("/validate")
    public String validateCart() {
        String response = cartService.validateCartLine();
        if(!response.equals("result=success")) {
            return "redirect:/cart/show?"+response;
        }
        else {
            return "redirect:/cart/checkout";
        }
}}
