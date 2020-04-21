package net.kzn.onlineshopping.daoimpl;

import net.kzn.onlineshopping.dao.CategoryDAO;
import net.kzn.onlineshopping.dto.Category;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public CategoryDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public boolean add(Category category) {

        try {

            sessionFactory.getCurrentSession().persist(category);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

    }

    /*
    Updating a single category
     */
    @Override
    public boolean update(Category category) {
        try {
            // add the category to the database table
            sessionFactory.getCurrentSession().update(category);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        return false;
    }
}

    @Override
    public boolean delete(Category category) {

        category.setActive(false);

        try {
            // add the category to the database table
            sessionFactory.getCurrentSession().update(category);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Category> list() {

        String selectActiveCategory = "FROM Category WHERE active = :active";

        Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);

        query.setParameter("active", true);

        return query.getResultList();
    }

    /*
    * Getting single category based on id
    */
    @Override
    public Category get(int id) {

        return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
    }

}
