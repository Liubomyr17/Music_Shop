package net.kzn.onlineshopping.dao;

import net.kzn.onlineshopping.dto.Address;
import net.kzn.onlineshopping.dto.User;

import java.util.List;

public interface UserDAO {

    // add an user
    void addUser(User user);
    User getByEmail(String email);

    // add an address
    boolean addAddress(Address address);
    // Alternative
    // Address getBillingAddress(int userId);
    // List<Address> listShippingAddress(User userId);

    Address getBillingAddress(User user);
    List<Address> listShippingAddresses(User user);


}
