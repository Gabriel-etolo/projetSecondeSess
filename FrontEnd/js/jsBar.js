"use strict"
function CbfoisBoire(nbfois){
	
}

function rempPage(){
let xhr = new XMLHttpRequest();
xhr.open('get', 'bar', true);
xhr.onload = function(){
	afficherBar(JSON.parse(this.responseText), 'Nom');
	};
xhr.send();
}

function afficherBar(reponseRequete, idBodyTable){
let bar = '<button type="button" class="buttonBar">bar</button>';
  for (let e of reponseRequete) { 
    donnees += '<button type="button" class="buttonBar" onclick="getInfo(\'' + e.commune + '\');">'+ e.nom  +'</button>' + '\n'
  }

  console.log(bar);
  document.getElementById("result").innerHTML = donnees; 
}

