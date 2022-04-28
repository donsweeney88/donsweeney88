package com.techelevator.view;

public class Chips extends Item{
    private String printOut = "Crunch Crunch, Yum!";
    private int stock = 5;
    public Chips (String itemName, double itemCost, int stock) {
        super(itemName,itemCost);
        this.stock = stock;
    }
//@Override
    public String getPrintOut() {
        return "Crunch Crunch, Yum!";
    }




}




