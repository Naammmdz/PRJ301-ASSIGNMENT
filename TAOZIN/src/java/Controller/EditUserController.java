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
@WebServlet(name = "EditUserController", urlPatterns = {"/EditUserController"})
public class EditUserController extends HttpServlet {

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
        String method = request.getMethod();
        if ("GET".equalsIgnoreCase(method)) {
            handleGet(request, response);
        } else if ("POST".equalsIgnoreCase(method)) {
            handlePost(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Phương thức không được hỗ trợ");
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
    private void handleGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String userID = request.getParameter("userID");
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(userID);
        session.setAttribute("userEdit", user);
        request.getRequestDispatcher("edit-user.jsp").include(request, response);
    }
    
    private void handlePost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String roleID = request.getParameter("RoleID");
        String password = request.getParameter("password");
        String repeatPass = request.getParameter("repeatPass");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int userID = Integer.parseInt(request.getParameter("userID"));
        UserDAO udao = new UserDAO();
        UserDTO checkPhone = udao.readByPhone(phone);
        UserDTO checkEmail = udao.findByEmail(email);
        UserDTO userOld = udao.readById(request.getParameter("userID"));
        

        if (email.isEmpty() || password.isEmpty() || repeatPass.isEmpty() || phone.isEmpty() || roleID.isEmpty() || fullName.isEmpty() || address.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin cập nhật");
            request.getRequestDispatcher("edit-user.jsp").forward(request, response);
        } else if (checkPhone != null && !userOld.getPhone().equals(checkPhone.getPhone())) {
            request.setAttribute("errorMessage", "Số điện thoại đã sử dụng");
            request.getRequestDispatcher("edit-user.jsp").forward(request, response);
        } else if (checkEmail != null && !userOld.getEmail().equals(checkEmail.getEmail())) {
            request.setAttribute("errorMessage", "Email đã sử dụng");
            request.getRequestDispatcher("edit-user.jsp").forward(request, response);
        } else if (!password.equals(repeatPass)) {
            request.setAttribute("errorMessage", "Mật khẩu nhập lại không trùng");
            request.getRequestDispatcher("edit-user.jsp").forward(request, response);
        } else {
            // Xử lý thông tin hợp lệ
            UserDTO user = new UserDTO(userID, fullName, phone, roleID, PasswordUtils.hashPassword(password), email, address);
            udao.update(user);
            response.sendRedirect("IndexUserController");
        }
    }
}
