package com.techelevator.view;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Stock {
    private List<String> itemListing = new ArrayList<>();
    private int stock = 5;
    private String itemLocation = "";
    private String itemName = "";
    private double itemCost = 0.00;
    private String itemType = "";
    public List<String> getItemListing() {
        return itemListing;
    }
    String stockPath = "vendingmachine.csv";
    File stockInfo = new File(stockPath);


    public Map<String, Item> mapOfItems = new LinkedHashMap<>();

    public String getMapOfItems() {
            String printableMap = "";
        for (Map.Entry<String, Item> newEntry: mapOfItems.entrySet()) {
         printableMap = printableMap.concat(newEntry.getKey() + ") " + newEntry.getValue().getItemName() + ", $"
                 + newEntry.getValue().getItemCost() + ", Remaining Stock: ");
            if (newEntry.getValue().getStock() > 0) {
                printableMap = printableMap.concat(newEntry.getValue().getStock() + "\n");
            } else {
                printableMap = printableMap.concat("Sold Out" + "\n");
            }
        }
        return printableMap;
    }

    public void parseItems() {

// Takes strings from Vendingmachine.csv, parses, and places into map

        try (Scanner readStockInfo = new Scanner(stockInfo)) {
            while (readStockInfo.hasNextLine()) {
                String lineOfText = readStockInfo.nextLine();
                String[] splitText = lineOfText.split("\\|");

                itemLocation = splitText[0];
                itemName = splitText[1];
                itemCost = Double.parseDouble(splitText[2]);
                itemType = splitText[3];

                    //Logic creates map based on item type

                if(splitText[3].equals("Chip")) {
                    Item item = new Chips(splitText[1], Double.parseDouble(splitText[2]), stock);
                            mapOfItems.put(splitText[0], item);

                } else if (splitText[3].equals("Candy")) {
                    Item item = new Candy(splitText[1], Double.parseDouble(splitText[2]), stock);
                            mapOfItems.put(splitText[0], item);

                } else if (splitText[3].equals("Gum")) {
                    Item item = new Gum(splitText[1], Double.parseDouble(splitText[2]), stock);
                            mapOfItems.put(splitText[0], item);

                } else if (splitText[3].equals("Drink")) {
                    Item item = new Drinks(splitText[1], Double.parseDouble(splitText[2]), stock);
                            mapOfItems.put(splitText[0], item);
                }

            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}