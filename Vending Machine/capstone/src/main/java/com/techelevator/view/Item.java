package com.techelevator.view;

import java.io.File;
import java.util.Scanner;

public class Item {
    private String itemLocation = "";
    private String itemName = "";
    private double itemCost = 0.00;
    private String itemType = "";
    private int stock = 5;
    private String printOut = " ";

    public Item(String itemName, double itemCost) {
        this.itemLocation = itemLocation;
        this.itemName = itemName;
        this.itemCost = itemCost;
        this.itemType = itemType;
        this.stock = stock;
    }

    public Item() {};
    // remove below
    public String getPrintOut() {
        return printOut;
    }
//    //remove above

    public String getItemLocation() {
        return itemLocation;
    }

    public String getItemName() {
        return itemName;
    }

    public double getItemCost() {
        return itemCost;
    }

    public String getItemType() {
        return itemType;
    }

    public int getStock() {
        return stock;
    }
    public void itemSold () {
        if (stock == 0) {
            System.out.println("Sold Out");
        }
        else stock--;
    }
}
