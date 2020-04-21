package net.kzn.onlineshopping.controller;

import net.kzn.onlineshopping.dao.UserDAO;
import net.kzn.onlineshopping.dto.User;
import net.kzn.onlineshopping.model.UserModel;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@ControllerAdvice
public class globalController {

    private final UserDAO userDAO;

    private final HttpSession session;

    private UserModel userModel = null;
    private User user = null;

    public globalController(HttpSession session, UserDAO userDAO) {
        this.session = session;
        this.userDAO = userDAO;
    }


    @ModelAttribute("userModel")
    public UserModel getUserModel() {

        if(session.getAttribute("userModel")== null) {

            // add the user model
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

            if (!authentication.getPrincipal().equals("anonymousUser")) {
                User user = userDAO.getByEmail(authentication.getName());

                if (user != null) {

                    // create a new UserModel object to pass the user details
                    UserModel userModel = new UserModel();

                    userModel.setId(user.getId());
                    userModel.setEmail(user.getEmail());
                    userModel.setRole(user.getRole());
                    userModel.setFullName(user.getFirstName() + " " + user.getLastName());

                    if (userModel.getRole().equals("USER")) {
                        // set the cart if user is a buyer
                        userModel.setCart(user.getCart());
                    }
                    //set the userModel in the session
                    session.setAttribute("userModel", userModel);

                    return userModel;
                }
            }
        }

        return (UserModel) session.getAttribute("userModel");

    }

}
