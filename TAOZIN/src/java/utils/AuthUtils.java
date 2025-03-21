/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Naammm
 */
public class AuthUtils {
    public static final String ADMIN_ROLE = "AD";
    public static final String USER_ROLE = "US";
    
    public static UserDTO getUser(String strPhone){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByPhone(strPhone);
        return user;
    }
    
    public static boolean isValidLogin(String strPhone, String strPassword) {
        UserDTO user = getUser(strPhone);
        System.out.println(user);
        return user != null && utils.PasswordUtils.checkPassword(strPassword, user.getPassword());
    }
    
    public static UserDTO getUser(HttpSession session) {
        Object obj = session.getAttribute("user");
        return (obj!=null)?(UserDTO)obj:null;
    }
    
    public static boolean isLoggedIn(HttpSession session){
        return session.getAttribute("user") != null;
    }
    
    public static boolean isAdmin(HttpSession session) {
        if (!isLoggedIn(session)) {
            return false;
        }
        UserDTO user = (UserDTO) session.getAttribute("user");
        return user.getRoleID().equals(ADMIN_ROLE);
    }
}
