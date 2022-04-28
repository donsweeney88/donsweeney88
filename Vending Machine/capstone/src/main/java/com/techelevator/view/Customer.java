package com.techelevator.view;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Scanner;

public class Customer {
    private double currentBalance = 0.00;
    private String changeDispensedDisplay = "";
    BigDecimal bd = new BigDecimal(0);
    private String logLocation = "Log.txt";

    DecimalFormat decimalHundredths = new DecimalFormat("#.##");

    DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss aa");
    String currentDateTime = dateFormat.format(new Date()).toString();


    public String getChangeDispensedDisplay() {
        return changeDispensedDisplay;
    }

    public double getCurrentBalance() {
        return currentBalance;
    }

    public void moneyFeed(double moneyToFeed) {
        if (moneyToFeed >= 1.00) {
            currentBalance += moneyToFeed;
        } else {
            System.out.println();
            System.out.println("Balance provided must be greater than $1.00");
        }
    }

    public void spendMoney(double moneyToSpend) {
        if (currentBalance - moneyToSpend >= 0) {
            currentBalance -= moneyToSpend;
        } else {
            System.out.println();
            System.out.println("Insufficient Funds \n");
        }
    }

    public String finishedTransaction() {

        changeDispensedDisplay = "";
        BigDecimal workingBalance = BigDecimal.valueOf(currentBalance);
        final BigDecimal QUARTER = new BigDecimal(.25);
        final BigDecimal DIME = new BigDecimal(.10);
        final BigDecimal NICKEL = new BigDecimal(.05);


        BigDecimal oneLogic = new BigDecimal(1);
        BigDecimal dispensedQuarters = new BigDecimal(0);
        BigDecimal dispensedDimes = new BigDecimal(0);
        BigDecimal dispensedNickels = new BigDecimal(0);

        BigDecimal dividedQuarters = workingBalance.divide(QUARTER, BigDecimal.ROUND_DOWN);
        if (dividedQuarters.compareTo(oneLogic) >= 1) {
            BigDecimal roundedDividedQuarters = dividedQuarters.setScale(0, BigDecimal.ROUND_DOWN);
            dispensedQuarters = roundedDividedQuarters;
            workingBalance = workingBalance.subtract(dispensedQuarters.multiply(QUARTER));
            changeDispensedDisplay = changeDispensedDisplay.concat(("Quarters Dispensed: " + dispensedQuarters));

        }
        BigDecimal dividedDimes = workingBalance.divide(DIME, BigDecimal.ROUND_DOWN);
        if (dividedDimes.compareTo(oneLogic) >= 1) {
            BigDecimal roundedDividedDimes = dividedDimes.setScale(0, BigDecimal.ROUND_DOWN);
            dispensedDimes = roundedDividedDimes.setScale(0, BigDecimal.ROUND_DOWN);
            workingBalance = workingBalance.subtract(dispensedDimes.multiply(NICKEL));
            changeDispensedDisplay = changeDispensedDisplay.concat(("\nDimes Dispensed: " + dispensedDimes));

        }
        BigDecimal dividedNickels = workingBalance.divide(NICKEL, BigDecimal.ROUND_DOWN);
        if (dividedNickels.compareTo(oneLogic) >= 1) {
            BigDecimal roundedDividedNickels = dividedNickels.setScale(0, BigDecimal.ROUND_DOWN);
            dispensedNickels = roundedDividedNickels.setScale(0, BigDecimal.ROUND_DOWN);
            workingBalance = workingBalance.subtract(dispensedNickels.multiply(DIME));
            changeDispensedDisplay = changeDispensedDisplay.concat(( "\nNickels Dispensed: " +dispensedNickels +"\n"));

        }
        return changeDispensedDisplay;


    }

    public void updateLog(String newLogLine) {

        try (PrintWriter writer = new PrintWriter(new FileOutputStream(logLocation, true))) {
            writer.println(currentDateTime +" "+newLogLine);
        }

     catch(FileNotFoundException e) {
            System.out.println("File not found");;

        }
    }
}
