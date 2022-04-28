package com.techelevator.view;

public class Candy extends Item{
    private int stock = 5;
    private String printOut = "Munch Munch, Yum!";
    public Candy (String itemName, double itemCost, int stock) {
        super(itemName,itemCost);
        this.stock = stock;
    }
//@Override
    public String getPrintOut() {
        return printOut;
    }




}
