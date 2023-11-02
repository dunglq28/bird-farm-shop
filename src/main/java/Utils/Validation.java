/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author hj
 */
public class Validation {

    public static boolean checkNumberGreater0(String qty) {
        if (qty != null) {
            if (!qty.isEmpty()) {
                float quantity = Float.parseFloat(qty);
                if (quantity >= 0) {
                    return true;
                }
            } else {
                return true;
            }
        } else {
            return true;
        }
        return false;
    }

}
