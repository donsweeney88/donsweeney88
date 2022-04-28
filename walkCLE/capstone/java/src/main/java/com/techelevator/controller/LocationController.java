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

@RequestMapping("/location")
public class LocationController {

    public LocationController(LocationDao locationDao, UserDao userDao) {
        this.locationDao = locationDao;
        this.userDao = userDao;
    }

    private LocationDao locationDao;

    private UserDao userDao;


    @RequestMapping(method = RequestMethod.GET)
    public List<Location> locations(){
        return locationDao.getAllLocations();
    }

    @RequestMapping(value = "/search/{keyword}", method = RequestMethod.GET)
    public List<Location> keywordLocations(@PathVariable String keyword) {
        return locationDao.getLocationByKeyword(keyword);
    }

    @RequestMapping(value = "/time/{time}/{day}", method = RequestMethod.GET)
    public List<Location> timeLocations(@PathVariable String time, @PathVariable String day) {
        return locationDao.getLocationByTime(time, day);
    }

    @RequestMapping(value = "/{locationId}", method = RequestMethod.GET)
    public  Location idLocations(@PathVariable String locationId) {
        return locationDao.getLocationById(locationId);
    }

    @RequestMapping(value = "/category/{category}", method = RequestMethod.GET)
    public List<Location> categoryLocations(@PathVariable String category) {
        return locationDao.getLocationByCategory(category);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/checkin", method = RequestMethod.POST)
    public void createCheckIn(@RequestBody CheckIn checkIn){
        userDao.checkIn(checkIn);
    }

    @RequestMapping(value = "/userimages/{locationId}", method = RequestMethod.GET)
    public List<String> locationImages(@PathVariable String locationId){
        return locationDao.getLocationImages(locationId);
    }
    @RequestMapping(value = "/user/{userID}", method = RequestMethod.GET)
    public List<CheckIn> checkins(@PathVariable long userID){
        return userDao.getCheckInsByUser(userID);
    }



//    @TODO
//    @RequestMapping(value = "/create", method = RequestMethod.PUT)
//    public boolean createLocations (@PathVariable String name, @PathVariable String description, @PathVariable String sundayHourOpen,
//                                    @PathVariable String sundayHourClosed, @PathVariable String mondayHourOpen,
//                                    @PathVariable String mondayHourClosed, @PathVariable String tuesdayHourOpen,
//                                    @PathVariable String tuesdayHourClosed, @PathVariable String wednesdayHourOpen,
//                                    @PathVariable String wednesdayHourClosed, @PathVariable String thursdayHourOpen,
//                                    @PathVariable String thursdayHourClosed,  @PathVariable String fridayHourOpen,
//                                    @PathVariable String fridayHourClosed, @PathVariable String saturdayHourOpen,
//                                    @PathVariable String saturdayHourClosed, @PathVariable String socialMedia,
//                                    @PathVariable String categories) {
//
//    }
}
