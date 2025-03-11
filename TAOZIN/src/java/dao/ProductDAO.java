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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProductDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
}


