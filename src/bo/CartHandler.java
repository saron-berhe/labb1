package bo;

import ui.CartInfo;

import java.util.ArrayList;
import java.util.Collection;

public class CartHandler {
    private Cart cart = new Cart();

    public void addItem(int itemId) {
        cart.addItem(itemId);
    }

    public void removeItem(int itemId) {
        cart.removeItem(itemId);
    }

    public Collection<CartInfo> getItems() {
        ArrayList<CartInfo> result = new ArrayList<CartInfo>();
        for (int itemId : cart.getItemIds()) {
            result.add(new CartInfo(itemId,
                    cart.getName(itemId),
                    cart.getPrice(itemId),
                    cart.getQuantity(itemId)));
        }
        return result;
    }

    public double getTotal() {
        return cart.getTotal();
    }

    public boolean isEmpty() {
        return cart.isEmpty();
    }
}