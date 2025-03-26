/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.ProductDAO;
import dao.UserDAO;
import dto.ProductDTO;
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
@WebServlet(name = "EditProductController", urlPatterns = {"/EditProductController"})
public class EditProductController extends HttpServlet {

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
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductDAO pdao = new ProductDAO();
        ProductDTO productEdit = pdao.readById(productID);
        session.setAttribute("productEdit", productEdit);
        String searchProduct = request.getParameter("searchProduct");
        request.setAttribute("searchProduct", searchProduct);
        request.getRequestDispatcher("edit-product.jsp").include(request, response);
    }
    
    private void handlePost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("txtImage");
        String priceStr = request.getParameter("price");
        String stockQuantityStr = request.getParameter("stockQuantity");
        String categoryStr = request.getParameter("categoryID");
        String productIDStr = request.getParameter("productID");

        ProductDAO pdao = new ProductDAO();
        ProductDTO existingProduct = pdao.readById(Integer.parseInt(productIDStr));

        if (productName.isEmpty() || description.isEmpty() || priceStr.isEmpty() 
            || stockQuantityStr.isEmpty() || categoryStr.isEmpty() || thumbnail.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin sản phẩm");
            request.getRequestDispatcher("edit-product.jsp").forward(request, response);
        } else {
            double price = Double.parseDouble(priceStr);
            int stockQuantity = Integer.parseInt(stockQuantityStr);
            int categoryId = Integer.parseInt(categoryStr);
            int productID = Integer.parseInt(productIDStr);

            // Tạo đối tượng sản phẩm mới với thông tin cập nhật
            ProductDTO updatedProduct = new ProductDTO(productID, productName, description, price, stockQuantity, 0, categoryId, null, thumbnail);

            // Cập nhật thông tin sản phẩm
           pdao.update(updatedProduct);
           String searchProduct = request.getParameter("searchProduct");
           response.sendRedirect("SearchProductController?searchProduct="+searchProduct);
        }
    }
}
