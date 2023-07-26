package com.example.customer_support_app.services;

import com.example.customer_support_app.beans.UserBean;
import com.example.customer_support_app.dao.UserDAO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UserService {

    public UserService() {
        // TODO Auto-generated constructor stub
    }

    public UserBean getUser(String username, String password)
    {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        UserBean userBean= UserDAO.getUserByUsername(username);

        return userBean != null && bCryptPasswordEncoder.matches(password, userBean.getPassword()) ? userBean : null;
    }

}
