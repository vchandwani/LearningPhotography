<?php
    include 'connection.php';
    $error = '';
    $success = '';
    $errorInfo = '';
    $successInfo = '';
    $categories = [];
    $categoriesArray = [];
    $tags = [];
    $tagsArray = [];

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

    function getTags(){
        include 'connection.php';
        $sql3 = 'SELECT learning_info.* 
        FROM learning_info as learning_info
        ORDER BY learning_info.id ASC';
        $stmt3 = $conn->prepare($sql3);
        $stmt3->execute();        
        while($row = $stmt3->fetch(PDO::FETCH_ASSOC)) {  
            $tagsArray[] = $row['tags'];
            $pieces = explode(" ", $row['tags']);
            foreach ($pieces as $value) {
                $tagsArray[] = $value;
            }
        }
        return array_unique($tagsArray);
    }
    $tags = getTags();

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
                sleep(2);
                header("Refresh:0; url=create.php");
            } else {
                $error = "Category already exist!";
                sleep(2);
                header("Refresh:0; url=create.php");
            } 
        } 
        $_POST['category'] = null;
    }
    
    if(isset($_POST['categoryId'])){
        if(isset($_POST['availableTags']) && !empty($_POST['availableTags'])){
            $concatenatedTags = '';
            // check tag value and selected tags if any
            foreach($_POST['availableTags'] as $availableTags){
                $concatenatedTags .= $availableTags . ' ';
            }
            $concatenatedTags .= ' '.$_POST['tags'];
            $concatenatedTags = implode(' ',array_unique(explode(' ', $concatenatedTags)));
            // Assigning value back to post variable
            $_POST['tags'] = $concatenatedTags;
            $concatenatedTags = '';
        }
        // insert into learning_info
        // break description by command seperate        
        $desc = '';
        if(isset($_POST['description']) && !empty($_POST['description'])){
            $description = explode(",", $_POST['description']);
            $desc .= '<ul>';
            foreach($description as $key=>$val){
                $desc .= '<li>'.$val.'</li>';
            }
            $desc .= '</ul>';
        }       
        $newInfo = false;     
        if(isset($_POST['tags']) && !empty($_POST['tags'])){
            $tagCheck = $_POST['tags'];
            $categoryId = $_POST['categoryId'];
            // Check if exactly same tags value exist or not
            $sqlTags = "SELECT learning_info.* 
            FROM learning_info as learning_info
            WHERE tags = '$tagCheck' AND category_id = '$categoryId'
            ORDER BY learning_info.id ASC
            LIMIT 1";
            $stmtTags = $conn->prepare($sqlTags);
            $stmtTags->execute(); 
            $rowTags = $stmtTags->fetchAll();
            if($rowTags[0]){
                $rowTags = $rowTags[0];
                $existingDescription = $rowTags['description'];
                $newDescription = $existingDescription .' '.$desc;
                $sql = "UPDATE learning_info SET description = :descriptionVal
                WHERE id = :Id";
                $stmt = $conn->prepare($sql);									 
                $stmt->bindParam(':descriptionVal', $newDescription, PDO::PARAM_STR);
                $stmt->bindParam(':Id', $rowTags['id'], PDO::PARAM_INT);
                $stmt->execute();
                $learningInfoId = $rowTags['id'];
                $successInfo = "Learning Information Added successfully.";                
            } else {
                $newInfo = true;
            }            
        } else {
            $newInfo = true;            
        }
        if($newInfo) {
            // New value added
            $statement = $conn->prepare("INSERT INTO learning_info(category_id,description,tags)  VALUES(:categoryVal,:descriptionVal,:tagsVal)");
            $statement->execute(array(
                "categoryVal" => $_POST['categoryId'],
                "descriptionVal" => $desc,
                "tagsVal" => $_POST['tags']
            ));
            $learningInfoId = $conn->lastInsertId();
            $successInfo = "Learning Information Added successfully.";            
        }
        if($learningInfoId){
            //insert into learning_info_examples
            if(isset($_POST['example']) && !empty($_POST['example'])){
                foreach($_POST['example']  as $example){
                    if($example['image'] || $example['sub_image'] || $example['sub_image_headerimage'] || $example['image_description']){
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
        }        
        sleep(2);
        header("Refresh:0; url=create.php");
        $_POST['categoryId'] = null;
    }    
    $_POST = array();    
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
    <link href="select2.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
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
        $('.search').select2();
        $('.search').select2({
            placeholder: 'Search Tag'
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
                <textarea class="form-control" name="description"  id="description" rows="4" cols="50"></textarea>
            </div>            
            <div class="form-group">
                <label for="email">Tags(space seperated): </label>
                <input class="form-control" type="text" name="tags" id="tags" maxlength="250">
            </div>            
            <div class="form-group">
                <label for="email">Available Tags </label>
            </div>            
            <div class="checkbox">
                <select class="search" name="availableTags[]" id="availableTags" multiple="multiple">
                <?php
                    foreach($tags as $val) {
                        echo '<option value="'.$val.'">'.$val.'</option>';
                    }                        
                ?>
                </select>                     
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