<template>
  <div id="app">
    <Navbar />

    <router-view/>
  </div>
</template>

<script>
import Navbar from '@/components/Navbar'

export default {
  name: 'App',
  components: {
    Navbar
  },

}
</script>

<style lang="scss">
@import '@/assets/scss/app.scss';

.mainbtn{
  margin-top:25px;
  border: 4px solid white;
  background-color : rgba(0,0,0,0);
  padding:5px;
  padding-left:10px;
  padding-right:10px;
  font-size:20px;
  margin-left: 8px;
  margin-right: 8px;
  border-radius: 6px;
}

.mainbtn:hover{
  border : 4px solid pink;
  background-color:pink;
}

.maininput{
  border : 3px solid pink;
  padding: 9px;
  padding-right: 50px;
  padding-left: 50px;
  text-align: center;
  font-size: 20px;
  border-radius: 6px;
}

.maininput:focus{
  border : 3px solid blue;
  border-radius: 6px;
}
</style>
