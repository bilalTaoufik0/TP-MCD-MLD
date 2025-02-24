<?php
// Paramètres de connexion à la base de données
$host = 'mysql';  // ou l'IP de votre serveur MySQL
$username = 'eleve';
$password = 'eleve';  // Remplacez par votre mot de passe root si nécessaire
$dbname = 'appdb';

// Connexion à la base de données
$conn = new mysqli($host, $username, $password, $dbname);

// Vérification de la connexion
if ($conn->connect_error) {
    die("Connexion échouée: " . $conn->connect_error);
}

// Requête SQL pour récupérer les films, leurs genres, les acteurs associés et les images
$sql = "
    SELECT f.id AS film_id, f.titre, f.annee, f.resume, 
           f.image,  -- Ajout de l'image
           GROUP_CONCAT(g.libelle SEPARATOR ', ') AS genres, 
           GROUP_CONCAT(CONCAT(a.nom, ' ', a.prenom) SEPARATOR ', ') AS acteurs,
           AVG(n.note) AS note_moyenne
    FROM Film f
    LEFT JOIN Film_Genre fg ON f.id = fg.idFilm
    LEFT JOIN Genre g ON fg.idGenre = g.id
    LEFT JOIN Jouer j ON f.id = j.idFilm
    LEFT JOIN Artiste a ON j.idArtiste = a.id
    LEFT JOIN Noter n ON f.id = n.idFilm
    GROUP BY f.id;
";

$result = $conn->query($sql);

// Si des films sont trouvés
$films = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $films[] = $row;
    }
}

// Fermeture de la connexion
$conn->close();

// Envoi des données en JSON
header('Content-Type: application/json');
echo json_encode($films);
?>
