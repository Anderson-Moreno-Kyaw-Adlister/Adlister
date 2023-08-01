package com.codeup.adlister.dao;


import com.codeup.adlister.Config;

public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;
    private static  Config configObj= new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(configObj);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(configObj);
        }
        return usersDao;
    }

}
