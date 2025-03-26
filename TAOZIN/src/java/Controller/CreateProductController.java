/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

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
        HttpSession session = request.getSession();

        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("txtImage");

        // Kiểm tra rỗng
        if (productName == null || productName.isEmpty() ||
            description == null || description.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin");
            request.getRequestDispatcher("create-product.jsp").forward(request, response);
            return;
        }

        // Kiểm tra price
        String priceStr = request.getParameter("price");
        System.out.println("priceStr");
        double price = 0;
        if (priceStr == null || priceStr.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập giá sản phẩm");
            request.getRequestDispatcher("create-product.jsp").forward(request, response);
            return;
        } else {
            price = Double.parseDouble(priceStr);
        }

        // Kiểm tra stockQuantity
        String stockQuantityStr = request.getParameter("stockQuantity");
        int stockQuantity = 0;
        if (stockQuantityStr == null || stockQuantityStr.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập số lượng");
            request.getRequestDispatcher("create-product.jsp").forward(request, response);
            return;
        } else {
            stockQuantity = Integer.parseInt(stockQuantityStr);
        }

        // Kiểm tra categoryID
        String categoryStr = request.getParameter("categoryID");
        int categoryId = 0;
        if (categoryStr == null || categoryStr.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng chọn danh mục sản phẩm");
            request.getRequestDispatcher("create-product.jsp").forward(request, response);
            return;
        } else {
            categoryId = Integer.parseInt(categoryStr);
        }

        // Tạo product
        ProductDTO product = new ProductDTO(0, productName, description, price, stockQuantity, 0, categoryId, null, thumbnail);
        ProductDAO pdao = new ProductDAO();
        pdao.create(product);
        // Chuyển hướng sau khi tạo thành công
        response.sendRedirect("SearchProductController?searchProduct=");
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
