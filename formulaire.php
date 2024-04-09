<?php include "traitment.php"; ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire d'incident</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <form id="msform" action="traitment.php" method ="POST" enctype="multipart/form-data">
        <!-- progressbar -->
        <ul id="progressbar">
            <li class="active">Connexion</li>
            <li>Personnel</li>
            <li>Incident</li>
            <li>Photo</li>
            
        </ul>
        <!-- fieldsets -->
        <fieldset>
            <h2 class="fs-title">Identification</h2>
            <h3 class="fs-subtitle">Etape 1</h3>
            <input type="email" name="email" id="email" placeholder="Email"  required title="Veuillez entrer votre email." />
            <input type="password" name="pass" id="pass" placeholder="Mot de passe" required title="Veuillez entrer votre mot de passe." />
            <input type="submit" name="next" class="next action-button" value="Connexion" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Information Personnel</h2>
            <h3 class="fs-subtitle">Etape 2</h3>
            <input type="text" name="nom" id="nom" placeholder="Nom" />
            <input type="text" name="prenom" id="prenom" placeholder="Prénom" />
            <input type="email" name="email2" id="email2" placeholder="Email" />
            <input type="submit" name="previous" class="previous action-button" value="Précédent" />
            <input type="submit" name="next" class="next action-button" value="Suivant" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Information incident</h2>
            <h3 class="fs-subtitle">Etape 3</h3>
            <label for="incident_type">Type d'incident:</label>
            <select id="incident_type" name="incident_type">
                <option value="">Choisir...</option>
                <option value="Demande installation logiciel">Demande installation logiciel</option>
                <option value="panne">Panne</option>
                <option value="autre">Autre</option>
            </select>
            <select id="poste" name="poste">
                <option value="">Choisir...</option>
                <option value="En6-P1">En6-P1</option>
                <option value="En6-P2">En6-P2</option>
                <option value="En6-P3">En6-P3</option>
                <option value="En6-P4">En6-P4</option>
                <option value="En6-P5">En6-P5</option>
                <option value="En6-P6">En6-P6</option>
                <option value="En6-P7">En6-P7</option>
                <option value="En6-P8">En6-P8</option>
                <option value="En6-P9">En6-P9</option>
                <option value="En6-P10">En6-P10</option>
                <option value="En6-P11">En6-P11</option>
                <option value="En6-P12">En6-P12</option>
                <option value="En6-P13">En6-P13</option>
                <option value="En6-P14">En6-P14</option>
                <option value="En6-P15">En6-P15</option>

                
                <option value="autre">Autre</option>
            </select>
            
            <textarea name="incident_description" id="incident_description" placeholder="Décrire l'incident"></textarea>
            <input type="submit" name="previous" class="previous action-button" value="Précédent" />
            <input type="submit" id="submit-form" name="submit" class="submit action-button" value="Envoyer" />
            <input type="submit" name="next" class="next action-button" value="Photo" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Photo</h2>
            <h3 class="fs-subtitle">Etape 4</h3>
            <label for="photo">Sélectionnez une photo :</label><br>
            <input type="file" id="photo" name="photo" accept="image/*"><br>
            <input type="submit" name="previous" class="previous action-button" value="Précédent" />
            <input type="submit" name="submit-photo" class="submit action-button" value="Envoyer" />
        </fieldset>
        
    </form>
</body>
</html>

<!-- jQuery -->
<script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- jQuery easing plugin -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>

<script>
// jQuery time
var current_fs, next_fs, previous_fs; // fieldsets
var left, opacity, scale; // propriétés du fieldset que nous allons animer
var animating; // drapeau pour éviter les erreurs de clics multiples rapides

$(".next").click(function(){
    if(animating) return false;
    animating = true;
    
    current_fs = $(this).parent();
    next_fs = $(this).parent().next();
    
    // activer l'étape suivante sur la barre de progression en utilisant l'index de next_fs
    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
    
    // afficher le prochain fieldset
    next_fs.show(); 
    // masquer le fieldset actuel avec style
    current_fs.animate({opacity: 0}, {
        step: function(now, mx) {
            // à mesure que l'opacité de current_fs diminue à 0 - stockée dans "now"
            // 1. réduire current_fs à 80%
            scale = 1 - (1 - now) * 0.2;
            // 2. faire venir next_fs depuis la droite (50%)
            left = (now * 50)+"%";
            // 3. augmenter l'opacité de next_fs à 1 lorsqu'il se déplace
            opacity = 1 - now;
            current_fs.css({'transform': 'scale('+scale+')'});
            next_fs.css({'left': left, 'opacity': opacity});
        }, 
        duration: 800, 
        complete: function(){
            current_fs.hide();
            animating = false;
        }, 
        // cela vient du plugin d'interpolation personnalisé
        easing: 'easeInOutBack'
    });
});

$(".previous").click(function(){
    if(animating) return false;
    animating = true;
    
    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();
    
    // désactiver l'étape actuelle sur la barre de progression
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
    
    // afficher le fieldset précédent
    previous_fs.show(); 
    // masquer le fieldset actuel avec style
    current_fs.animate({opacity: 0}, {
        step: function(now, mx) {
            // à mesure que l'opacité de current_fs diminue à 0 - stockée dans "now"
            // 1. augmenter previous_fs de 80% à 100%
            scale = 0.8 + (1 - now) * 0.2;
            // 2. amener current_fs vers la droite (50%) - à partir de 0%
            left = ((1-now) * 50)+"%";
            // 3. augmenter l'opacité de previous_fs à 1 lorsqu'il se déplace
            opacity = 1 - now;
            current_fs.css({'left': left});
            previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
        }, 
        duration: 800, 
        complete: function(){
            current_fs.hide();
            animating = false;
        }, 
        // cela vient du plugin d'interpolation personnalisé
        easing: 'easeInOutBack'
    });
});

// Supprimer l'envoi des données lorsque le bouton "Suivant" ou "Précédent" est cliqué
$(".next, .previous").click(function(){
    return false;
});


$(".submit").click(function(){
    // Récupérez les valeurs des champs de formulaire de l'étape actuelle et stockez-les dans formData
    current_fs = $(this).parent();
    current_fs.find('input, select, textarea').each(function(){
        formData[$(this).attr('name')] = $(this).val();
    });

    // Envoyez formData au serveur pour traitement
    $.ajax({
        type: 'POST',
        url: 'traitment.php', // Assurez-vous que le chemin est correct
        data: formData,
        success: function(response) {
            // Traitez la réponse du serveur si nécessaire
            console.log(response);
            // Redirigez l'utilisateur ou affichez un message de confirmation ici
        },
        error: function(xhr, status, error) {
            // Gérez les erreurs de requête AJAX si nécessaire
            console.error(error);
        }
    });
});
</script>
