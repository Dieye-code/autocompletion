<?php

$pdo = new PDO('mysql:host=localhost;dbname=p3simplon', 'root', '');

$apprenants = $pdo->query('SELECT * FROM apprenant ')->fetchAll();

?>


<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi select autocomplete avec du chosen</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="chosen.min.css">
</head>

<body>

    <div class="container mt-5">
        <div class="card text-center col-md-6 offset-md-3">

            <div class="card-title bg-primary">Multi selection avec autocompletion</div>
            <div class="card-body">

                <p>
                    <label for="groupe" class="control-label">Selection sans Chosen</label>
                    <select name="groupe[]"  class="form-control">

                        <?php foreach ($apprenants as $apprenant) : ?>
                            <option value="<?= $apprenant['id'] ?>"><?= $apprenant['prenom'] ?> <?= $apprenant['nom'] ?></option>
                        <?php endforeach ?>

                    </select>
                </p>

                <p>
                    <label for="name" class="control-label">Apprenants</label>
                    <select name="name" id="name" class="form-control">

                        <?php foreach ($apprenants as $apprenant) : ?>
                            <option value="<?= $apprenant['id'] ?>"><?= $apprenant['prenom'] ?> <?= $apprenant['nom'] ?></option>
                        <?php endforeach ?>

                    </select>
                </p>


                <p>
                    <label for="groupe" class="control-label">Groupe</label>
                    <select name="groupe[]" data-placeholder="membres du groupe..." multiple id="groupe" class="form-control">

                        <?php foreach ($apprenants as $apprenant) : ?>
                            <option value="<?= $apprenant['id'] ?>"><?= $apprenant['prenom'] ?> <?= $apprenant['nom'] ?></option>
                        <?php endforeach ?>

                    </select>
                </p>

            </div>

        </div>
    </div>

    <script src="jquery.js"></script>
    <script src="chosen.jquery.min.js"></script>

    <script>
        $(document).ready(function() {

            $('#name').chosen({ })

            $('#groupe').chosen({
                max_selected_options: 4
            })
            $("#groupe").bind("chosen:maxselected", function () { 
                alert('Maximum 4 membres')
            }); 

        });
    </script>

</body>

</html>



<!--
    https://harvesthq.github.io/chosen/ 


    // Multi selection avec du bootstrap

    https://www.webslesson.info/2017/05/bootstrap-multi-select-dropdown-with-checkboxes-using-jquery-in-php.html
    -->