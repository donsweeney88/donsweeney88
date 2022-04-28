import com.techelevator.view.Item;
import com.techelevator.view.Stock;
import org.junit.Assert;
import org.junit.Test;



public class StockTesting {
    Stock stock = new Stock();
    @Test

    public void return_item_that_does_exist () {
        String selection = "A1";
            stock.parseItems();
            double actual = stock.mapOfItems.get(selection).getItemCost();


        Assert.assertEquals(3.05, actual, 0.001);



    }
    @Test

    public void return_item_that_does_not_exist () {
        String selection = "A5";
        stock.parseItems();
        Item actual = stock.mapOfItems.get(selection);


        Assert.assertEquals(null, actual);



    }

}
