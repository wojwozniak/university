import { evaluate } from "mathjs";
import "./styles.css"

const btns = ['(',')','DEL','7','8','9','4','5','6','1','2','3','0','-','.','*','+','/','CE','='];

function component() {
  const element = document.createElement('div');
  element.classList.add("root");
  
  const calc_body = document.createElement('main');
  calc_body.classList.add("calculator");

  const screen = document.createElement('p');
  screen.classList.add("screen");
  const screen_text = document.createTextNode("0");
  screen.appendChild(screen_text);
  calc_body.appendChild(screen);

  const button_container = document.createElement('div');
  button_container.classList.add("button_container");

  for(let i=0; i<20; i++) {
    let btn = document.createElement('button');
    let btn_text = document.createTextNode(btns[i]);
    btn.appendChild(btn_text);
    btn.classList.add("button");
    if(btn_text.textContent == '=') {
      btn.classList.add('button--equals');
      btn.onclick = () => {
        if(screen_text.textContent != null) {
          try {
            screen_text.textContent = evaluate(screen_text.textContent);
          }
          catch (error) {
            screen_text.textContent = 'ERROR!';
          }
        }
      }
    } else if(btn_text.textContent == 'CE') {
      btn.classList.add('button--ce');
      btn.onclick = () => {
        if(screen_text.textContent != null) {
            screen_text.textContent = '0';
        }
      }
    } else if(btn_text.textContent == 'DEL') {
      btn.onclick = () => {
        if(screen_text.textContent != null) {
          if(screen_text.textContent.length > 1 && !(screen_text.textContent == "ERROR!")) {
            screen_text.textContent = screen_text.textContent.slice(0, -1);
          } else {
            screen_text.textContent = '0';
          }
        }
      }
    } else {
      btn.onclick = () => {
        if(screen_text.textContent != null) {
          if(screen_text.textContent == '0' || screen_text.textContent == "ERROR!") {
            screen_text.textContent = '';
          }
          screen_text.textContent += btn_text.textContent;
        }
      }
    }
    button_container.appendChild(btn);
  }
  calc_body.appendChild(button_container);




  element.appendChild(calc_body);
  return element;
}

document.body.appendChild(component());