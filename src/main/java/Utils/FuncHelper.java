/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hj
 */
public class FuncHelper {
    public static boolean checkExist (ArrayList<String> arr, String value) {
        for (String str : arr) {
            if (str.equals(value)) {
                return true;
            }
        }
        return false;
    }
}
