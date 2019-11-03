<%--
  Created by IntelliJ IDEA.
  User: whatislove118
  Date: 27.10.2019
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru" xmlns="http://www.w3.org/1999/html">
  <head>
    <style>
      html{
        overflow: hidden;
      }
      .hat:hover{
        box-shadow: inset 0 0 0 10px yellow;
      }
      .pick:hover{
        box-shadow: inset 0 0 0 10px yellow;
      }
      #playerMusic{
        background: red;
        border-radius: 25px;
        padding: 5px;
        border:2px solid black;
        overflow: auto;
        width: 200px;
        height: 100px;
        position: absolute;
        bottom:10px;
        right: 10px;
        text-align: center;
        color: yellow;
        opacity: 0;
      }
      table{
        border:2px solid black;
        padding: 10px;
        border-radius: 25px;
        background: red;
        font-family: AppleGothic;
        color: yellow;
      }
      table:hover{
        background-image: url("orc.gif");
        background-size: 500px;
        background-repeat: no-repeat;
        background-position-x:20px ;
      }
      #playerMusic:hover{
        opacity: 0.8;
      }
      #result{
        position: absolute;
        right: 8px;
        top:8px;
        font-family: AppleGothic;
      }
    </style>
    <title>LAB2PIP</title>
    <link href="mainPage.css" rel="stylesheet">
    <script src="jquery-3.4.1.min.js" type="text/javascript"></script>
  </head>
  <body id="back">
  <h3 class="hat">
    <div class="hatLabInfo">Лабораторная работа №2 по дисциплине <br/> "Веб-программирование"
      <br/>Вариант: 81849<br/></div>
    <div class ="hatStudentInfo"></br>Выполнил: Почикалин Владислав<br/>
      Группа:P3210<br/>
      Преподаватель: Яркеев А.С</div>
  </h3>
  <div>
    <form method="get" class="form" id="form">
      <div class="pick" id="pickX">
      <h4 style="text-align: center;">X</h4>
        <input type="checkbox" name="checkboxX1"  id ="checkboxX1" value="-3"> <label for="checkboxX1">-3</label> <br/>
        <input type="checkbox" name="checkboxX2"  id ="checkboxX2" value="-2"> <label for="checkboxX2">-2</label> <br/>
        <input type="checkbox" name="checkboxX3"  id ="checkboxX3" value="-1"> <label for="checkboxX3">-1</label> <br/>
        <input type="checkbox" name="checkboxX4"  id ="checkboxX4" value="0"> <label for="checkboxX4"> 0</label> <br/>
        <input type="checkbox" name="checkboxX5"  id ="checkboxX5" value="1"> <label for="checkboxX5"> 1</label> <br/>
        <input type="checkbox" name="checkboxX6"  id ="checkboxX6" value="2"> <label for="checkboxX6"> 2</label> <br/>
        <input type="checkbox" name="checkboxX7"  id ="checkboxX7" value="3"> <label for="checkboxX7"> 3</label> <br/>
        <input type="checkbox" name="checkboxX8"  id ="checkboxX8" value="4"> <label for="checkboxX8"> 4</label> <br/>
        <input type="checkbox" name="checkboxX9"  id ="checkboxX9" value="5">  <label for="checkboxX9"> 5</label> <br/>
      </div>
      <div class="pick" id="pickY" style="position: absolute; left: 245px;">
        <h4 style="text-align: center">Y</h4>
        <h4 style="text-align: center;">(-5...3)</h4>
        <input type="text" value="ВВЕДИ!" id="textY" name="textY" maxlength="7" size="16px">
      </div>
      <div class="pick" id="pickR" style="position: absolute; left: 350px;">
        <h4 style="text-align: center;">R</h4>

         <input type="checkbox" name="checkboxR1"  id ="checkboxR1" value="1"> <label for="checkboxR1" >1</label> <br/>
         <input type="checkbox" name="checkboxR2"  id ="checkboxR2" value="2"> <label for="checkboxR2">2</label> <br/>
         <input type="checkbox" name="checkboxR3"  id ="checkboxR3" value="3"> <label for="checkboxR3">3</label> <br/>
         <input type="checkbox" name="checkboxR4"  id ="checkboxR4" value="4"> <label for="checkboxR4">4</label> <br/>
         <input type="checkbox" name="checkboxR5"  id ="checkboxR5" value="5"> <label for="checkboxR5">5</label> <br/>
      </div>
      <div class="submitValue">
        <button type="submit" id="submit" style="background: red;">Вход!</button>
      </div>
    </form>
    </div>
    <div class="result" id="resultX" hidden >

    </div>
    <div class="result" id="resultY" align="center" style="left: 245px;" hidden>
      <p align="center">Введите X!</p>
    </div>
    <div class="result" id="resultR" style="left:350px" hidden>
    </div>
    <div id="checkRDraw" width="300px" height="50px" style="background: red" hidden>
      <p id="rText">А про R не забыл?)))</p>
    </div>
      <div id="result"></div>
  <canvas id="graph" width="280px" height="280px" style="border: 2px solid black;border-radius:25px;background: white;position: absolute; right: 175px;
    bottom:145px;"></canvas>
  <div id="playerMusic">
    <p>Music Player</p><br>
    <input type="button" id="stop_button"><label for="stop_button">Stop</label>
    <input type="button" id="play_button"><label for="play_button">Play</label>
    <input type="button" id="restart_button"><label for="restart_button">Restart</label>
  </div>
  <script type="text/javascript">


          let audio = new Audio('1.mp3');
          if($('#stop_button').click(function () {audio.pause()}));
          if($('#play_button').click(function () {audio.play()}));
          if($('#restart_button').click(function () {
              if (audio.paused) {
                  audio.play();
              }else{
                  audio.currentTime = 0
              }
          }));

              let audiosm1 = new Audio('sm1.mp3');
              let audiosm2 = new Audio('sm2.mp3');
              let audiosm3 = new Audio('sm3.mp3');
              let audiosm4 = new Audio('sm4.mp3');
              if ($('#pickX').mouseover(function () {
                  audiosm1.play();
                  setInterval(3000);
              })) ;
              if ($('#pickY').mouseover(function () {
                  audiosm2.play();
                  setInterval(3000);
              })) ;
              if ($('#pickR').mouseover(function () {
                  audiosm3.play();
                  setInterval(3000);
              })) ;
              if ($('.hat').mouseover(function () {
                  audiosm4.play();
                  setInterval(3000);
              })) ;
    
      $('#textY').focus(function () {
          $('#textY').val("");
          $('#textY').blur(function () {
              if( $('#textY').val()===""){
                  $('#textY').val("ВВЕДИ!");
              }
          });
      });
      
      function check() {
          let check=true;
          let checkY=document.forms['form'].elements['textY'].value.trim();

          if(checkY=="ВВЕДИ!"){
              document.getElementById('resultY').hidden=false;
              check=false;
          }else{
              if(!/^(-?\d+)([.,]\d+)?$/.test(checkY)){
                  document.getElementById('resultY').innerHTML="Буквы??)";
                  document.getElementById('resultY').hidden=false;
                  check=false;
              }
              if(checkY <=-5 || checkY >= 3){
                  document.getElementById('resultY').innerHTML="ОДЗ???";
                  document.getElementById('resultY').hidden=false;
                  check=false;
              }
          }

          let countX=0;
          for(let i=1;i<=9;i++){
              if(document.getElementById('checkboxX'+i).checked){
                  countX++;
              }
          }
          if(countX===0){
              document.getElementById('resultX').hidden=false;
              check=false;
          }
          let countR=0;
          for(let j=1;j<=5;j++){
              if(document.getElementById('checkboxR'+j).checked){
                  countR++;
              }
          }
          if(countR===0){
              document.getElementById('resultR').hidden=false;
              check=false;
          }
          return check;
      }
      
      $('#form').submit(function (){
          if(check()){
              document.getElementById("resultR").hidden=true;
              document.getElementById("resultX").hidden=true;
              document.getElementById("resultY").hidden=true;
              console.log(1);
              $.get(
                  "controller",
                  $('#form').serialize(),
                  function(resultOfWorking){
                      $('#result').html(resultOfWorking);
                      document.getElementById("result").hidden=false;
                      checkPoints();
                  }
              );
              document.getElementById("form").reset();
          }
          return false;
      });
      
      let canvas = document.getElementById('graph');
      let ctx = canvas.getContext('2d');
      canvas.addEventListener('click',checkClick,false);
      
 function drawPicture() {
     ctx.strokeStyle = 'black';
     ctx.fillStyle = 'black';
     ctx.beginPath();
     ctx.moveTo(0, 140);
     ctx.lineTo(280, 140);
     ctx.stroke();
     ctx.beginPath();
     ctx.moveTo(140, 0);
     ctx.lineTo(140, 280);
     ctx.stroke();
     ctx.beginPath();
     ctx.moveTo(140, 0);
     ctx.lineTo(136, 5);
     ctx.moveTo(140, 0);
     ctx.lineTo(144, 5);
     ctx.stroke();
     ctx.moveTo(280, 140);
     ctx.lineTo(275, 136);
     ctx.moveTo(280, 140);
     ctx.lineTo(275, 144);
     ctx.stroke();
     for (let i = 28; i <= 252; i += 28) {
         ctx.beginPath();
         ctx.moveTo(i, 140);
         ctx.lineTo(i, 144);
         ctx.lineTo(i, 136);
         ctx.stroke();
         ctx.beginPath();
         ctx.moveTo(140, i);
         ctx.lineTo(144, i);
         ctx.lineTo(136, i);
         ctx.stroke();
     }
     let countI = -4;
     for (let i = 28; i <= 252; i += 28) {
         if (i <= 112) {
             ctx.fillText(countI/2 + 'R', i - 8, 155);
             ctx.fillText(-countI/2 + 'R', 148, i + 4);
             countI++;
         } else if (i == 140) {
             ctx.fillText(countI, i + 5, 155);
             countI++;
         } else {
             ctx.fillText(countI/2 + 'R', i - 8, 155);
             ctx.fillText(-countI/2 + 'R', 148, i + 4);
             countI++;
         }
     }
 }
 
 drawGraphWithR(0);
 drawPicture();
 let rDraw=0;
 function checkR() {
     let check=true;
     let countR=0;
     let r;
     for(let i=1;i<=5;i++){
         if(document.getElementById('checkboxR'+i).checked){
             countR++;
             document.getElementById('resultR').hidden=true;
             r=document.getElementById('checkboxR'+i).value;
         }
     }
     if(countR==0){
         document.getElementById('checkRDraw').background='red';
         document.getElementById('checkRDraw').hidden=false;
         check=false;
     }else if(countR!=1){
         document.getElementById('checkRDraw').background='red';
         document.getElementById('rText').innerHTML="Может быть выбран только один R!";
         document.getElementById('checkRDraw').hidden=false;
         check=false;
     }else{
         rDraw=r;
     }
     return check;
 }


 function drawGraphWithR(r) {
      ctx.fillStyle='blue';
      ctx.beginPath();
      ctx.moveTo(140,140);
      ctx.arc(140,140,r,-Math.PI,-Math.PI/2,false);
      ctx.fill();
      ctx.beginPath();
      ctx.moveTo(140,140);
      ctx.fillRect(140,140,-r/2,r);
      ctx.beginPath();
      ctx.lineTo(140+r,140);
      ctx.lineTo(140 ,140-r/2);
      ctx.lineTo(140,140);
      ctx.fill();
 }
 function paintArc(x,y) {
     let xArc=x*28 +140;
     let yArc=-y*28 +140;
     ctx.beginPath();
     ctx.arc(xArc, yArc, 3, 0, 2 * Math.PI, false);
     ctx.closePath();
     ctx.fill();
     
 }
      for(let i =1;i<=5;i++) {
          $('#checkboxR'+i).change(function () {
              ctx.save();
              ctx.setTransform(1, 0, 0, 1, 0, 0);
              ctx.clearRect(0, 0, canvas.width, canvas.height);
              ctx.restore();
              rDraw=$(this).val();
              drawGraphWithR(rDraw*28);
              drawPicture();
              checkPoints();
              for(let j=1;j<=5;j++){
                  if($('#checkboxR'+j).val()===rDraw){
                      continue;
                  }else{
                      $('#checkboxR'+j).prop('checked',false);
                  }
              }

          });
      }

 function checkPoints() {;
     let rows=$('table').find('tr');
     let countNumbers=rows.length;
     for(let i =1;i<countNumbers-1;i++){
         let tdValue=$(rows[i]).find('td');
         let rP=Number($(tdValue[2]).text().trim());
        let  RP=Number(rDraw);
        console.log(rP , RP);
         if(rP==RP){
             if($(tdValue[3]).text().trim()=='Hit'){
                 ctx.fillStyle='green';
             }else{
                 ctx.fillStyle='red';
             }
         }else{
             ctx.fillStyle='black';
         }
         paintArc($(tdValue[0]).text(),$(tdValue[1]).text());
         console.log($(tdValue[0]).text(),$(tdValue[1]).text(),$(tdValue[2]).text())
     }
     
 }
 function checkClick(e) {
     if(checkR()) {
         document.getElementById('checkRDraw').hidden=true;
         let r=rDraw;
         console.log('rDraw='+rDraw);
         let x = e.offsetX;
         let y = e.offsetY;
         x=(x-140)/28;
         y=-(y-140)/28;
         $.get("controller",
         {checkboxX10: x, textY:y,checkboxR6:r},
         function(resultOfWorking){
             $('#result').html(resultOfWorking);
             document.getElementById("result").hidden=false;
             checkPoints();
         });

     }
     
 }






  </script>
  </body>
</html>
