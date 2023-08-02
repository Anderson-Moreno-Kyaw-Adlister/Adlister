package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    //New method adds ad index and selected category to add_cat table
    public void setCategories(long index, String category) throws SQLException {
        String query = "SELECT id FROM categories WHERE category = ?";

        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, category);

        ResultSet rs = stmt.executeQuery();

        rs.next();
        long cat_id = rs.getLong("id");

        String addQuery = "INSERT INTO ad_cat(ad_id, cat_id) VALUES (?, ?)";
        stmt = connection.prepareStatement(addQuery);
        stmt.setLong(1, index);
        stmt.setLong(2, cat_id);

        stmt.executeUpdate();
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    //Created new method to only display containing key words
    public List<Ad> searchAds (String term) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads " +
                "WHERE id IN (" +
                    "SELECT ad_id " +
                    "FROM ad_cat " +
                    "WHERE cat_id in (" +
                        "SELECT id " +
                        "FROM categories " +
                        "WHERE category LIKE ?)) OR " +
                        "title LIKE ? OR description LIKE ?");


        stmt.setString(1, term);
        stmt.setString(2, "%"+term+"%");
        stmt.setString(3, "%"+term+"%");

        ResultSet rs = stmt.executeQuery();
        return createAdsFromResults(rs);
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
    public List<Ad> userAds(long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
    public Ad findAdByID(long id) {
        String query = "SELECT * FROM ads WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a ad by ID", e);
        }
    }
//    Updating ads by user
    @Override
    public Ad updateAd(Ad ad) {
        String query = "UPDATE ads SET title = ?, description = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating Ad", e);
        }
        return ad;
    }
    @Override
    public void deleteAd(long adId){
        String query = "DELETE FROM ads WHERE id = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            stmt.execute();
        }catch(SQLException e){
            throw new RuntimeException("Error deleting ad");
        }
    }

}
