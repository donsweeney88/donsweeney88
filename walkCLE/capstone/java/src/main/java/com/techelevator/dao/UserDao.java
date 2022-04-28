package com.techelevator.dao;

import com.techelevator.model.CheckIn;
import com.techelevator.model.User;

import java.util.List;

public interface UserDao {

    List<User> findAll();

    User getUserById(Long userId);

    User findByUsername(String username);

    int findIdByUsername(String username);

    boolean create(String username, String password, String role);

    void checkIn(CheckIn checkIn);

    List<CheckIn> getCheckInsByUser(long userID);
}
