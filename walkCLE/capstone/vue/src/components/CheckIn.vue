<template>
        <div>
            <h3> Celebrate your accomplishment with a celebratory photo to remember the occasion! </h3>
            <form>
                <input type="text" id="image-form" v-model="checkIn.imgUrl">
                <button v-on:click="pushCheckin"> Check in! </button>
            </form>
        </div>
</template>

<script>

 import locationService from "@/services/LocationService";
    export default {
   
    name: 'check-in',
    data(){
        return{
            checkIn: {
                locationId: this.$route.params.locationID,
                userId: this.$store.state.user.id,
                timeStamp: this.getDate(),
                imgUrl: '',
            }
        }
    },
    methods: {
        pushCheckin(){
            // const newCheckIn= {
            //     locationId: this.$route.params.locationID,
            //     userId: this.$store.state.user.id,
            //     timeStamp: Date.now(),
            //     imgUrl: this.imgUrl,
            // };
            
            locationService.postCheckIn(this.checkIn).then(response => {
                if (response.status === 201) {
                    this.$route.push('/profile')
                }
            })
            

        },
        getDate(){
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today = mm + '/' + dd + '/' + yyyy;
               return (today);
        }
    }
}
</script>

<style scoped>

</style>