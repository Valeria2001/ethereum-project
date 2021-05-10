btn1.onclick = function (evt) {  //для 1 кнопки
  if (this.style.backgroundColor == "green" and (=="green" or =="green")){this.style.backgroundColor = "white"} else{this.style.backgroundColor = "green"}
  a=a+1;
  if (pressed_button!="button1" && pressed_button!="" && a==2) {
  koefficent = koefficent+1.5;
  pressed_button="";
  konverted_koeff = koefficent.toString();
  x=parseInt(konverted_koeff, 16); 
  callContract(x);   // сюда  добавим обработчик надо дописать в функцию прием данных
  koefficent = 0;
  a=0;
  }
  
  else if (a<2) {
    koefficent = koefficent+1.5;
    pressed_button="button1";
    console.log('press the second button');
  }


};
