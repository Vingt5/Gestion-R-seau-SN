<?php
// Vérification des informations d'identification

// Connexion à la base de données (exemple avec MySQLi)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gestionreseau";

$connexion = new mysqli($servername, $username, $password, $dbname);

// Vérification de la connexion
if ($connexion->connect_error) {
    die("Connection failed: " . $connexion->connect_error);
}

// Récupération des données du formulaire
if ($_SERVER["REQUEST_METHOD"] == "POST") {
$email = $_POST['email'];
$pass = $_POST['pass'];

// Requête pour récupérer le mot de passe haché de l'utilisateur
$requete = "SELECT id FROM incidents WHERE email=? AND pass=?";
$statement = $connexion->prepare($requete);
$statement->bind_param("ss", $email, $pass);

// Exécution de la requête
$statement->execute();

// Récupération des résultats
$resultat = $statement->get_result();

if ($resultat->num_rows == 1) {
    // Authentification réussie, redirection vers une autre page
    header("Location: formulaire.php");
    exit;
} else {
    echo "Nom d'utilisateur ou mot de passe incorrect.";
}

// Fermeture de la connexion
$statement->close();
}

$connexion->close();
?>

