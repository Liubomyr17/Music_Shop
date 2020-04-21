package net.kzn.onlineshopping.dao;

import net.kzn.onlineshopping.dto.Category;

import java.util.List;

public interface CategoryDAO {

    Category get(int id);
    List list();
    boolean add(Category category);
    boolean update(Category category);
    boolean delete(Category category);


}
