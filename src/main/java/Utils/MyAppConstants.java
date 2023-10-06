package Utils;

public class MyAppConstants {

    public class PublicFeatures {

        public static final String HOME_CONTROLLER = "home";
        public static final String HOME_PAGE = "/views/public/home.jsp";
        public static final String ERROR_PAGE = "/views/errors/error.html";
        public static final String CART_PAGE = "/views/public/cart.jsp";
        public static final String SHOPPING_PAGE = "/views/public/shop.jsp";
        public static final String PRODUCT_DETAIL_PAGE = "/views/public/singleProduct.jsp";
        public static final String PRODUCT_LIST_CONTROLLER = "product-list";
        public static final String ADD_TO_CART_CONTROLLER = "add-bird";
        public static final String PAYMENT_PAGE = "/views/public/payment.jsp";
        public static final String CHECKOUT_SUCCESS_CONTROLLER = "Sucessful";
        public static final String INFO_RECEIVE_CONTROLLER = "shipping";

    }

    public class AuthFeatures {

        public static final String LOGIN_PAGE = "/views/auth/login.jsp";
        public static final String REGISTER_PAGE = "/views/auth/register.jsp";
        public static final String FORGET_PASS_PAGE = "/views/auth/forgetpass.jsp";
        public static final String RESET_PASS_PAGE = "/views/auth/resetPass.jsp";
        public static final String FORGET_PASS_CONTROLLER = "forgetPass";
        public static final String RESET_PASS_CONTROLLER = "AuthResetPassServlet";
        public static final String LOGOUT_CONTROLLER = "AuthLogoutServlet";
    }

    public class CustomerFeatures {

        public static final String RECEIVING_INFO_PAGE = "/views/customer/shipping.jsp";
        public static final String MY_ORDER_PAGE = "/views/customer/myOrder.jsp";
        public static final String MY_ORDER_CONTROLLER = "Order";

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
