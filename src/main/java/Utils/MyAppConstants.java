/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author Kieu Trong Khanh
 */
public class MyAppConstants {

    public class PublicFeatures {

        public static final String HOME_PAGE = "/views/public/home.jsp";
        public static final String ERROR_PAGE = "/views/errors/error.html";
    }

    public class AuthFeatures {

        public static final String LOGIN_PAGE = "/views/auth/login.jsp";
        public static final String REGISTER_PAGE = "/views/auth/register.jsp";
        public static final String SEND_MAIL_CONTROLLER = "AuthSentEmailServlet";
    }

    public class Google {

        public static final String GOOGLE_CLIENT_ID = "1070154375273-hib2mbbkpbb47ral7kt3s763c25piprp.apps.googleusercontent.com";
        public static final String GOOGLE_CLIENT_SECRET = "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";
        public static final String GOOGLE_REDIRECT_URI = "http://localhost:8084/BirdFarmShop/login-google";
        public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
        public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
        public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    }

    public class FaceBook {

        public static final String FACEBOOK_APP_ID = "318980067328061";
        public static final String FACEBOOK_APP_SECRET = "da61c801d71ddd0c70598bb7f7cfe5cf";
        public static final String FACEBOOK_REDIRECT_URL = "http://localhost:8084/BirdFarmShop/login-facebook";
        public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    }

}
