<?php
    include 'connection.php';
    $error = '';
    $success = '';
    $errorInfo = '';
    $successInfo = '';
    $categories = [];
    $categoriesArray = [];

    function getCategories(){
        include 'connection.php';
        $sql2 = 'SELECT learning.* 
        FROM learning as learning
        ORDER BY learning.id ASC';
        $stmt2 = $conn->prepare($sql2);
        $stmt2->execute();        
        while($row = $stmt2->fetch(PDO::FETCH_ASSOC)) {  
            $categoriesArray[$row['id']] = $row['category'];        
        }
        return $categoriesArray;
    }
    
    $categories = getCategories();

    if(isset($_POST['category'])){
        $var=$_POST['category'];
        // check value exist in db
        $query = 'SELECT * FROM learning WHERE category LIKE ? ';
        $params = array("%$var%");
        if(!empty($params)) {
            $stmt = $conn->prepare($query);
            $stmt->execute($params);            
            $row1 = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!$row1) {
                // insert into db
                $statement = $conn->prepare("INSERT INTO learning(category)  VALUES(:categoryVal)");
                $statement->execute(array(
                    "categoryVal" => $var
                ));
                $success = "Category Added successfully.";
                $categories = getCategories();
            } else {
                $error = "Category already exist!";
            } 
        } 
    }
    
    if(isset($_POST['categoryId']) && isset($_POST['description'])){
        // insert into learning_info
        // break description by command seperate        
        $description = explode(",", $_POST['description']);
        $desc = '';
        $desc .= '<ul>';
        foreach($description as $key=>$val){
            $desc .= '<li>'.$val.'</li>';
        }
        $desc .= '</ul>';
        
        
        $statement = $conn->prepare("INSERT INTO learning_info(category_id,description,tags)  VALUES(:categoryVal,:descriptionVal,:tagsVal)");
        $statement->execute(array(
            "categoryVal" => $_POST['categoryId'],
            "descriptionVal" => $desc,
            "tagsVal" => $_POST['tags']
        ));
        $learningInfoId = $conn->lastInsertId();
        $successInfo = "Learning Information Added successfully.";
        //insert into learning_info_examples
        if(isset($_POST['example'])){
            foreach($_POST['example']  as $example){
                $image = $example['image'];
                $sub_image = $example['sub_image'];
                $image_header = $example['image_header'];
                $image_description = $example['image_description'];
                
                $statement = $conn->prepare("INSERT INTO learning_info_examples(learning_info_id,image,sub_image,image_header,image_description)  VALUES(:learningInfoIdVal,:imageVal,:subImageVal,:imageHeaderVal,:imageDescriptionVal)");
                $statement->execute(array(
                    "learningInfoIdVal" => $learningInfoId,
                    "imageVal" => $image,
                    "subImageVal" => $sub_image,
                    "imageHeaderVal" => $image_header,
                    "imageDescriptionVal" => $image_description
                ));
            }            
        }
    }
    $_POST = null;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Photography Learnings</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="style.css" rel="stylesheet" />
    <script>  
    $(document).ready(function () {
        var count = 0;
        addRow();
        function addRow(){
            count += 1;
            $('#learning_examples_form').append('<div id="' + count + 'Example" class="bordered"><div class="form-group"><label for="image">Image URL</label><input class="form-control" type="text" name="example[[' + count + '][image]]" id="example[[' + count + '][image]]"></div><div class="form-group"><label for="image">Sub Image URL</label><input class="form-control" type="text" name="example[[' + count + '][sub_image]]" id="example[[' + count + '][sub_image]]"></div><div class="form-group"><label for="image">Image Header</label><input class="form-control" type="text" name="example[[' + count + '][image_header]]" id="example[[' + count + '][image_header]]"></div><div class="form-group"><label for="image">Image Description</label><textarea rows="4" cols="50" class="form-control" name="example[[' + count + '][image_description]]" id="example[[' + count + '][image_description]]"></textarea></div></div>' );
            if(count > 1){
                $('#removeRow').removeClass('disabled');
            }            
        }
        function removeRow() {            
            $('#learning_examples_form #' + count + 'Example').remove();
            count -= 1;            
            if(count == 1){
                $('#removeRow').addClass('disabled');
            }
        }
        $(function(){
            $('#addRow').click(function(){
                addRow();        
            });
            $('#removeRow').click(function(){
                removeRow();        
            });
        });
    });             
    </script>
</head>
<body> 
    <div class="container">
        <?php if(!empty($error)){ ?>
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
            <strong><?php echo $error ;?></strong>
        </div>
        <?php } ?>
        <?php if(!empty($success)){ ?>
        <div class="alert alert-success">
            <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
            <strong><?php echo $success ;?></strong>
        </div>
        <?php } ?>
        <div class="row">
            <div class="col-sm-12">
                <h3>Create Category</h3>
            </div>
        </div>
        <div class="row margin-top20">
            <form method="POST" action="create.php">
                <input type="hidden" id="formName" value="learning">
                <div class="form-group">
                    <label for="email">Category:</label>
                    <input type="text" class="form-control" name="category" id="category" maxlength="250" required>
                </div>    
                <button type="submit" class="btn btn-primary col-sm-4 col-sm-push-4">Submit</button>
            </form>
        </div>
        <?php if(!empty($successInfo)){ ?>
        <div class="alert alert-success">
            <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
            <strong><?php echo $successInfo ;?></strong>
        </div>
        <?php } ?>
        <div class="row">
            <div class="col-sm-12">
                <h3>Enter Learning</h3>
            </div>
        </div>
        <form action="create.php" method="POST">
            <input type="hidden" id="formName" value="learning_info">
            <div class="form-group">
                <label for="email">Category:</label>
                <select class="form-control" id="categoryId" name="categoryId" required>
                    <?php
                        foreach($categories as $key=>$val){
                            echo '<option value="'.$key.'">'.$val.'</option>';
                        }                        
                    ?>
                </select>
            </div>    
                    
            <div class="form-group">
                <label for="email">Description(comma seperated): </label>
                <textarea class="form-control" name="description"  required id="description" rows="4" cols="50"></textarea>
            </div>            
            <div class="form-group">
                <label for="email">Tags(space seperated): </label>
                <input class="form-control" type="text" name="tags" id="tags" maxlength="250">
            </div>            
            <div class="form-group">
                <label for="email">Examples</label>
            </div>
            <div id="learning_examples_form" class="form-group">                
            </div>                
            <div class="row">
                <button type="button" class="btn btn-info col-sm-3 col-sm-push-2" id="addRow">Add Row</button>
                <button type="button" class="btn btn-danger disabled col-sm-3 col-sm-push-3" id="removeRow">Remove Row</button>
            </div>            
            <button type="submit" class="margin-top10 btn btn-primary col-sm-4 col-sm-push-4">Submit</button>
        </form>        
    </div>
    <footer class="container-fluid">
        <p class="text-center">VC35Photography</p>
    </footer>
</body>