/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Naammm
 */
public class UserDTO {
    private int userID;
    private String fullName;
    private String phone;
    private String roleID;
    private String password;
    private String email;
    private String address;

    public UserDTO() {
    }

    public UserDTO(int userID, String fullName, String phone, String roleID, String password, String email, String address) {
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.roleID = roleID;
        this.password = password;
        this.email = email;
        this.address = address;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", fullName=" + fullName + ", phone=" + phone + ", roleID=" + roleID + ", password=" + password + ", email=" + email + ", address=" + address + '}';
    }

  
    
    
}
