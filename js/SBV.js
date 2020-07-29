"use strict"
  function initPage() {
  
  
  let xhr = new XMLHttpRequest(); // Permet de parler avec le serveur , instancier XMLHttpRequest
  xhr.open('get', 'nom', true); // vas chercher le webservice 'code' grace à la requête get
  xhr.onload = function() {
    remplireTable(JSON.parse(this.responseText), 'Nom');
  };
  
  xhr.send();
  
}
function remplireTable(reponseRequete, idBodyTable) {
  let donnees = "<OPTION>"; // variable  qui  génere du code httml  
  for (let e of reponseRequete) { // charge les donnees de la table sql une par un en y integrant une fonction onclick faisant appel à la fonction getVille
    donnees += e.Nom;
  }

  console.log(donnees);
  document.getElementById("nomCommune").innerHTML = donnees; // charge la table dans le tboby d'id ville
}