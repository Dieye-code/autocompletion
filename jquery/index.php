<?php






?>



<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto completion avec du jquery</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="jquery-ui.min.css">
    <script src="jquery.js"></script>
    <script src="jquery-ui.min.js"></script>
</head>

<body>

    <div class="container mt-5 col-md-6 offset-md-3">
        <div class="card text-center">
            <div class="card-header bg-primary">Auto Completion</div>
            <div class="card-body">
                <div class="form-group">
                    <label for="listeJs" class="control-label">Auto completion avec une liste</label>
                    <input type="text" class="form-control" id="listeJs">
                </div>
                <div class="form-group">
                    <label for="listeAjax" class="control-label">Auto completion avec AJAX</label>
                    <input type="text" class="form-control" id="listeAjax">
                </div>
                <div class="form-group">
                    <label for="listeAjax" class="control-label">Auto completion avec AJAX en Javascript et XMLHttpRequest</label>
                    <input type="text" class="form-control" id="listeXMLHttpRequest" list="listeApprenant">
                    <datalist id="listeApprenant">
                    </datalist>
                </div>
            </div>
        </div>
    </div>


    <script>
        listeXMLHttpRequest = document.getElementById('listeXMLHttpRequest');

        //Faire des autocompletions avec des requêtes asynchrones 
        listeXMLHttpRequest.addEventListener('keyup', function(e) {

            //Object XMLHTTPRequest
            xmlHttp = new XMLHttpRequest();

            url = "http://localhost/presentation6-7-2020/jquery/service.php";

            //Ouverture 
            xmlHttp.open("POST", url, true);
            //l'entête 
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
            //reponse
            xmlHttp.responseType = "json";
            //envoie
            xmlHttp.send('search=search&q=' + listeXMLHttpRequest.value);
            //changement d'etat
            xmlHttp.onreadystatechange = function(e) {
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                    l = xmlHttp.response.length;
                    let html = "";

                    for (let i = 0; i < l; i++) {
                        html += "<option value='" + xmlHttp.response[i] + "'>";

                    }
                    //ajouter la reponse dans le DataList
                    document.getElementById('listeApprenant').innerHTML = html;
                }
            }


        });

        //Utilisation du Jquery
        $(document).ready(function() {


            let tab = ['Moustapha Dieye',
                'Samba Diaw',
                'Mor Diop Pir',
                'Marie Perle',
                'Mariama Diouf',
                'Fama Sow',
                'Cheikh Mbow',
                'Astou Cisse'
            ];
            //autocompletion avec le tableau
            $('#listeJs').autocomplete({
                source: tab
            })

            //autocompletion avec de l'ajax
            listeAjax = $('#listeAjax');
            listeAjax.keyup(function(e) {
                //fonction ajax de jquery
                $.ajax({
                    //url
                    url: "http://localhost/presentation6-7-2020/jquery/service.php",
                    //type POST OU GET OU ........
                    type: 'Post',
                    //Donne a envoye
                    data: {
                        q: listeAjax.val(),
                        search: 'search'
                    },
                    //ce qu'on doit faire en cas de succes
                    success: function(data) {
                        listeAjax.autocomplete({
                            source: data
                        })
                    },
                    //ce qu'on doit faire en cas d'erreur
                    error: function(e) {
                        console.log('Erreur ajax')
                    },
                    //type de donnees a recevoir
                    dataType: 'json'
                });
            });



        });
    </script>

</body>

</html>

<!--
    https://openclassrooms.com/fr/courses/510018-decouvrez-la-puissance-de-jquery-ui/510016-lautocompletion
    -->