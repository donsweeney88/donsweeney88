import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    locations: [],
    checkIns: [],
    locationImages: [],
    locationFilter: {
      keyword: '',
      category: '',
      time: '',
      day: ''
  },
    location: {
      locationId: '',
      name: '',
      description: '',
      sundayHourOpen: '',
      sundayHourClosed: '',
      mondayHourOpen: '',
      mondayHourClosed: '',
      tuesdayHourOpen: '',
      tuesdayHourClosed: '',
      wednesdayHourOpen: '',
      wednesdayHourClosed: '',
      thursdayHourOpen: '',
      thursdayHourClosed: '',
      fridayHourOpen: '',
      fridayHourClosed: '',
      saturdayHourOpen: '',
      saturdayHourClosed: '',
      socialMedia: '',
      category: '',
      latitude: '',
      longitude: '',

    },
    checkIn: {
      userId: '',
      locationId: '',
      timeStamp: '',
      imgUrl: '',
      name: '',
      }
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_LOCATIONS(state, data) {
      state.locations = data;
    },
    SET_LOCATION(state, data) {
      state.location = data;
    },
    SET_FILTER_KEYWORD(state, data) {
      state.locationFilter.keyword = data;
    },
    SET_FILTER_CATEGORY(state, data) {
      state.locationFilter.category = data;
    },
    SET_FILTER_TIME(state, data) {
      state.locationFilter.time = data;
    },
    SET_FILTER_DAY(state, data) {
      state.locationFilter.day = data;
    },
    SET_LOCATION_IMAGES(state, data) {
      state.locationImages = data;
    },
    SET_CHECKINS(state, data){
      state.checkIns = data;
    }
  }
})
