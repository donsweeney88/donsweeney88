package com.techelevator.dao;

import com.techelevator.model.Location;

import java.util.List;

public interface LocationDao {
    List<Location> getAllLocations();
    Location getLocationById(String locationId);
    List<Location> getLocationByKeyword(String keyword);
    List<Location>  getLocationByTime (String time, String Day);
    List<Location>  getLocationByCategory (String category);
//    boolean createLocation (String name , String description , String sundayHourOpen , String sundayHourClosed , String mondayHourOpen , String mondayHourClosed , String tuesdayHourOpen
//    , String tuesdayHourClosed , String wednesdayHourOpen , String wednesdayHourClosed , String thursdayHourOpen , String thursdayHourClosed , String fridayHourOpen , String fridayHourClosed ,
//    String saturdayHourOpen ,  String saturdayHourClosed , String socialMedia , String categories );

    boolean createLocation(Location location);
    List <String> getLocationImages(String locationId);











}