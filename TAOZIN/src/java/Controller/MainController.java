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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Naammm
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "main.jsp";
    
    public UserDTO getUser(String strPhone) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByPhone(strPhone);
        return user;
    }
    
    public boolean isValidLogin(String strPhone, String strPassword) {
        UserDTO user = getUser(strPhone);
        System.out.println(user);
//        System.out.println(user.getPassword());
        System.out.println(strPassword);
        return user != null && user.getPassword().equals(strPassword);
    }    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = HOME_PAGE;
            } else {
                if (action.equals("login")) {
                    String strPhone = request.getParameter("phone");
                    String strPassword = request.getParameter("password");
                    if(isValidLogin(strPhone, strPassword)){
                        url = HOME_PAGE;
                        UserDTO user = getUser(strPhone);
                        request.setAttribute("toastMessage", "Đăng nhập thành công");
                        request.setAttribute("toastType", "success");
                        request.getSession().setAttribute("user", user);
                    }else if (getUser(strPhone) == null){
                        request.setAttribute("toastMessage", "Tài khoản không tồn tại!");
                        request.setAttribute("toastType", "error");
                        request.setAttribute("showLogin", "true");
                        request.setAttribute("showForm", "true");
                        request.setAttribute("showLogin", "true");                        
                    }else{
                        request.setAttribute("toastMessage", "Sai mật khẩu!");
                        request.setAttribute("toastType", "warning");
                        request.setAttribute("showForm", "true");
                        request.setAttribute("showLogin", "true");
                    }
                }else  if (action.equals("logout")) {
                    request.getSession().invalidate(); // Hủy bỏ session
                    url = HOME_PAGE;
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        }finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response) ;
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
