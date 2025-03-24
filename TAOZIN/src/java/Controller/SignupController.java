/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.PasswordUtils;

/**
 *
 * @author Naammm
 */
@WebServlet(name = "SignupController", urlPatterns = {"/SignupController"})
public class SignupController extends HttpServlet {

    private static final String HOME_PAGE = "HomeController";
    
    public UserDTO getUser(String strPhone) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByPhone(strPhone);
        return user;
    }
    
    public boolean isValidSign(String strPhone, String strPassword, String strPasswordConf) {
        UserDTO user = getUser(strPhone);
        System.out.println(user);
//        System.out.println(user.getPassword());
        System.out.println(strPassword);
        if (user != null) {
            return false;
        }

        if (!strPassword.equals(strPasswordConf)) {
            return false;
        }

        return true;
    }    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = HOME_PAGE;
            } else {
                if (action.equals("signup")) {
                    boolean checkError = false;
                    String strFullname = request.getParameter("fullnameSign");System.out.println(strFullname);
                    String strPhone = request.getParameter("phoneSign");
                    String strPassword = request.getParameter("passwordSign");
                    String strPasswordConf = request.getParameter("password_confirmationSign");
                    HttpSession session = request.getSession();
                    
                    UserDTO existingUser = getUser(strPhone);
                    if (strFullname == null || strFullname.trim().isEmpty()) {
                        checkError = true;
                        session.setAttribute("errorFullname", "Vui lòng nhập họ và tên!");
                    }
                                       
                    if (strPhone == null || strPhone.trim().isEmpty()) {
                        checkError = true;
                        session.setAttribute("errorPhone", "Vui lòng nhập số điện thoại!");
                    } else {
                        Pattern patternObj = Pattern.compile("^(0[3|5|7|8|9])\\d{8}$");
                        Matcher matcherObj = patternObj.matcher(strPhone.trim());
                        if (!matcherObj.matches()) {
                            checkError = true;
                            session.setAttribute("errorPhone", "Số điện thoại không hợp lệ!");
                        } else if (existingUser != null) {
                            checkError = true;
                            session.setAttribute("errorPhone", "Số điện thoại đã được đăng ký!");
                        }
                        session.setAttribute("signFullname", strFullname);
                        session.setAttribute("signPassword", strPassword);
                    }
                    
                    
                    if (strPassword == null || strPassword.trim().isEmpty()) {
                        checkError = true;
                        session.setAttribute("errorPassword", "Vui lòng nhập mật khẩu!");
                    } else if (strPassword.length() < 6) {
                        checkError = true;
                        session.setAttribute("errorPassword", "Mật khẩu phải có ít nhất 6 ký tự!");
                        session.setAttribute("signFullname", strFullname);
                        session.setAttribute("signPhone", strPhone);
                    } else if (!strPassword.equals(strPasswordConf)) {
                        checkError = true;
                        session.setAttribute("errorPasswordConf", "Mật khẩu xác nhận không khớp!");
                        session.setAttribute("signFullname", strFullname);
                        session.setAttribute("signPhone", strPhone);
                        session.setAttribute("signPassword", strPassword);
                    }
                    
                    UserDTO user = new UserDTO(0, strFullname, strPhone, "US", PasswordUtils.hashPassword(strPassword), null, null);
                    if (!checkError) {

                        UserDAO udao = new UserDAO();
                        udao.create(user);
                        session.setAttribute("user", user);
                        session.setAttribute("toastMessage", "Đăng ký thành công!");
                        session.setAttribute("toastType", "success");
                        url = HOME_PAGE;
                    } else {
                        session.setAttribute("showForm", "true");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        }finally {
            response.sendRedirect(HOME_PAGE);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
