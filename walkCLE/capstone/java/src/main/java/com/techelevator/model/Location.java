package com.techelevator.model;

import java.util.List;

public class Location {

    private Long locationId;
    private String name;
    private String description;
    private String sundayHourOpen;
    private String sundayHourClosed;
    private String mondayHourOpen;
    private String mondayHourClosed;
    private String tuesdayHourOpen;
    private String tuesdayHourClosed;
    private String wednesdayHourOpen;
    private String wednesdayHourClosed;
    private String thursdayHourOpen;
    private String thursdayHourClosed;
    private String fridayHourOpen;
    private String fridayHourClosed;
    private String saturdayHourOpen;
    private String saturdayHourClosed;
    private String socialMedia;
    private String category;
    private double latitude;
    private double longitude;


    public Location(Long locationId, String name, String description, String sundayHourOpen, String sundayHourClosed,
                    String mondayHourOpen, String mondayHourClosed, String tuesdayHourOpen, String tuesdayHourClosed,
                    String wednesdayHourOpen, String wednesdayHourClosed, String thursdayHourOpen, String thursdayHourClosed,
                    String fridayHourOpen, String fridayHourClosed, String saturdayHourOpen, String saturdayHourClosed,
                    String socialMedia, String category, double latitude, double longitude) {
        this.locationId = locationId;
        this.name = name;
        this.description = description;
        this.sundayHourOpen = sundayHourOpen;
        this.sundayHourClosed = sundayHourClosed;
        this.mondayHourOpen = mondayHourOpen;
        this.mondayHourClosed = mondayHourClosed;
        this.tuesdayHourOpen = tuesdayHourOpen;
        this.tuesdayHourClosed = tuesdayHourClosed;
        this.wednesdayHourOpen = wednesdayHourOpen;
        this.wednesdayHourClosed = wednesdayHourClosed;
        this.thursdayHourOpen = thursdayHourOpen;
        this.thursdayHourClosed = thursdayHourClosed;
        this.fridayHourOpen = fridayHourOpen;
        this.fridayHourClosed = fridayHourClosed;
        this.saturdayHourOpen = saturdayHourOpen;
        this.saturdayHourClosed = saturdayHourClosed;
        this.socialMedia = socialMedia;
        this.category = category;
        this.latitude = latitude;
        this.longitude = longitude;

    }

    public Location (){

    }

    public Long getLocationId() {
        return locationId;
    }

    public void setLocationId(Long locationId) {
        this.locationId = locationId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSundayHourOpen() {
        return sundayHourOpen;
    }

    public void setSundayHourOpen(String sundayHourOpen) {
        this.sundayHourOpen = sundayHourOpen;
    }

    public String getSundayHourClosed() {
        return sundayHourClosed;
    }

    public void setSundayHourClosed(String sundayHourClosed) {
        this.sundayHourClosed = sundayHourClosed;
    }

    public String getMondayHourOpen() {
        return mondayHourOpen;
    }

    public void setMondayHourOpen(String mondayHourOpen) {
        this.mondayHourOpen = mondayHourOpen;
    }

    public String getMondayHourClosed() {
        return mondayHourClosed;
    }

    public void setMondayHourClosed(String mondayHourClosed) {
        this.mondayHourClosed = mondayHourClosed;
    }

    public String getTuesdayHourOpen() {
        return tuesdayHourOpen;
    }

    public void setTuesdayHourOpen(String tuesdayHourOpen) {
        this.tuesdayHourOpen = tuesdayHourOpen;
    }

    public String getTuesdayHourClosed() {
        return tuesdayHourClosed;
    }

    public void setTuesdayHourClosed(String tuesdayHourClosed) {
        this.tuesdayHourClosed = tuesdayHourClosed;
    }

    public String getWednesdayHourOpen() {
        return wednesdayHourOpen;
    }

    public void setWednesdayHourOpen(String wednesdayHourOpen) {
        this.wednesdayHourOpen = wednesdayHourOpen;
    }

    public String getWednesdayHourClosed() {
        return wednesdayHourClosed;
    }

    public void setWednesdayHourClosed(String wednesdayHourClosed) {
        this.wednesdayHourClosed = wednesdayHourClosed;
    }

    public String getThursdayHourOpen() {
        return thursdayHourOpen;
    }

    public void setThursdayHourOpen(String thursdayHourOpen) {
        this.thursdayHourOpen = thursdayHourOpen;
    }

    public String getThursdayHourClosed() {
        return thursdayHourClosed;
    }

    public void setThursdayHourClosed(String thursdayHourClosed) {
        this.thursdayHourClosed = thursdayHourClosed;
    }

    public String getFridayHourOpen() {
        return fridayHourOpen;
    }

    public void setFridayHourOpen(String fridayHourOpen) {
        this.fridayHourOpen = fridayHourOpen;
    }

    public String getFridayHourClosed() {
        return fridayHourClosed;
    }

    public void setFridayHourClosed(String fridayHourClosed) {
        this.fridayHourClosed = fridayHourClosed;
    }

    public String getSaturdayHourOpen() {
        return saturdayHourOpen;
    }

    public void setSaturdayHourOpen(String saturdayHourOpen) {
        this.saturdayHourOpen = saturdayHourOpen;
    }

    public String getSaturdayHourClosed() {
        return saturdayHourClosed;
    }

    public void setSaturdayHourClosed(String saturdayHourClosed) {
        this.saturdayHourClosed = saturdayHourClosed;
    }

    public String getSocialMedia() {
        return socialMedia;
    }

    public void setSocialMedia(String socialMedia) {
        this.socialMedia = socialMedia;
    }

    public String getCategory() {
        return category;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
