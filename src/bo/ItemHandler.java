package bo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import ui.ItemInfo;

public class ItemHandler {
    public static Collection<ItemInfo> getItemsWithGroup(String s) {
        Collection c = Item.searchItems(s);
        ArrayList<ItemInfo> items = new ArrayList<ItemInfo>();
        for (Iterator it = c.iterator(); it.hasNext();) {
            Item item = (Item) it.next();
            items.add(new ItemInfo(item.getItemId(), item.getName(), item.getPrice()));
        }
        return items;
    }
}
