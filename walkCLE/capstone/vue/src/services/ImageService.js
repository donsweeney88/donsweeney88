import axios from 'axios';

export default {

    getImages(locationId) {
        return axios.get(`location/userimages/${locationId}`);
    }
       
}