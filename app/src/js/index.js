'use strict';

require('../styles/imports.scss');

console.log('hello world');

const elements = document.getElementsByClassName('image-column');


for(let i = 0; i < elements.length; i++) {
    const trElement = document.createElement('div');
    trElement.className += "tr";
    const tlElement = document.createElement('div');
    tlElement.className += "tl";
    const brElement = document.createElement('div');
    brElement.className += "br";
    const blElement = document.createElement('div');
    blElement.className += "bl";
    const element = elements[i];
    console.log(element);
    element.appendChild(trElement);
    element.appendChild(tlElement);
    element.appendChild(brElement);
    element.appendChild(blElement);
}
