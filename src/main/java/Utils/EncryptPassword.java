package Utils;

import java.security.MessageDigest;
import org.apache.commons.codec.binary.Base64;

public class EncryptPassword {
     public String toSHA1(String str) {
        String key = "The Bird Farm";
        String result = null;
        str = str + key;
        try {
            byte[] datatypes = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.encodeBase64String(md.digest(datatypes));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
