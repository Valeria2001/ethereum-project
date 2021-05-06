a=0;
pressed_button="";
koefficent=0;
const btn1 = document.getElementById("button_1");
const btn2 = document.getElementById("button_2");
const btn3 = document.getElementById("button_3");

btn1.onclick = function (evt) {  //для 1 кнопки
  
  a=a+1;
  if (pressed_button!="button1" && pressed_button!="" && a==2) {
     
  pressed_button="button1";
  // сюда  добавим обработчик
  console.log('pidor')
  a=0;
  }
  
  else if (a<2) {
    pressed_button="button1";
    console.log('press the second button');
  }
  else if(a>2) {
    a=0;
    pressed_button="";
    console.log('idi nachui stalker');

  }

};

btn2.onclick = function (evt) {  //для 1 кнопки
  
  a=a+1;
  if (pressed_button!="button2" && pressed_button!="" && a==2) {
  a=0;
  pressed_button="button2";
  // сюда  добавим обработчик
  console.log('pidor')
  
  }
  
 else if (a<2) {
    pressed_button="button2";
    console.log('press the second button');
  }
  else if(a>2) {
    a=0;
    pressed_button="";
    console.log('idi nachui stalker');

  }

};




btn3.onclick = function(evt) { //для 3 кнопки
  a=a+1;
  if (a<2) {

    evt.preventDefault();

    console.log('press the second button');
  }
  else if(a>2) {
    a=0;
    console.log('idi nachui stalker');
    evt.preventDefault();
  }
  else {
    console.log('aaa blat');
  }
};
