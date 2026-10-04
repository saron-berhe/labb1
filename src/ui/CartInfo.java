package ui;

public class CartInfo {
    private int itemId;
    private String name;
    private double price;
    private int quantity;

    public CartInfo(int itemId, String name, double price, int quantity) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public int getItemId() {
        return itemId;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getItemsTotal() {
        return price * quantity;
    }
}
