package com.techelevator;

import com.techelevator.view.Customer;
import com.techelevator.view.Item;
import com.techelevator.view.Menu;
import com.techelevator.view.Stock;

import java.io.File;
import java.sql.SQLOutput;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class VendingMachineCLI {
	private static final String PURCHASE_MENU_FEED_MONEY = "Feed Money";
	private static final String PURCHASE_MENU_SELECT_PRODUCT = "Select Product";
	private static final String PURCHASE_MENU_FINISH_TRANSACTION = "Finish Transaction";
	private static final String[] PURCHASE_MENU_OPTIONS = { PURCHASE_MENU_FEED_MONEY, PURCHASE_MENU_SELECT_PRODUCT,
			PURCHASE_MENU_FINISH_TRANSACTION};

	public static Customer customer = new Customer();

	private static final String MAIN_MENU_OPTION_DISPLAY_ITEMS = "Display Vending Machine Items";
	private static final String MAIN_MENU_OPTION_PURCHASE = "Purchase";
	private static final String MAIN_MENU_OPTION_EXIT = "Exit";
	private static final String[] MAIN_MENU_OPTIONS = { MAIN_MENU_OPTION_DISPLAY_ITEMS,
			MAIN_MENU_OPTION_PURCHASE, MAIN_MENU_OPTION_EXIT };

	 Scanner userInput = new Scanner(System.in);

	private Menu menu;
	boolean finishedTransaction = true;
	boolean isRunning = true;
	// To loop into Purchase menu


	NumberFormat formatter = NumberFormat.getCurrencyInstance();



	public VendingMachineCLI(Menu menu) {
		this.menu = menu;
	}

	public void run() {

		Item item = new Item();
		Stock stock = new Stock();
		stock.parseItems();

		while (isRunning == true) {
			String choice = (String) menu.getChoiceFromOptions(MAIN_MENU_OPTIONS);

			if (choice.equals(MAIN_MENU_OPTION_DISPLAY_ITEMS)) {
				System.out.println(stock.getMapOfItems());

			} else {
				finishedTransaction = true;
				while (finishedTransaction) {

					if (choice.equals(MAIN_MENU_OPTION_PURCHASE)) {

						String secondChoice = (String) menu.getChoiceFromOptions(PURCHASE_MENU_OPTIONS);

						if (secondChoice.equals(PURCHASE_MENU_FEED_MONEY)) {
							System.out.println();
							System.out.print("Amount to feed in $");

							double moneyDeposited = Double.parseDouble(userInput.nextLine());
							customer.moneyFeed(moneyDeposited);

							//Add fed money to log
							customer.updateLog("FEED MONEY: " + formatter.format(moneyDeposited) + " "
									+ formatter.format( customer.getCurrentBalance() ));

						} else if (secondChoice.equals(PURCHASE_MENU_SELECT_PRODUCT)) {


							System.out.println();
							System.out.println(stock.getMapOfItems());
							System.out.println();

							System.out.print("Make Your Selection >>> ");

							String selection = userInput.nextLine();


							if (!stock.mapOfItems.containsKey(selection) || stock.mapOfItems.get(selection).getStock() == 0) {
								if (!stock.mapOfItems.containsKey(selection)) {
									System.out.println();
									System.out.println("*** Invalid Selection.  Please Try Again ***");


								} else {
									System.out.println();
									System.out.println("*** Sold Out ***");

								}
							} else {
								if (stock.mapOfItems.get(selection).getItemCost() < customer.getCurrentBalance()) {
									System.out.println(stock.mapOfItems.get(selection).getItemName() + " " +
											stock.mapOfItems.get(selection).getItemCost());

									//adds item purchased to log.
									customer.updateLog(stock.mapOfItems.get(selection).getItemName() + " "
											+ stock.mapOfItems.get(selection).getItemLocation() + " "
											+ formatter.format(customer.getCurrentBalance()) + " "
											+ formatter.format((customer.getCurrentBalance() - stock.mapOfItems.get(selection).getItemCost())));

									customer.spendMoney(stock.mapOfItems.get(selection).getItemCost());

									stock.mapOfItems.get(selection).itemSold();

									System.out.println(stock.mapOfItems.get(selection).getPrintOut());



								} else {
									System.out.println();
									System.out.println("*** Insufficient Funds ***");
								}
							}


						} else if (secondChoice.equals(PURCHASE_MENU_FINISH_TRANSACTION)) {
							//Dispenses remaining balance as change
							finishedTransaction = false;
							double previousBalance = customer.getCurrentBalance();
							customer.finishedTransaction();
							System.out.println();
							System.out.println("*** Dispensing Change ***");
							System.out.println();
							System.out.println(customer.finishedTransaction());
							customer.spendMoney(customer.getCurrentBalance());
							System.out.println("Current Balance: " + formatter.format(customer.getCurrentBalance()));

							//adds transaction to log
							customer.updateLog("GIVE CHANGE: " + formatter.format(previousBalance) + " "
									+ formatter.format(customer.getCurrentBalance()));
						}

					} else if (choice.equals(MAIN_MENU_OPTION_EXIT)) {
						isRunning= false;
						break;
					}
				}
			}
		}isRunning= false;
	}

	public static void main(String[] args) {
		Menu menu = new Menu(System.in, System.out);
		VendingMachineCLI cli = new VendingMachineCLI(menu);
		cli.run();
	}
}
