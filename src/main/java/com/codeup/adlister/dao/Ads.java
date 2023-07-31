package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    void setCategories(long index, String category) throws SQLException;
    List<Ad> searchAds(String term) throws SQLException;
    Ad updateAd(Ad ad);

    Ad findAdByID(long adId);

    List<Ad> userAds(long id);

    void deleteAd(long adId);
}
