/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dto.OrderItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private void handleGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<OrderItemDTO> cart = (List<OrderItemDTO>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        request.setAttribute("cart", cart);
        session.setAttribute("total", total(cart));
        session.setAttribute("totalQuantity", totalQuantity(cart));
        request.getRequestDispatcher("cart.jsp").include(request, response);
    }
    
    private void handlePost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createOrder(request);
                break;
            case "update":
                updateOrder(request);
                break;
            case "delete":
                deleteOrder(request);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Hành động không hợp lệ");
                return;
        }
        response.sendRedirect("CartController");
    }
    
    private void createOrder(HttpServletRequest request) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        double price = Double.parseDouble(request.getParameter("productPrice"));

        OrderItemDTO orderItem = new OrderItemDTO(0, quantity, price, 0, productId);
        HttpSession session = request.getSession();
        List<OrderItemDTO> cart = (List<OrderItemDTO>) session.getAttribute("cart");

        boolean isExistInCart = false;
        if (cart == null) {
            cart = new ArrayList<>();
        } else {
            for (OrderItemDTO ord : cart) {
                if (ord.getProductID() == productId) {
                    ord.setQuantity(ord.getQuantity() + quantity);
                    isExistInCart = true;
                }
            }
        }

        if (!isExistInCart) {
            cart.add(orderItem);
        }
        session.setAttribute("cart", cart);
    }
    
    private void deleteOrder(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        List<OrderItemDTO> cart = (List<OrderItemDTO>) session.getAttribute("cart");
        if (cart != null) {
            for (int i = 0; i < cart.size(); i++) {
                OrderItemDTO ord = cart.get(i);
                if (ord.getProductID() == productId) {
                    cart.remove(ord);
                }
            }
        }
        session.setAttribute("cart", cart);
    }
    
    private void updateOrder(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        List<OrderItemDTO> cart = (List<OrderItemDTO>) session.getAttribute("cart");
        if (cart != null && cart.isEmpty() == false) {
            for (OrderItemDTO ord : cart) {
                if (ord.getProductID() == productId && quantity>0) {
                    ord.setQuantity(quantity);
                } else if (ord.getProductID() == productId && quantity<=0) {
                    cart.remove(ord);
                    break;
                }
                
            }
        }
        session.setAttribute("cart", cart);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    private int total(List<OrderItemDTO> cart) {
        int totalQuantity = 0;
        int sum = 0;
        for (OrderItemDTO ods : cart) {
            sum += ods.getPrice() * ods.getQuantity();
            totalQuantity += ods.getQuantity();
        }
        return sum;
    }
    
    private int totalQuantity(List<OrderItemDTO> cart) {
        int totalQuantity = 0;
        for (OrderItemDTO ods : cart) {
            totalQuantity += ods.getQuantity();
        }
        return totalQuantity;
    }

}
