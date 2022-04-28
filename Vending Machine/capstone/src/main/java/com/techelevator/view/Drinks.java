package com.techelevator.view;

public class Drinks extends Item{
    private String printOut = "Glug Glug, Yum!";
    private int stock = 5;
    public Drinks (String itemName, double itemCost, int stock) {
        super(itemName,itemCost);
        this.stock = stock;
    }
//   @Override
    public String getPrintOut() {
        return printOut;
    }




}

