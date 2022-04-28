import axios from 'axios';



export default {

    getLocations() {
        return axios.get('/location');
    },
    getLocation(locationID){
        return axios.get(`/location/${locationID}`)
    },
    postCheckIn(checkIn){
        return axios.post('/location/checkin', checkIn)
    },
    
   
}