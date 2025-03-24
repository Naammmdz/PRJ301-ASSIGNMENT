/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.OrderDAO;
import dao.OrderItemDAO;
import dto.OrderDTO;
import dto.OrderItemDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Naammm
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();
    
    public static String randomString(int len) {
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
             response.sendRedirect("CartController");
        }
        OrderDAO orderDAO = new OrderDAO();
        String code = randomString(10);
        
        OrderDTO order = new OrderDTO(code, "pending", user.getUserID());
        boolean check = orderDAO.create(order);
        
        if (check) {
            order = orderDAO.findByCode(code);
            
            List<OrderItemDTO> cart = (List<OrderItemDTO>) session.getAttribute("cart");
            
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            if (cart != null) {
                for (OrderItemDTO orderItem : cart) {
                    orderItem.setOrderID(order.getOrderID()); // Gán ID của đơn hàng
                    orderItemDAO.create(orderItem);
                }
            }
            
            session.setAttribute("toastMessage", "Đặt hàng thành công!");
            session.setAttribute("toastType", "success");
            session.removeAttribute("cart");
        }
        
        response.sendRedirect("HomeController");
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
