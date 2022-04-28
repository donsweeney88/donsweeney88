<template>
  <div class="home">
    <!-- <h1>WalkCLE</h1> -->
    
   <!-- <div class="header"><img id="logo" src="../img/WalkCle.png" /></div> -->
   
    <!-- <img src="src\img\skyline.jpg" alt="Cleveland Skyline"> -->
    <Nav-Bar />
    <Search />
      <div class="location-display">
        <div class="map">
        <add-google-map />
        </div>
        <div class="locations">
        <location-list />
        </div>
      </div>
     <div class= "container">
       
    <!-- <div id="background_photo">
      <img alt="background" src="../img/skyline.jpg">
    </div>
   
   
    <div id="food_photo">
      <img src="../img/food collage.jpeg">
    </div> -->
  </div>

  </div>




</template>


body {background-image:url(“skyline.jpg”);
      background-attachment: fixed;
      background-position: center;
      background-repeat: no-repeat;background-size: cover;}



<script>

import NavBar  from '@/components/NavBar';
import Search from '@/components/Search';
import AddGoogleMap from '@/components/AddGoogleMap';
import LocationList from '../components/LocationList.vue';

export default {
  name: "home",
  components:{NavBar, Search, AddGoogleMap, LocationList},
};




</script>

<style scoped>


/* #food_photo {
  grid-area: Food_Img;
  width: 10px;
  height: 10px;
}

#Food {
  grid-area: Food;
  width: 75px;
  height: 75px; 
  background-color: blue;

} */
 

 .location-display{
 display: grid;
 grid-template-columns: 1.35fr 2fr 2fr;
 grid-template-areas: 'map location location';

 }

.locations{
  grid-area: location;
}

.map{
  grid-area: map;
  position: fixed;
  margin-bottom: 200px ;
  margin-top: -37px;
 
}
#logo{
height: 8%;
width: 8%;
}


.container {
    height:100vh;
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
    justify-items: stretch;
    /* background-color: gray; */
    color: black;
  }    

ul {
    display: grid;
    grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    grid-template-areas:
      ""
      "Food Food_Img Sports Sports"
      "Theater Theater Arts Arts"
      "Parks Parks Historical Historical"
      ""
       ;
    height: 100px;
    gap: 20px;
}

  .header  {
    text-align: center;
    padding-top: 10px;
    font-size: 70px;
    background-image: linear-gradient( #696969,  #A9A9A9, #DCDCDC);
    width: 100%;
  }


.home {
font-family: Georgia, 'Times New Roman', Times, serif;
background-color: #F0FFF0;
}

  </style>