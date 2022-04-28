package com.techelevator.view;

public class Gum extends Item{
    private String printOut = "Chew Chew, Yum!";
    private int stock = 5;
    public Gum (String itemName, double itemCost, int stock) {
        super(itemName,itemCost);
        this.stock = stock;
    }
//@Override
    public String getPrintOut() {
        return printOut;
    }




}

