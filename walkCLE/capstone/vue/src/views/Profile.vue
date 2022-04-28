<template>
    <div class="profile" v-bind:key="this.$store.state.user.id"> 
        <h2> Earned Badges: </h2>
        <div id="badges">
            
            <div class="badge">
            <img id="first" :class="[first ? earnedClass : unearnedClass]" src = '@/img/badges2/First.png' />
            <h3>Baby's First Steps</h3>
            <p>Earned after your first check-in!</p>
            </div>

            <div class="badge">
            <img id="sports" :class="[sports ? earnedClass : unearnedClass]" src = '@/img/badges2/Sports.png' />
            <h3>Team Player</h3>
            <p>Check in to all 3 of the local major sports stadiums!</p>
            </div>

            <div class="badge">
            <img id="night" :class="[night ? earnedClass : unearnedClass]" src = '@/img/badges2/Night.png' />
            <h3>Night Owl</h3>
            <p>Check in to every location with a vibrant night life!</p>
            </div>

            <div class="badge">
            <img id="arts" :class="[arts ? earnedClass : unearnedClass]" src = '@/img/badges2/Arts.png' />
            <h3>Arts and Culture</h3>
            <p> Earned after your first check-in!</p>
            </div>

            <div class="badge">
            <img id="diversity" :class="[diversity ? earnedClass : unearnedClass]" src = '@/img/badges2/Diversity.png' />
            <h3>Cleveland Diverse Cultural Trail</h3>
            <p>Check in to 4 locations with a vibrant, diverse environment!</p>
            </div>

            <div class="badge">
            <img id="nature" :class="[nature ? earnedClass : unearnedClass]" src = '@/img/badges2/Nature.png' />
            <h3>Animal Kingdom</h3>
            <p>Check in at the Cleveland Zoo!</p>
            </div>

            <div class="badge">
            <img id="scenic" :class="[scenic ? earnedClass : unearnedClass]" src = '@/img/badges2/Scenic.png' />
            <h3>Scenic/Selfie</h3>
            <p>Check in at least 3 of the local scenic locations!</p>
            </div>

            <div class="badge">
            <img id="food" :class="[food ? earnedClass : unearnedClass]" src = '@/img/badges2/Food.png' />
            <h3>Wine and Dine</h3>
            <p>Check in at at least 3 restaurants in a week!</p>
            </div>

            <div class="badge">
            <img id="defender" :class="[defender ? earnedClass : unearnedClass]" src = '@/img/badges2/Defender.png' />
            <h3>Defender of the Land</h3>
            <p>Check in at every location!</p>
            </div>

         </div>

        <h3>Check-in history:</h3>
        <div v-if="this.$store.state.checkIns.length ==0">
            <p> You haven't done any check-in's yet! </p>
            </div>
        <div v-else id="checkins">
            <div class="checkin" v-for="checkIn in this.$store.state.checkIns" v-bind:key="checkIn.key">
            
            <p>Check-in Date: {{ checkIn.timeStamp }} at  {{ checkIn.name }} </p>
              <img :src='`${checkIn.imgUrl}`' />
            </div>
        </div>

        
        
    </div>
</template>

<script>

import userService from "@/services/UserService";
import locationService from "@/services/LocationService";

export default {
  
    data(){
        return {
            first: false,
            sports: false,
            arts: false,
            defender: false,
            diversity: false,
            food: false,
            nature: false,
            scenic: false,
            night: false,
            earnedClass: 'earned',
            unearnedClass: 'unearned'
        }
    },
 methods:{
     getUserCheckIns() {
         userService.getCheckIns(this.$store.state.user.id).then(response => {
             this.$store.commit("SET_CHECKINS", response.data)
         }).catch(error => {
          if (error.response && error.response.status === 404) {
            alert(
              "Location cards not available. This board may have been deleted or you have entered an invalid board ID."
            );
            this.$router.push("/");
          }
     })


    },
    getLocationName(locationId){
        let  location= locationService.getLocation(locationId);
       return location.name;
    },
    badgeCheck() {
        let completedCheckIns = this.$store.state.checkIns;
        if(completedCheckIns.length >0) {
            this.first = true;
        }
        if (completedCheckIns.filter(checkIn => checkIn.locationId === 17).length > 0) {
            this.nature=true;

    }
    }
 },
 created() {
     this.getUserCheckIns();
      
      setTimeout(this.badgeCheck(), 1000)

 }
 }

</script>

<style scoped>
.profile {
font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
background-color: #F0FFF0;

}
img {
    max-height: 300px;
    width: auto;
}
.earned{
    opacity: 100%;
    border: black solid;
    max-height: 150px;
    width: auto;
}

.unearned {
    opacity: 20%;
    max-height: 150px;
    width: auto;
}

#badges{
    display:flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
    align-content: center;
    text-align: center;

}
.badge{
    height: 300px;
    width: 300px;
    padding:10px;
   
    align-content: center;
    align-items: center;
    justify-content: center;
    align-content: center;
}
p{
    font-size: 10px;
    align-self:center;
    
}
#checkins{
    display:flex;
    flex-wrap: wrap;
}
#checkins p {
text-align: center;
}
.checkin{
    margin:15px;
}
</style>
