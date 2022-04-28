<template>
    <div class = "location-list">
        
        <div class="preview"
        v-for="location in filteredList"
        v-bind:key="location.locationId"       
        >
        <vue-flip active-click width="310px" height="320px">>
            <template v-slot:back>
        <h2 id="title">{{ location.name }}</h2>
        <p id="description">  {{  location.description  }} <br/>
        <router-link :to="{ name: 'Location', params: { locationID: location.locationId } }" v-bind:key="location.locationId" ><button> Get more info </button></router-link></p>
            </template>
            <template v-slot:front>
        <img :src='require(`../img/Location_Images/${location.name}.png`)'>
        <h2 id="image-title">   {{ location.name }} </h2>
            </template>
        </vue-flip>
    </div>
    </div>
</template>

<script>

import locationService from "@/services/LocationService";
import VueFlip from 'vue-flip';
export default {
    

    name: 'location-list',
    components: { VueFlip},
    locations: [],
    filteredLocations: [],
    computed:{
        filteredList(){
        let filteredLocations = this.$store.state.locations;
            

         if(this.$store.state.locationFilter.keyword != "" ){
            filteredLocations = filteredLocations.filter(location => 
                location.name.toLowerCase().includes(this.$store.state.locationFilter.keyword.toLowerCase()) || location.description.toLowerCase().includes(this.$store.state.locationFilter.keyword.toLowerCase()))
         } if(this.$store.state.locationFilter.category != "" ){
            filteredLocations = filteredLocations.filter(location => 
                location.category == this.$store.state.locationFilter.category)
        } if(this.$store.state.locationFilter.time != "") {
                
            if(this.$store.state.locationFilter.day == "Sunday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.sundayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.sundayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }if(this.$store.state.locationFilter.day == "Monday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.mondayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.mondayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }if(this.$store.state.locationFilter.day == "Tuesday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.tuesdayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.tuesdayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }if(this.$store.state.locationFilter.day == "Wednesday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.wednesdayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.wednesdayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }if(this.$store.state.locationFilter.day == "Thursday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.thursdayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.thursdayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }if(this.$store.state.locationFilter.day == "Friday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.fridayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.fridayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }if(this.$store.state.locationFilter.day == "Saturday") {
                 filteredLocations = filteredLocations.filter(location => 
                    (parseInt(location.saturdayHourOpen) <= parseInt(this.$store.state.locationFilter.time) && parseInt(location.saturdayHourClosed) > parseInt(this.$store.state.locationFilter.time)))
             }
           
            
        }
        return filteredLocations;
    }
    },
    methods: {
        viewLocationDetails(locationID) {
         this.$router.push(`/location/${locationID}`);
    },
    retrieveLocations() {
        locationService.getLocations().then(response => {
           this.$store.commit("SET_LOCATIONS", response.data)
       }).catch(error => {
          if (error.response && error.response.status === 404) {
            alert(
              "Location cards not available. This board may have been deleted or you have entered an invalid board ID."
            );
            this.$router.push("/");
          }
    });
    },
    },

    
    created() {
    this.retrieveLocations();
    },
    }

</script>

<style scoped>

/* .preview {
display:grid;
grid-template-columns:1fr 2fr;
grid-template-areas: 
"image name"
"image description";
justify-content: center;
align-content: center;

} */
/* 
.location-list :nth-child(even) {
display:grid;
grid-template-columns:1fr 1fr;
grid-template-areas: 
"image name"
"image description";
justify-content: center;
align-content: center;
}

.location-list :nth-child(odd) {
display:grid;
grid-template-columns:1fr 1fr;
grid-template-areas: 
"name image"
"description image";
} */

.preview {
    border:solid black;
    height: 350px;
    width: 320px;
    background-color: #5F9EA0;
    text-align: center;
    font-size: .6vw; 
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

#title {
    grid-area: name;
    margin-left: -50px;
}
p {
   
    grid-area: description;
   margin-left: -50px;
   
}
img {
    grid-area: image;
    width: 300px;
    height: 300px;
    object-fit: cover;
    align-self: center ;
    justify-self: center;
    margin-left: 10px;  
}

 .location-list  {
    /* height:200vh; */
    display:grid;
    grid-template-columns:1fr 1fr 1fr 1fr;
    gap:20px;
    justify-items: stretch;
    /* background-color: gray; */
    color: black;
  }
  .image-title {
    
      bottom: 75px;
   
  }
    #description {
        font-size: .9vw;
        width: 300px;
        margin-left: -50px;
        padding-left:-150px;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        font-size: .75vw; 
    }
    button {
        margin-top:8px;
    }
</style>