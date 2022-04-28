import axios from 'axios';


export default {

   getCheckIns(userID) {
       return axios.get(`/location/user/${userID}`)
   }
    
   
}