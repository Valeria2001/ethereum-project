a=0;
pressed_button="";
koefficent=0;
const btn1 = document.getElementById("button_1");
const btn2 = document.getElementById("button_2");
const btn3 = document.getElementById("button_3");

btn1.onclick = function (evt) {  //для 1 кнопки
  
  a=a+1;
  if (pressed_button!="button1" && pressed_button!="" && a==2) {
  koefficent = koefficent+1.5;
  pressed_button="";
  // сюда  добавим обработчик
  console.log(koefficent);
  koefficent = 0;
  a=0;
  }
  
  else if (a<2) {
    koefficent = koefficent+1.5;
    pressed_button="button1";
    console.log('press the second button');
  }


};

btn2.onclick = function (evt) {  //для 1 кнопки
  
  a=a+1;
  if (pressed_button!="button2" && pressed_button!="" && a==2) {
  a=0;
  koefficent = koefficent+2;
  pressed_button="";
  // сюда  добавим обработчик
  console.log(koefficent);
  koefficent = 0;
  
  }
  
 else if (a<2) {
    koefficent = koefficent+2;
    pressed_button="button2";
    console.log('press the second button');
  }


};




btn3.onclick = function(evt) { //для 3 кнопки
 a=a+1;
  if (pressed_button!="button3" && pressed_button!="" && a==2) {
  a=0;
  koefficent = koefficent+4.2;
  pressed_button="";
  // сюда  добавим обработчик
  console.log(koefficent);
  koefficent = 0;
  
  }
  
 else if (a<2) {
    koefficent = koefficent+4.2;
    pressed_button="button3";
    console.log('press the second button');
  }
 
};