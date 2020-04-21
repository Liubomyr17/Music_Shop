package net.kzn.onlineshopping.test;

import net.kzn.onlineshopping.dao.UserDAO;
import net.kzn.onlineshopping.dto.Address;
import net.kzn.onlineshopping.dto.Cart;
import net.kzn.onlineshopping.dto.User;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class UserTestCase {

    private static AnnotationConfigApplicationContext context;
    private static UserDAO userDAO;
    private User user = null;
    private Cart cart = null;
    private Address address = null;



    @BeforeClass
    public static void init() {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
        context.scan("net.kzn.onlineshopping");
        context.refresh();

        userDAO = (UserDAO) context.getBean("userDAO");
    }

    /*
    @Test
    public void testAdd() {

        user = new User();
        user.setFirstName("Sam");
        user.setLastName("Bolton");
        user.setEmail("sambolton@ukr.net");
        user.setContactNumber("741236987");
        user.setRole("USER");
        user.setPassword("123654789");

        assertTrue("Failed to add user!", userDAO.addUser(user));

        address = new Address();
        address.setAddressLineOne("Golopupenko St. 101/B");
        address.setAddressLineTwo("Near Tajstra");
        address.setCity("Lviv");
        address.setState("Ternopil District");
        address.setCountry("Country");
        address.setPostalCode("41011");
        address.setBilling(true);

        address.setUserId(user.getId());

        assertTrue("Failed to add address!", userDAO.addAddress(address));

        if(user.getRole().equals("USER")) {
            cart = new Cart();
            cart.setUser(user);

            assertTrue("Failed to add cart!", userDAO.addCart(cart));

            address = new Address();
            address.setAddressLineOne("Golopupenko St. 102/B");
            address.setAddressLineTwo("Near Mercury");
            address.setCity("Kyiv");
            address.setState("Kyiv District");
            address.setCountry("Ukraine");
            address.setPostalCode("42011");
            address.setBilling(true);

            address.setUserId(user.getId());

            assertTrue("Failed to add shipping address!", userDAO.addAddress(address));


        }


*/
/*
    @Test
    public void testAdd() {
        user = new User();
        user.setFirstName("Som");
        user.setLastName("Boulton");
        user.setEmail("sambolton@ukr.net");
        user.setContactNumber("741276987");
        user.setRole("USER");
        user.setPassword("987654321");


        if (user.getRole().equals("USER")) {
            cart = new Cart();
            cart.setUser(user);

            user.setCart(cart);


        }
        assertTrue("Failed to add user!", userDAO.addUser(user));

    }

    @Test
    public void testUpdateCart() {
        // fetch the user by its email
        user = userDAO.getByEmail("ivan@gmail.com");

        // get the art of the user
        cart = user.getCart();

        cart.setGrandTotal(7777);

        cart.setCartLines(3);

        assertEquals("Failed to update the cart!", true, userDAO.updateCart(cart));
    }


    @Test
    public void testAddAddress() {

        user = new User();
        user.setFirstName("Som");
        user.setLastName("Boulogne");
        user.setEmail("sambolton@ukr.net");
        user.setContactNumber("841236987");
        user.setRole("USER");
        user.setPassword("123654789");

        assertTrue("Failed to add user!", userDAO.addUser(user));

        address = new Address();
        address.setAddressLineOne("Bandera St. 501/B");
        address.setAddressLineTwo("Near Orbita");
        address.setCity("Ternopil");
        address.setState("Ternopil District");
        address.setCountry("Ternopil Dist.");
        address.setPostalCode("41011");
        address.setBilling(true);

        address.setUser(user);
        assertTrue("Failed to add address!", userDAO.addAddress(address));

        address = new Address();
        address.setAddressLineOne("Traffangard St. 102/B");
        address.setAddressLineTwo("Near Mercury");
        address.setCity("London");
        address.setState("Kyiv District");
        address.setCountry("Ukraine");
        address.setPostalCode("42011");
        address.setShipping(true);

        address.setUser(user);
        assertTrue("Failed to add shipping address!", userDAO.addAddress(address));
    }

*/
   @Test
    public void testAddAddress() {

        user = userDAO.getByEmail("ivan@gmail.com");

        address = new Address();
        address.setAddressLineOne("Golopupenko AVE. 303/B");
        address.setAddressLineTwo("Near Plane");
        address.setCity("Velykyi Bichkyv");
        address.setState("Zakarpattia District");
        address.setCountry("Ukraine");
        address.setPostalCode("42011");
        address.setShipping(true);

        address.setUser(user);
        assertTrue("Failed to add shipping address!", userDAO.addAddress(address));
    }

    @Test
    public void testGetAddresses() {

        user = userDAO.getByEmail("sambolton@ukr.net");

        assertEquals("Filed to fetch the list of address and size does not mutch!",3,
                userDAO.listShippingAddresses(user).size());

        assertEquals("Filed to fetch the billing address and size does not mutch!","Ternopil",
                userDAO.getBillingAddress(user).getCity());

    }

}