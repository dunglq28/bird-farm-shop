package Obj;

import Models.BirdDTO;
import java.util.HashMap;
import java.util.Map;

public class Birds {
    private Map<String, BirdDTO> items;

    public Map<String, BirdDTO> getItems() {
        return items;
    }

    BirdDTO dto = new BirdDTO();
    
    public void addItemToCart(String sku, int quantityBuy, float price , String img, String name) { // (String sku, int quantity)
        BirdDTO dto = new BirdDTO(name, img, quantityBuy, price);
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
            quantityBuy = this.items.get(sku).getQuantiry() + quantityBuy;
        }
        dto.setQuantiry(quantityBuy);
        // 3. Update items
        this.items.put(sku, dto);
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
            }
            else {
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
}
