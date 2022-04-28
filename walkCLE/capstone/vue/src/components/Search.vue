<template>
    <div class="search">
        <div class="keyword">
        <form id="keyword-search">
          <label for="keywordFilter"> Search by name/description:</label>
            <input type="text" id="keywordFilter" v-model="filter.keyword" /> <button v-on:click.prevent="setFilterKeyword" type="submit">Search</button>
        </form>
        </div>

        <div class = "time">
        
        <form id="time-search">
            <label for="day"> Search by day/hour open:</label> 
            <select id="day" v-model="filter.day">
                <option value="Sunday">Sunday</option>
                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thursday">Thursday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
            </select> 
                   
        
        <input type="time" id="search-time" v-model="filter.time"/> 
        <button v-on:click.prevent="setTimeFilters" type="submit">Search</button>
        
        </form>
        </div>
    </div>
</template>

<script>


export default 
    {
       name: 'search-form',
       data(){
           return{
               filter:{
                   keyword: '',
                   time: '',
                   day: ''
               }
           }
       },
       methods: {
           setTimeFilters() {
               //reset other filter
               this.clearKeywordFilter();
               this.setFilterCategory("");
               this.$store.commit("SET_FILTER_KEYWORD", this.filter.keyword);

               this.$store.commit("SET_FILTER_DAY", this.filter.day);
               this.$store.commit("SET_FILTER_TIME", this.filter.time);
           },

        setFilterKeyword(){

            //reset other filter
        this.clearTimeFilter();
        this.setFilterCategory("");
        this.$store.commit("SET_FILTER_DAY", this.filter.day);
        this.$store.commit("SET_FILTER_TIME", this.filter.time);
        this.$store.commit("SET_FILTER_KEYWORD", this.filter.keyword);
      
    },
        clearTimeFilter(){
            this.filter.time = "";
            this.filter.day = "";
        },
        clearKeywordFilter() {
            this.filter.keyword = "";
        },
         setFilterCategory(category){
      this.$store.commit("SET_FILTER_CATEGORY", category)
    }
    
    }
    }
</script>

<style scoped>
.search{
    display: grid;
    grid-template-columns:1fr 1fr;
    grid-template-areas: 
    "keyword time";

    margin-bottom: 10px;
    height: 70px;
    justify-content: center;
    align-content: center;
    gap: -500px;
   
}
.keyword{
    grid-area: keyword;
    display: inline-block;
}
.time{
    grid-area: time;
}
form{
    margin-left:5px;
    margin-right:5px;
}
</style>
