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
            </div>
        </div>
    </div>


    <script>
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

            $('#listeJs').autocomplete({
                source: tab
            })

            listeAjax = $('#listeAjax');
            listeAjax.keyup(function(e) {
                $.post("http://localhost/presentation6-7-2020/jquery/service.php", {
                        q: listeAjax.val(),
                        search: 'search'
                    },
                    function(data, textStatus, jqXHR) {
                        listeAjax.autocomplete({
                            source: data
                        })
                    },
                    "json"
                );
            });


        });
    </script>

</body>

</html>

<!--
    https://openclassrooms.com/fr/courses/510018-decouvrez-la-puissance-de-jquery-ui/510016-lautocompletion
    -->