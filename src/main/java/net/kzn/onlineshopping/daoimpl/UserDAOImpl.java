package net.kzn.onlineshopping.daoimpl;

import net.kzn.onlineshopping.dao.UserDAO;
import net.kzn.onlineshopping.dto.Address;
import net.kzn.onlineshopping.dto.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void addUser(User user) {
        try {
            sessionFactory.getCurrentSession().persist(user);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public User getByEmail(String email) {
        String selectQuery = "FROM User WHERE email = :email";
        try {
            return sessionFactory
                    .getCurrentSession()
                    .createQuery(selectQuery, User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        }
        catch(Exception ex) {
            return null;
        }
    }

    @Override
    public boolean addAddress(Address address) {
        try {
            sessionFactory.getCurrentSession().persist(address);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Address getBillingAddress(User user) {
        String selectQuery = "FROM Address WHERE user = :user AND billing = :billing";

        try {
            return sessionFactory.getCurrentSession()
                    .createQuery(selectQuery, Address.class)
                    .setParameter("user", user)
                    .setParameter("billing", true)
                    .getSingleResult();
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Address> listShippingAddresses(User user) {
        String selectQuery = "FROM Address WHERE user = :user AND shipping = :shipping";

        try {
            return sessionFactory.getCurrentSession()
                    .createQuery(selectQuery, Address.class)
                    .setParameter("user", user)
                    .setParameter("shipping", true)
                    .getResultList();
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }



}

