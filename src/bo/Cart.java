package bo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, Integer> quantities = new HashMap<Integer, Integer>();
    private Map<Integer, String> names = new HashMap<Integer, String>();
    private Map<Integer, Double> prices = new HashMap<Integer, Double>();

    public void addItem(int itemId) {
        Integer q = quantities.get(itemId);
        if (q != null) {
            quantities.put(itemId, q + 1);
            return;
        }

        for (Object o : Item.searchItems("")) {
            Item item = (Item) o;
            if (item.getItemId() == itemId) {
                quantities.put(itemId, 1);
                names.put(itemId, item.getName());
                prices.put(itemId, item.getPrice());
                return;
            }
        }
    }

    public void removeItem(int itemId) {
        Integer q = quantities.get(itemId);
        if (q == null) {
            return;
        }
        if (q > 1) {
            quantities.put(itemId, q - 1);
        } else {
            quantities.remove(itemId);
            names.remove(itemId);
            prices.remove(itemId);
        }
    }

    public Collection<Integer> getItemIds() {
        return new ArrayList<Integer>(quantities.keySet());
    }

    public String getName(int itemId) {
        return names.get(itemId);
    }

    public double getPrice(int itemId) {
        if (prices.containsKey(itemId)) {
            return prices.get(itemId);
        }
        return 0;
    }

    public int getQuantity(int itemId) {
        if (quantities.containsKey(itemId)) {
            return quantities.get(itemId);
        }
        return 0;
    }

    public double getTotal() {
        double total = 0;
        for (int itemId : quantities.keySet()) {
            total += prices.get(itemId) * quantities.get(itemId);
        }
        return total;
    }

    public boolean isEmpty() {
        return quantities.isEmpty();
    }
}