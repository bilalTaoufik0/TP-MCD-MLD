<?php
$host = 'mysql'; //Nom donné dans le docker-compose.yml
$user = 'eleve';
$password = 'eleve';
$db = 'appdb';

$conn = new mysqli($host,$user,$password,$db);
if(!$conn) {echo "Erreur de connexion à MSSQL<br />";}
else{
        echo "Connexion à MSSQL ok<br />";
        mysqli_close($conn);
}

?>