/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author hj
 */
public class FormatCurrency {
    public static String FormatPrice (float price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String priceFormat = currencyVN.format(price);
        return priceFormat;
    }
}
