import com.techelevator.view.Customer;
import org.junit.Assert;
import org.junit.Test;

public class CustomerTesting {
    Customer customer = new Customer();
    @Test

    public void feed_money_positive_integer () {
       // Arrange

        double feedMoneyTest = 5.50;

        //Act
        customer.moneyFeed(feedMoneyTest);
        double actual = customer.getCurrentBalance();

        //Assert
        Assert.assertEquals(5.50, actual, 0.001);
    }
    @Test

    public void feed_money_negative_integer () {
        // Arrange

        double feedMoneyTest = -5.50;

        //Act
        customer.moneyFeed(feedMoneyTest);
        double actual = customer.getCurrentBalance();

        //Assert
        Assert.assertEquals(0, actual, 0.001);
    }
    @Test

    public void feed_money_null () {
        // Arrange

        double feedMoneyTest = 0;

        //Act
        customer.moneyFeed(feedMoneyTest);
        double actual = customer.getCurrentBalance();

        //Assert
        Assert.assertEquals(0, actual, 0.001);
    }

    @Test
    public void spend_money_insufficient_funds() {
        double spendInsufficientMoney = 5.00;
                customer.spendMoney(spendInsufficientMoney);
                double actual = customer.getCurrentBalance();

                Assert.assertEquals(0, actual, 0.001);
    }
    @Test
    public void spend_money_sufficient_funds() {
        double spendInsufficientMoney = 5.00;
        customer.moneyFeed(10.00);
        customer.spendMoney(spendInsufficientMoney);
        double actual = customer.getCurrentBalance();

        Assert.assertEquals(5.00, actual, 0.001);
    }

    @Test
    public void finished_transaction_returns_proper_coins() {
        customer.moneyFeed(1.15);
        String actual = customer.finishedTransaction();
        String expected = "Quarters Dispensed: 4\nDimes Dispensed: 1\nNickels Dispensed: 1\n";

        Assert.assertEquals(expected, actual);

    }

    @Test
    public void finished_transaction_returns_proper_coins_zero_balance() {
        customer.moneyFeed(0);
        String actual = customer.finishedTransaction();
        String expected = "";

        Assert.assertEquals(expected, actual);

    }

}
