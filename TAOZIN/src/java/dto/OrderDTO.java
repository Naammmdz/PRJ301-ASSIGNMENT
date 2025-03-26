/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.UserDAO;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Naammm
 */
public class OrderDTO {
    private int orderID;
    private String code;
    private String status;
    private int userID;
    private Timestamp createdAt;
    private List<OrderItemDTO> orderItems;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, String code, String status, int userID, Timestamp createdAt) {
        this.orderID = orderID;
        this.code = code;
        this.status = status;
        this.userID = userID;
        this.createdAt = createdAt;
    }
    
    public OrderDTO(String code, String status, int userID) {
        this.code = code;
        this.status = status;
        this.userID = userID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public List<OrderItemDTO> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemDTO> orderItems) {
        this.orderItems = orderItems;
    }
    
    public double getTotalAmount() {
        double total = 0;
        for (OrderItemDTO item : orderItems) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
    
    public String getUserPhone() {
        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.readById(String.valueOf(this.userID));
        return (user != null) ? user.getPhone() : "Không có dữ liệu";
    }
}
