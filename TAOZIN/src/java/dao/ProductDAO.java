/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Naammm
 */
public class ProductDAO implements IDAO<ProductDTO, Integer>{

    @Override
    public boolean create(ProductDTO entity) {
            String sql = "INSERT INTO tblProducts (productName, description, price, stockQuantity, productView, categoryID, created_at, thumbnail) " +
                 "VALUES (?, ?, ?, ?, 0, ?, GETDATE(), ?)";

            try {
                Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setNString(1, entity.getProductName());
                ps.setNString(2, entity.getDescription());
                ps.setDouble(3, entity.getPrice());
                ps.setInt(4, entity.getStockQuantity());
                ps.setInt(5, entity.getCategoryID());
                ps.setString(6, entity.getThumbnail());

                return ps.executeUpdate() > 0;

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return false;
    }

    @Override
    public List<ProductDTO> readAll() {
        List<ProductDTO> productList = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("productView"),
                    rs.getInt("categoryID"),
                    rs.getString("created_at"),
                    rs.getString("thumbnail")
            );
                productList.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

    @Override
    public ProductDTO readById(Integer id) {
        String sql = "SELECT * FROM tblProducts WHERE productID= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ProductDTO user = new ProductDTO(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("productView"),
                    rs.getInt("categoryID"),
                    rs.getString("created_at"),
                    rs.getString("thumbnail")
                );
                return user;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(ProductDTO entity) {
       String sql = "UPDATE tblProducts SET productName=?, description=?, price=?, stockQuantity=?, categoryID=?, thumbnail=? WHERE productID=?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, entity.getProductName());
            ps.setString(2, entity.getDescription());
            ps.setDouble(3, entity.getPrice());
            ps.setInt(4, entity.getStockQuantity());
            ps.setInt(5, entity.getCategoryID());
            ps.setString(6, entity.getThumbnail());
            ps.setInt(7, entity.getProductID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false; 
    }

    @Override
    public boolean delete(Integer id) {
        String sql = "DELETE FROM [tblProducts] WHERE [productID] = ?";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<ProductDTO> search(String searchTerm) {
        List<ProductDTO> result = new ArrayList<>();
    String sql = "SELECT * FROM tblProducts WHERE productName LIKE ? OR description LIKE ? OR productID LIKE ?";

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        String param = "%" + searchTerm + "%";
        ps.setString(1, param);
        ps.setString(2, param);
        ps.setString(3, param);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getInt("stockQuantity"),
                        rs.getInt("productView"),
                        rs.getInt("categoryID"),
                        rs.getString("created_at"),
                        rs.getString("thumbnail")
                );
                result.add(product);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
    }

    public List<ProductDTO> readByCategory(int categoryID) {
        List<ProductDTO> productList = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts WHERE categoryID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("productView"),
                    rs.getInt("categoryID"),
                    rs.getString("created_at"),
                    rs.getString("thumbnail")
                );
                productList.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
    
    public List<ProductDTO> readHot() {
        List<ProductDTO> productList = new ArrayList<>();
        String sql = "SELECT TOP 7 * FROM tblProducts ORDER BY created_at DESC";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("productView"),
                    rs.getInt("categoryID"),
                    rs.getString("created_at"),
                    rs.getString("thumbnail")
                );
                productList.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
    
    public List<ProductDTO> readHotByCategory(int categoryID) {
        List<ProductDTO> productList = new ArrayList<>();
        String sql = "SELECT TOP 7 * FROM tblProducts WHERE categoryID = ? ORDER BY created_at DESC";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("stockQuantity"),
                    rs.getInt("productView"),
                    rs.getInt("categoryID"),
                    rs.getString("created_at"),
                    rs.getString("thumbnail")
                );
                productList.add(product);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
    
    public List<String> getProductImages(int productID) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT imageURL FROM tblProductImages WHERE productID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("imageURL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return images;
    }

    public String getProductNameById(int productID) {
        String sql = "SELECT productName FROM tblProducts WHERE productID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("productName");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return "Không xác định";
    }
    
    
    
}


