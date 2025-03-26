/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Naammm
 */
public class OrderDAO implements IDAO<OrderDTO, String>{

    @Override
    public boolean create(OrderDTO entity) {
        String sql = "INSERT INTO tblOrders (code, status, userID) VALUES (?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getCode());
            ps.setString(2, entity.getStatus());
            ps.setInt(3, entity.getUserID());
            int n = ps.executeUpdate();
            return n > 0;
        }  catch (ClassNotFoundException ex) {
                ex.printStackTrace();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<OrderDTO> readAll() {
        List<OrderDTO> orderList = new ArrayList<>();
        String sql = "SELECT * FROM tblOrders ORDER BY created_at DESC";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                OrderDTO order = new OrderDTO(
                    rs.getInt("orderID"),
                    rs.getString("code"),
                    rs.getString("status"),
                    rs.getInt("userID"),
                    rs.getTimestamp("created_at")
                );
                orderList.add(order);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return orderList;
    }

    @Override
    public OrderDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(OrderDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM tblOrders WHERE orderID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<OrderDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public OrderDTO findByCode(String code) {
        String sql = "SELECT * FROM tblOrders WHERE code = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new OrderDTO(
                    rs.getInt("orderID"),
                    rs.getString("code"),
                    rs.getString("status"),
                    rs.getInt("userID"),
                    rs.getTimestamp("created_at")
                );
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<OrderDTO> finByUserID(String userID) {
        List<OrderDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblOrders WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 OrderDTO order = new OrderDTO(
                    rs.getInt("orderID"),
                    rs.getString("code"),
                    rs.getString("status"),
                    rs.getInt("userID"),
                    rs.getTimestamp("created_at")
                );
                list.add(order);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public OrderDTO findByOrderID(String orderID) {
        String sql = "SELECT * FROM tblOrders WHERE orderID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 OrderDTO order = new OrderDTO(
                    rs.getInt("orderID"),
                    rs.getString("code"),
                    rs.getString("status"),
                    rs.getInt("userID"),
                    rs.getTimestamp("created_at")
                );
                return order;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateOrderStatus(int orderID, String status) {
        String sql = "UPDATE tblOrders SET status = ? WHERE orderID = ?";
    
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
        public List<OrderDTO> readByCode(String code) {
            List<OrderDTO> orderList = new ArrayList<>();
            String sql = "SELECT * FROM tblOrders WHERE code LIKE ? ORDER BY created_at DESC";

            try (Connection conn = DBUtils.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql);
                ) {
                ps.setString(1, "%" + code + "%");
                 ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    OrderDTO order = new OrderDTO(
                        rs.getInt("orderID"),
                        rs.getString("code"),
                        rs.getString("status"),
                        rs.getInt("userID"),
                        rs.getTimestamp("created_at")
                    );
                    orderList.add(order);
                }
            } catch (SQLException | ClassNotFoundException ex) {
                ex.printStackTrace();
            }
            return orderList;
        }
}
