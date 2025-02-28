<?php
header('Content-Type: application/json');

// Connexion à la base de données
$host = 'mysql';
$username = 'eleve';
$password = 'eleve';
$dbname = 'appdb';

$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) {
    die(json_encode(['error' => "Connexion échouée: " . $conn->connect_error]));
}

// Vérification des filtres de recherche
$search = isset($_GET['search']) ? $_GET['search'] : '';
$genre = isset($_GET['genre']) ? $_GET['genre'] : '';
$year = isset($_GET['year']) ? (int)$_GET['year'] : 0;

// Requête SQL avec filtres
$sql = "SELECT f.id AS film_id, f.titre, f.annee, f.resume, f.image, 
               GROUP_CONCAT(g.libelle SEPARATOR ', ') AS genres, 
               GROUP_CONCAT(CONCAT(a.nom, ' ', a.prenom) SEPARATOR ', ') AS acteurs, 
               AVG(n.note) AS note_moyenne
        FROM Film f
        LEFT JOIN Film_Genre fg ON f.id = fg.idFilm
        LEFT JOIN Genre g ON fg.idGenre = g.id
        LEFT JOIN Jouer j ON f.id = j.idFilm
        LEFT JOIN Artiste a ON j.idArtiste = a.id
        LEFT JOIN Noter n ON f.id = n.idFilm
        WHERE 1=1";

// Ajout des filtres à la requête
if (!empty($search)) {
    $sql .= " AND f.titre LIKE '%" . $conn->real_escape_string($search) . "%'";
}
if (!empty($genre)) {
    $sql .= " AND g.libelle = '" . $conn->real_escape_string($genre) . "'";
}
if ($year > 0) {
    $sql .= " AND f.annee = $year";
}

$sql .= " GROUP BY f.id";

$result = $conn->query($sql);
$films = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $films[] = $row;
    }
}

// Fermeture de la connexion
$conn->close();

// Envoi des données JSON
echo json_encode($films);
?>
