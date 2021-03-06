package com.techelevator.tenmo;


import com.techelevator.tenmo.model.AuthenticatedUser;
import com.techelevator.tenmo.model.Transaction;
import com.techelevator.tenmo.model.TransactionList;
import com.techelevator.tenmo.model.UserCredentials;
import com.techelevator.tenmo.services.AuthenticationService;
import com.techelevator.tenmo.services.ConsoleService;
import com.techelevator.util.InvalidUserException;
import jdk.jshell.spi.ExecutionControl;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;


import java.math.BigDecimal;
import java.util.*;

public class App {

    private static final String API_BASE_URL = "http://localhost:8080/";

    private final ConsoleService consoleService = new ConsoleService();
    private final AuthenticationService authenticationService = new AuthenticationService(API_BASE_URL);
    private final RestTemplate restTemplate = new RestTemplate();
    private AuthenticatedUser currentUser;
    private String userId = "";
    private String amount = "";
    private String transferId = "";

    Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        App app = new App();
        app.run();
    }

    private void run() {
        consoleService.printGreeting();
        loginMenu();
        if (currentUser != null) {
            mainMenu();
        }
    }

    private void loginMenu() {
        int menuSelection = -1;
        while (menuSelection != 0 && currentUser == null) {
            consoleService.printLoginMenu();
            menuSelection = consoleService.promptForMenuSelection("Please choose an option: ");
            if (menuSelection == 1) {
                handleRegister();
            } else if (menuSelection == 2) {
                handleLogin();
            } else if (menuSelection != 0) {
                System.out.println("Invalid Selection");
                consoleService.pause();
            }
        }
    }

    private void handleRegister() {
        System.out.println("Please register a new user account");
        UserCredentials credentials = consoleService.promptForCredentials();
        if (authenticationService.register(credentials)) {
            System.out.println("Registration successful. You can now login.");
        } else {
            consoleService.printErrorMessage();
        }
    }

    private void handleLogin() {
        UserCredentials credentials = consoleService.promptForCredentials();
        currentUser = authenticationService.login(credentials);
        if (currentUser == null) {
            consoleService.printErrorMessage();
        }
    }

    private void mainMenu() {
        int menuSelection = -1;
        while (menuSelection != 0) {
            consoleService.printMainMenu();
            menuSelection = consoleService.promptForMenuSelection("Please choose an option: ");
            if (menuSelection == 1) {
                viewCurrentBalance();
            } else if (menuSelection == 2) {
                viewTransferHistory();
            } else if (menuSelection == 3) {
                viewPendingRequests();
            } else if (menuSelection == 4) {
                sendBucks();
            } else if (menuSelection == 5) {
                requestBucks();
            } else if (menuSelection == 0) {
                continue;
            } else {
                System.out.println("Invalid Selection");
            }
            consoleService.pause();
        }
    }

    private void viewCurrentBalance() {
        try {
            BigDecimal balance = restTemplate.getForObject(API_BASE_URL + "user/balance/" + currentUser.getUser().getId(), BigDecimal.class);
            System.out.println("------------------------------------");
            System.out.println("Your current balance is: $" + balance);
            System.out.println("------------------------------------");
        } catch (RestClientException e) {
            consoleService.printErrorMessage();
        }

    }

    private void viewTransferHistory() {
        try {
            TransactionList transactionList = restTemplate.getForObject(API_BASE_URL + "user/" + currentUser.getUser().getId() + "/log", TransactionList.class);
            List<Transaction> transactions = new ArrayList<>();
//       for(TransactionList transactionList: transactions ) {
//                   transactions.add(transactions);
//               }
//           }
            System.out.println("------------------------------------");
            System.out.println("Transfers");
            System.out.println("ID  \t From/To  \t\t  Amount");
            System.out.println("------------------------------------");

            if (transactionList != null) {

                transactions = transactionList.getTransactions();
                String transactionHistory = "";
                for (Transaction transaction : transactions) {
                    transactionHistory = transactionHistory.concat(transaction.getTransferId() + "\t");
                    if (currentUser.getUser().getId() == getId(getUsername(transaction.getAccountTo()))) {
                        transactionHistory = transactionHistory.concat("From User: " +
                                getUsername(transaction.getAccountFrom()) + "\t $ " + transaction.getAmount() + "\n");
                    } else {
                        transactionHistory = transactionHistory.concat("To User: " +
                                getUsername(transaction.getAccountTo()) + "\t $ " + transaction.getAmount() + "\n");
                    }
                }
                System.out.println(transactionHistory);
            }
            System.out.println("---------");
            System.out.print("Please enter the transfer ID to view transaction details (0 to cancel): ");
            transferId = scanner.nextLine();
            while (transferId.equals("")) {
                System.out.print("Whoops! Please enter valid transfer ID, or 0 to cancel: ");
                transferId = scanner.nextLine();
            }
            if (transferId.equals("0")) {
                System.out.println("Your transaction was cancelled. Thank you!");
            } else {
                int transferDetailId = Integer.parseInt(transferId);
                transferDetails(transferDetailId);
            }

        } catch (RestClientException e) {
            consoleService.printErrorMessage();
        }
    }

    public void transferDetails(int transferId) {
        try {
            Transaction transaction = restTemplate.getForObject(API_BASE_URL + "user/transfer_details/" + transferId, Transaction.class);
            System.out.println("------------------------------------");
            System.out.println("Transfer Details");
            System.out.println("------------------------------------");
            String transactionDetails = "";
            transactionDetails = transactionDetails.concat("Id: " + transaction.getTransferId() + "\n" + "From: " +
                    getUsername(transaction.getAccountFrom()) + "\n" + "To: " + getUsername((transaction.getAccountTo())) + "\n" +
                    "Type: " + transaction.getTransferTypeId() + "\n" + "Status: " + transaction.getTransferStatusId() + "\n" + "Amount: $" +
                    transaction.getAmount());
            System.out.println(transactionDetails);

        } catch (RestClientException e) {
            consoleService.printErrorMessage();
        }
    }

    // OPTIONAL
    private void viewPendingRequests() {
        // TODO Auto-generated method stub

    }

    private String getUsername(int accountId) {
        String username = restTemplate.getForObject(API_BASE_URL + "user/account/" + accountId, String.class);
        return username;
    }

    private int getId(String accountName) {
        int id = restTemplate.getForObject(API_BASE_URL + "user/" + accountName, Integer.class);
        return id;
    }

    private void sendBucks() {
        // TODO create exception for string entry in place of $ in send; copy for request
        // TODO check validity of user ID's when prompted to send buck to ID (valid user id exception)
        try {
            BigDecimal currentBalance = restTemplate.getForObject(API_BASE_URL + "user/balance/" + currentUser.getUser().getId(), BigDecimal.class);
            if (currentBalance.compareTo(BigDecimal.valueOf(0)) <= 0) {
                System.out.println("You broke, broke. You don't have any TE bucks to send!");
            } else {
                Map<Long, String> mappedUsers = restTemplate.getForObject(API_BASE_URL + "/user", HashMap.class);
                System.out.println("------------------------------------");
                System.out.println("User");
                System.out.println("ID\t\t Name");
                System.out.println("------------------------------------");
                for (Map.Entry<Long, String> user : mappedUsers.entrySet()) {
                    System.out.println(user.getKey() + "\t" + user.getValue());
                }
                System.out.println("------------------------------------");
                System.out.print("Enter ID of user you are sending TE bucks to (0 to cancel): ");
                userId = scanner.nextLine();
                while (userId.equals("")) {
                    System.out.print("Please enter a valid user ID: ");
                    userId = scanner.nextLine();
                }
                if (userId.equals("0")) {
                    System.out.println("Your transaction was cancelled");
                } else {
                    while (Long.parseLong(userId) == currentUser.getUser().getId()) {
                        System.out.print("Please select a valid user, other than yourself: ");
                        userId = scanner.nextLine();
                    }
                    System.out.print("Enter the of amount of TE bucks you'd like to send: ");
                    amount = scanner.nextLine();
                    while (amount.equals("")) {
                        System.out.print("Please enter a valid amount: ");
                        amount = scanner.nextLine();
                    }
                    BigDecimal transferAmount = new BigDecimal(amount);
                    if (transferAmount.compareTo(BigDecimal.valueOf(0)) < 0) {
                        System.out.println("You cannot send a negative value. ");
                    } else {
                        while (transferAmount.compareTo(currentBalance) > 0) {
                            System.out.println("You cannot send more than your current balance of: " + currentBalance);
                            System.out.print("Please enter the of amount of TE bucks you'd like to send: ");
                            transferAmount = scanner.nextBigDecimal();
                        }
                        HttpHeaders headers = new HttpHeaders();
                        headers.setBearerAuth(currentUser.getToken());
                        HttpEntity entity = new HttpEntity(headers);
                        restTemplate.put(API_BASE_URL + "user/" + currentUser.getUser().getId()
                                + "/transfer/" + userId + "/" + transferAmount, entity);
                        System.out.println("Transaction complete. Thank you!");
                    }

                }
            }
        } catch (RestClientException e) {
            consoleService.printErrorMessage();
        }
    }

    // OPTIONAL
    private void requestBucks() {
        // TODO Auto-generated method stub

    }

}
