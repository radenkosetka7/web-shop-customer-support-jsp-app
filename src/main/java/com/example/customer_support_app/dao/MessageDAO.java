package com.example.customer_support_app.dao;

import com.example.customer_support_app.beans.MessageBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {

    private static ConnectionPool connectionPool = ConnectionPool.getConnectionPool();
    private static final String SQL_SELECT_ALL = "SELECT m.id, m.question, m.status, mail FROM web_shop.message m INNER JOIN user u WHERE m.user_id=u.id;";
    private static final String SQL_SELECT_BY_ID = "SELECT m.id, m.question, m.status, mail FROM web_shop.message m INNER JOIN user u ON m.user_id=u.id WHERE m.id=?";
    private static final String SQL_UPDATE_STATUS = "UPDATE message m SET m.status=? WHERE m.id=?";


    public MessageDAO() {
        // TODO Auto-generated constructor stub
    }

    public static List<MessageBean> getAll() {
        List<MessageBean> messages = new ArrayList<>();

        Connection c = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {
            c = connectionPool.checkOut();
            ps = DBUtil.prepareStatement(c, SQL_SELECT_ALL, false);
            rs = ps.executeQuery();

            while (rs.next()) {
                messages.add(new MessageBean(rs.getInt("id"), rs.getString("question"), rs.getBoolean("status"), rs.getString("mail")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }

        return messages;
    }

    public static void update(Integer id) {
        Connection c = null;
        PreparedStatement ps = null;

        try {
            c = connectionPool.checkOut();
            ps = DBUtil.prepareStatement(c, SQL_UPDATE_STATUS, false);
            ps.setBoolean(1, true);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }
    }

    public static MessageBean getById(int id) {
        Connection c = null;
        ResultSet rs = null;
        PreparedStatement ps=null;
        List<MessageBean> messages = new ArrayList<>();

        try {
            c = connectionPool.checkOut();
            ps =DBUtil.prepareStatement(c, SQL_SELECT_BY_ID, false);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                messages.add(new MessageBean(rs.getInt("id"), rs.getString("question"), rs.getBoolean("status"), rs.getString("mail")));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }
        return messages.get(0);
    }

}
