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
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String roleID = request.getParameter("RoleID");
        String password = request.getParameter("password");
        String repeatPass = request.getParameter("repeatPass");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        
        UserDAO udao = new UserDAO();
        UserDTO checkPhone = udao.readByPhone(phone);
        UserDTO checkEmail = udao.findByEmail(email);
                
        HttpSession session = request.getSession();
        if (email.isEmpty() || password.isEmpty() || repeatPass.isEmpty() || phone.isEmpty() || roleID.isEmpty() || fullName.isEmpty() || address.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin đăng ký");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
        } else if (checkPhone != null) {
            request.setAttribute("errorMessage", "Số điện thoại đã sử dụng");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
        } else if (checkEmail != null) {
            request.setAttribute("errorMessage", "Email đã sử dụng");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
        } else if (!password.equals(repeatPass)) {
            request.setAttribute("errorMessage", "Mật khẩu nhập lại không trùng");
            request.getRequestDispatcher("create-user.jsp").forward(request, response);
        } else {
            // Xử lý thông tin đăng ký hợp lệ
            UserDTO user = new UserDTO(0, fullName, phone, roleID, PasswordUtils.hashPassword(password), email, address);
            udao.create(user);
            response.sendRedirect("IndexUserController");
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
