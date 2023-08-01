package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListAdsDao implements Ads {
    private List<Ad> ads;

    public List<Ad> all() {
        if (ads == null) {
            ads = generateAds();
        }
        return ads;
    }

    @Override
    public Long insert(Ad ad) {
        return null;
    }

    @Override
    public void setCategories(long index, String category) throws SQLException {

    }

    @Override
    public List<Ad> searchAds(String term) throws SQLException {
        return null;
    }

    @Override
    public Ad updateAd(Ad ad) {
        return null;
    }

    @Override
    public Ad findAdByID(long adId) {
        return null;
    }

    @Override
    public List<Ad> userAds(long id) {
        return null;
    }

    @Override
    public void deleteAd(long adId) {

    }

    private List<Ad> generateAds() {
        List<Ad> ads = new ArrayList<>();
        ads.add(new Ad(
                1,
                1,
                "playstation for sale",
                "This is a slightly used playstation"
        ));
        ads.add(new Ad(
                2,
                1,
                "Super Nintendo",
                "Get your game on with this old-school classic!"
        ));
        ads.add(new Ad(
                3,
                2,
                "Junior Java Developer Position",
                "Minimum 7 years of experience required. You will be working in the scripting language for Java, JavaScript"
        ));
        ads.add(new Ad(
                4,
                2,
                "JavaScript Developer needed",
                "Must have strong Java skills"
        ));
        return ads;
    }
}