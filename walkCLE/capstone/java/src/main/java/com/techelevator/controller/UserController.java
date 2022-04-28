package com.techelevator.controller;

import com.techelevator.dao.LocationDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.CheckIn;
import com.techelevator.model.Location;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/user")
public class UserController {


    public class LocationController {

        public LocationController(LocationDao locationDao, UserDao userDao) {
            this.locationDao = locationDao;
            this.userDao = userDao;
        }

        private LocationDao locationDao;

        private UserDao userDao;

        @RequestMapping(value = "/{userID}", method = RequestMethod.GET)
        public List<CheckIn> checkins(@PathVariable long userID){
            return userDao.getCheckInsByUser(userID);
        }
    }
}
