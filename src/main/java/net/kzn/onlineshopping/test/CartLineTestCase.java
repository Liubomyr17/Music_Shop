package net.kzn.onlineshopping.test;

import net.kzn.onlineshopping.dao.CartLineDAO;
import net.kzn.onlineshopping.dao.ProductDAO;
import net.kzn.onlineshopping.dao.UserDAO;
import net.kzn.onlineshopping.dto.Cart;
import net.kzn.onlineshopping.dto.CartLine;
import net.kzn.onlineshopping.dto.Product;
import net.kzn.onlineshopping.dto.User;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import static org.testng.AssertJUnit.assertTrue;

public class CartLineTestCase {

    private static AnnotationConfigApplicationContext context;

    private static CartLineDAO cartLineDAO = null;
    private static ProductDAO productDAO = null;
    private static UserDAO userDAO = null;

    private Product product = null;
    private User user = null;
    private Cart cart = null;
    private CartLine cartLine = null;

    @BeforeClass
    public static void init() {
        context = new AnnotationConfigApplicationContext();
        context.scan("net.kzn.onlineshopping");
        context.refresh();
        cartLineDAO = (CartLineDAO) context.getBean("cartLineDAO");
        productDAO = (ProductDAO) context.getBean("ProductDAO");
        userDAO = (UserDAO) context.getBean("userDAO");
    }

    @Test
    public void testAddNewCartLine() {

        // fetch the user and then cart of that user
        User user = userDAO.getByEmail("lizdepskij@gmail.com");
        Cart cart = user.getCart();

        // fetch the product
        Product product = productDAO.get(2);

        // Create a new CartLine
        CartLine cartLine = new CartLine();

        cartLine.setBuyingPrice(product.getUnitPrice());

        cartLine.setProductCount(cartLine.getProductCount() + 1);

        cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());

        cartLine.setAvailable(true);

        cartLine.setCartId(cart.getId());

        cartLine.setProduct(product);

        assertTrue("Failed to add the CartLine!", cartLineDAO.add(cartLine));

        cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
        cart.setCartLines(cart.getCartLines() + 1);

        assertTrue("Failed to update the cart!", cartLineDAO.updateCart(cart));

    }

}
