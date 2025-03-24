/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Timestamp;

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
    
    
}
