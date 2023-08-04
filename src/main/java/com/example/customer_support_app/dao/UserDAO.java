package com.example.customer_support_app.dao;

import com.example.customer_support_app.beans.UserBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    private static ConnectionPool connectionPool = ConnectionPool.getConnectionPool();
    private static final String SELECT_USER_BY_USERNAME = "SELECT * FROM web_shop.user WHERE status=1 and role=1 and BINARY username=?";
    public UserDAO() {
        // TODO Auto-generated constructor stub
    }


    public static UserBean getUserByUsername(String username)
    {
        UserBean user = null;
        Connection c = null;
        ResultSet rs= null;
        try {
            c = connectionPool.checkOut();
            PreparedStatement ps = DBUtil.prepareStatement(c, SELECT_USER_BY_USERNAME, false);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserBean(rs.getInt("id"), rs.getString("name"), rs.getString("surname"), rs.getString("username"), rs.getString("password"));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }
        return user;
    }
}