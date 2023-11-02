/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author hj
 */
public class FormatCurrency {

    public static String FormatPrice(float price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String priceFormat = currencyVN.format(price);
        return priceFormat;
    }

    public static int FormatNumber(float price) {
        int priceF = (int) price;
        return priceF;
    }

    public static String FormatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY");
        return sdf.format(date);
    }

    public static int FormatDiscount(float discount) {
        int value = (int) (discount * 100);
        return value;
    }
}
