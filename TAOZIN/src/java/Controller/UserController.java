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
import utils.AuthUtils;
import utils.PasswordUtils;

/**
 *
 * @author Naammm
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private static final String HOME_PAGE = "HomeController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            if (AuthUtils.isLoggedIn(session)) {
                String action = request.getParameter("action");
                UserDTO user = (UserDTO)  session.getAttribute("user");
                if ("info".equals(action)) {
                    String url = "user.jsp";
                    String fullName = request.getParameter("txtFullName");
                    String email = request.getParameter("txtEmail");
                    String address = request.getParameter("txtAddress");

                    // Khởi tạo biến để kiểm tra lỗi
                    boolean hasError = false;
                    if (fullName == null || fullName.trim().isEmpty()) {
                        request.setAttribute("txtFullName_error", "Vui lòng nhập họ và tên!");
                        hasError = true;
                    }

                    // Validate email
                    if (email== null || !isValidEmail(email)) {
                        request.setAttribute("txtEmail_error", "Vui lòng nhập địa chỉ email hợp lệ.");
                        hasError = true;
                    }

                    if (address== null || address.trim().length() < 5) {
                        request.setAttribute("txtUserAddress_error", "Địa chỉ không hợp lệ.");
                        hasError = true;
                    }

                    if (hasError) {
                        request.getRequestDispatcher(url).forward(request, response);
                        return;
                    }

                    // Kiểm tra xem Email đã tồn tại chưa
                    UserDAO userDAO = new UserDAO();
                    UserDTO existingEmail = userDAO.findByEmail(email);

                    if (existingEmail != null && existingEmail.getUserID() != user.getUserID()) {
                        request.setAttribute("txtEmail_error", "Email đã được sử dụng. Vui lòng chọn email khác.");
                        request.getRequestDispatcher(url).forward(request, response);
                        return;
                    }

                    
                    user.setFullName(fullName);
                    user.setEmail(email);
                    user.setAddress(address);
                    boolean result = userDAO.update(user);
                    System.out.println(user);
                    if (result) {
                        session.setAttribute("user", user);
                        session.setAttribute("toastMessage", "Cập nhật thành công!");
                        session.setAttribute("toastType", "success");
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        session.setAttribute("toastMessage", "Cập nhật thất bại!");
                        session.setAttribute("toastType", "error");
                        request.getRequestDispatcher(url).forward(request, response);
                    }
                } else if ("change".equals(action)) {
                    String url = "user.jsp";
                    String oldPassword = request.getParameter("oldPassword");
                    String newPassword = request.getParameter("newPassword");
                    String confirmPassword = request.getParameter("confirmPassword");
                    
                    boolean hasError = false;
                    
                    if (oldPassword == null || oldPassword.trim().isEmpty()) {
                        request.setAttribute("oldPassword_error", "Vui lòng nhập mật khẩu cũ.");
                        hasError = true;
                    }
                    
                    if (newPassword == null || newPassword.length() < 6) {
                        request.setAttribute("newPassword_error", "Mật khẩu mới phải có ít nhất 6 ký tự.");
                        hasError = true;
                    }
                    
                    if (!newPassword.equals(confirmPassword)) {
                        request.setAttribute("confirmPassword_error", "Mật khẩu xác nhận không khớp.");
                        hasError = true;
                    }
                    
                    if (hasError) {
                        request.getRequestDispatcher(url).forward(request, response);
                        return;
                    }
                    
                    UserDAO userDAO = new UserDAO();
                    String storedPassword = userDAO.getPasswordByUserID(user.getUserID());
                    System.out.println(oldPassword);
                    System.out.println(storedPassword);
                    if (!PasswordUtils.verifyPassword(oldPassword, storedPassword)) {
                        request.setAttribute("oldPassword_error", "Mật khẩu cũ không đúng.");
                        request.getRequestDispatcher(url).forward(request, response);
                        return;
                    }
                    
                    String hashedPassword = PasswordUtils.hashPassword(newPassword);
                    boolean result = userDAO.updatePassword(user.getUserID(), hashedPassword);
                    
                    if (result) {
                        session.setAttribute("toastMessage", "Đổi mật khẩu thành công!");
                        session.setAttribute("toastType", "success");
                    } else {
                        session.setAttribute("toastMessage", "Đổi mật khẩu thất bại!");
                        session.setAttribute("toastType", "error");
                    }
                    
                    request.getRequestDispatcher(url).forward(request, response);
                }
            } else {
                response.sendRedirect("HomeController");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
    private boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }
}
