package net.kzn.onlineshopping.dao;

import net.kzn.onlineshopping.dto.Cart;
import net.kzn.onlineshopping.dto.CartLine;

import java.util.List;

public interface CartLineDAO {

    // the common methods from previously coded one
    CartLine get(int id);
    boolean add(CartLine cartLine);
    boolean update(CartLine cartLine);
    boolean delete(CartLine cartLine);
    List<CartLine> list(int cartId);

    // other business method related to the cart lines
    List<CartLine> listAvailable(int cartId);
    CartLine getByCartAndProduct(int cartId, int productId);

// update a cart
    boolean updateCart(Cart cart);

}
