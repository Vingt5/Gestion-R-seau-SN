<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Définition des variables pour la connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gestionreseau";

// Création d'une nouvelle connexion à la base de données
$connexion = new mysqli($servername, $username, $password, $dbname);
if ($connexion->connect_error) {
    die("La connexion a échoué. " . $connexion->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Vérifier si toutes les données requises sont présentes
    if (isset($_POST["email"], $_POST["pass"], $_POST["nom"], $_POST["prenom"], $_POST["email2"], $_POST["incident_type"], $_POST["incident_description"], $_FILES['photo']['name'])) {
        // Récupérer les données du formulaire
        $email = $_POST["email"];
        $pass = $_POST["pass"];
        $nom = $_POST["nom"];
        $prenom = $_POST["prenom"];
        $email2 = $_POST["email2"];
        $incident_type = $_POST["incident_type"];
        $poste = $_POST["poste"];
        $incident_description = $_POST["incident_description"];

        // Traitement du fichier photo
        $photo = $_FILES['photo']['name'];
        $target_dir = "photo/";
        $target_file = $target_dir . basename($_FILES["photo"]["name"]);

        // Déplacer le fichier téléchargé vers le répertoire de destination
        if (move_uploaded_file($_FILES["photo"]["tmp_name"], $target_file)) {
            echo "Le fichier a été téléchargé avec succès.";
        } else {
            echo "Une erreur s'est produite lors du téléchargement du fichier.";
        }

        // Préparer et exécuter la requête SQL pour insérer les données dans la base de données
        $requete = $connexion->prepare("INSERT INTO incidents (email, pass, nom, prenom, email2, incident_type, poste, incident_description, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $requete->bind_param("sssssssss", $email, $pass, $nom, $prenom, $email2, $incident_type, $poste, $incident_description, $photo);

        // Vérifier si la requête SQL s'exécute avec succès
        if ($requete->execute()) {
            echo "Les données ont été insérées avec succès.";
        } else {
            echo "Erreur lors de l'insertion des données : " . $connexion->error;
        }

        // Fermer la requête préparée
        $requete->close();
    }
}
// Fermer la connexion à la base de données
$connexion->close();
?>
