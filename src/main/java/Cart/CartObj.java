package Cart;

import Models.BirdDTO;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

public class CartObj {

    private Map<String, BirdDTO> items;

    public Map<String, BirdDTO> getItems() {
        return items;
    }

    public int getItemsLength() {
        return items.size();
    }


    BirdDTO dto = new BirdDTO();

    public void addItemToCart(String sku, int quantityBuy, int quantityAvailable, float price, String img, String age, String color, String gender,
            String name, String cate_Name) { // (String sku, int quantity)
        BirdDTO dto = new BirdDTO(name, cate_Name, age, color, gender, img, quantityAvailable, quantityBuy, price, 0);
        if (sku == null) {
            return;
        }
        if (sku.trim().isEmpty()) {
            return;
        }
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        if (this.items.containsKey(sku)) {
            quantityBuy = this.items.get(sku).getQuantity_Buy()+ quantityBuy;
        }
        dto.setQuantity_Buy(quantityBuy);
        // 3. Update items
        this.items.put(sku, dto);
    }
    
    public void updateQuantityBuy(String sku, int quantityBuy) { 
        if (sku == null) {
            return;
        }
        if (sku.trim().isEmpty()) {
            return;
        }
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        if (this.items.containsKey(sku)) {
            this.items.get(sku).setQuantity_Buy(quantityBuy);
        }
    }

    public void removeBirdFromCart(String sku) { // remove All -> ass: bỏ based on quantity (String sku, int quantity)
        // 1. Check existed items - ngăn chứa đồ
        if (this.items == null) {
            return;
        }
        // 2. Check existed item
        if (this.items.containsKey(sku)) {
            // 3. Remove item from items
//            this.items.get(sku) = quantity;
            if (this.items.isEmpty()) { // Kinh nghiệm code thầy KhanhKT
                this.items = null;
            } else {
                this.items.remove(sku);
            }
//            if (this.items.get(sku).getQuantiry() == quantity
//                    || this.items.get(sku).getQuantiry() < quantity) {
//                this.items.remove(sku);
//            } else {
//                quantity = this.items.get(sku).getQuantiry() - quantity;
//                this.items.get(sku).setQuantiry(quantity);
//            }
        }
    }
    
    public void removeAllBird() { // remove All -> ass: bỏ based on quantity (String sku, int quantity)
        // 1. Check existed items - ngăn chứa đồ
        if (this.items == null) {
            return;
        }
        
        this.items.clear();
        
    }

    public Iterable<Map.Entry<String, BirdDTO>> entrySet() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    

}
