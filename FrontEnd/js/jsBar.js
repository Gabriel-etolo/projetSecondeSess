"use strict"
function CbfoisBoire(B){
	var fois = B.boir.value;
	var foisPAn = fois*52;
	if(foisPAn>=208){
	document.getElementById("cbFois").innerHTML='<p>'+'Vous sortez en bar '+foisPAn+' fois en moyenne par an, vous consommez beaucoup.'+'</p>';}
	else{document.getElementById("cbFois").innerHTML='<p>'+'Vous sortez en bar '+foisPAn+' fois en moyenne par an, vous consommez de façon modérée.'+'</p>'; }
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
    donnees += '<button type="button" class="buttonBar" onclick="getInfo(\'' + e.nomId + '\');">'+ e.nom  +'</button>' + '\n'
  }

  console.log(bar);
  document.getElementById('result').innerHTML = donnees; 
}

function getacti(nComm) { 
  let xhr = new XMLHttpRequest(); 
  xhr.open('get', 'barC?nomC=' + nComm, true); 
  xhr.onload = function() { 
    var lign = JSON.parse(this.responseText); 
    var lng ='';
    for (let i of lign) { 

      lng += '<button  onclick="getInfo(\'' +i.nomId+ '\'); ">' +
                  '<h5>' +i.nom + '</h5>' +  
            '</button>' + '\n';
    }
    document.getElementById('result').innerHTML = lng; 
	console.log(lng);
  }

  xhr.send(); 
}

function getInfo(nId){
	let xhr = new XMLHttpRequest();
	xhr.open('get','coordonnees?nId='+nId,true);
	xhr.onload= function(){
		var inf='<p>Voici les coordonnees de votre bar</p>';
		var infor = JSON.parse(this.responseText);
		for (let a of infor){
			inf += '<p>'+a.numTel+'</p>'+'<p>'+a.mail+'</p>'+'<p>'+a.site+'</p><p>'+a.adresse+'</p>'
		}
		document.getElementById('information').innerHTML = inf;
	}
	xhr.send();
}

function ajouterAvis(){
	document.getElementById("avis").innerHTML=
	'<form id="AjAvis" action=# onSubmit='+'return envoyerAvis(this);'+'>'+
  '<fieldset>'+
    '<legend>Voici la partie pour ajouter un avis</legend>'+
	'<label for="Bar">la liste des bars : </label>'+                                                   
    '<select id="Bar" name="Bars" >'+                                                            
      '<option value="1">Meltdown</option>'+                                                     
      '<option value="2" selected>Baronomie</option>'+                                         
      '<option value="3">Chez clementina</option>'+                                                    
      '<option value="4">Copain</option>'+
		'<option value="5">Jack Daniels Bar</option>'+
		'<option value="6">Kitchen and Bar</option>'+
		'<option value="7">La trinquette</option>'+	
    '</select><br>'+
 '<label for="nom">Nom : </label>'+                                                     
    '<input id="nom" name="nom" type="text" value="Toto" required> <br>'+
'<label for="AvisD">Votre avis: </label>'+
        '<textarea id="AvisD" name="AvisD" rows="4" cols="50"></textarea><br>'+
		'<input type="submit">'+
'</fieldset>'+
'</form>';		
}
function fermerAvis(){
	document.getElementById("avis").innerHTML='';
}

function envoyerAvis(formulaire){
	let xhr = new XMLHttpRequest;
	xhr.open('get', 'ajAvis?nomP='+fomulaire.nom.value+'&bId='+fomulaire.Bar.value+'&avi='+formulaire.AvisD.value, true);
	xhr.send();
}
