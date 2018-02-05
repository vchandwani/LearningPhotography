<?php include 'session.php';  ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include 'header.html';  ?>
    <script>
        $(document).ready(function () {
            
            $("#myDIV .tag").each(function () {
                tags = $(this).attr("tag").split(' ');
                $.each(tags, function (index, value) {
                    if(value && value!=null){
                        var optionExists = ($('.search option[value=' + value + ']').length > 0);
                        if (!optionExists) {
                            $('.search').append('<option value=' + value + '>' + value + '</option>');
                        }
                    }
                    
                });
            });
            $('.search').select2();
            $('.search').select2({
                placeholder: 'Search'
            });

            $('.search').on("select2:unselect", function (e) {
                selectedtags = $('.search').val();
                if (selectedtags.length > 0) {
                    // make all tags hidden
                    $("#myDIV div.parentDiv").addClass("display-none");
                    $("#myDIV div.tag").addClass("display-none");
                    $('#myDIV div.parentDiv').each(function () {
                        var $this = $(this);
                        $this.children("div").each(function () {
                            var $div = $(this);                    
                            //display if tag attribute has the value
                            $div.children("div.tag").each(function () {
                                display = false;
                                tag = $(this).attr('tag');

                                $.each(selectedtags, function (index, value) {
                                    if (tag.indexOf(value) >= 0) {
                                        display = true;
                                        return false;
                                    }
                                });
                                if (display) {
                                    // Display the tag
                                    $(this).removeClass('display-none');
                                    $this.removeClass('display-none');
                                }
                            });
                        });
                    });
                } else {
                    // make all tags visible
                    $("#myDIV div.tag").removeClass("display-none");
                    $("#myDIV div.parentDiv").removeClass("display-none");

                }

            });
            $('.search').on("select2:select", function (e) {
                // make all tags hidden
                $("#myDIV div.parentDiv").addClass("display-none");
                $("#myDIV div.tag").addClass("display-none");
                selectedtags = $('.search').val();                
                $('#myDIV div.parentDiv').each(function () {
                    var $this = $(this);
                    $this.children("div").each(function () {
                        var $div = $(this);
                        //display if tag attribute has the value
                        $div.children("div.tag").each(function () {
                            display = false;
                            tag = $(this).attr('tag');
                            
                            $.each(selectedtags, function (index, value) {
                                if (tag.indexOf(value) >= 0) {
                                    display = true;
                                    return false;
                                }
                            });
                            if (display) {
                                // Display the tag
                                $(this).removeClass('display-none');
                                $this.removeClass('display-none');
                            }
                        });
                    });
                });
            });
            $(".carousel").swipe({
                swipe: function(event, direction, distance, duration, fingerCount, fingerData) {
                if (direction == 'left') $(this).carousel('next');
                if (direction == 'right') $(this).carousel('prev');
                },
                allowPageScroll:"vertical"
            });                    
        }); 
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function() {scrollFunction()};

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0; // For Safari
            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
        }      
    </script>
    
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
    <?php
    $error = '';
    $messageDelete = '';
    $messageUpdate = '';
    if(isset($_GET['admin']) && isset($_SESSION['admin'])){
        $editUpdate = true;
    } else{
        $editUpdate = false;
    }
    
    include 'connection.php';      
    $categoriesArray = [];
    $categories = array();
    $categoriesIdArray = array();
    $categoriesInfo = array();
    $categoriesInfoExamples = array();   
        
    $sql = 'SELECT learning.category, learning.id AS id, learning_info.id AS infoId, learning_info.description AS description, learning_info.tags AS tags, learning_info.category_id AS category_id
    FROM learning as learning
    LEFT OUTER JOIN learning_info ON learning.id = learning_info.category_id 
    ORDER BY learning.id, learning_info.id ASC';
    $stmt = $conn->prepare($sql);
    $stmt->execute();   
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        if(!in_array($row['category'], $categories, true)){
            array_push($categories,$row['category']);
            array_push($categoriesIdArray,$row['id']);
            $categoriesArray[$row['id']] = $row['category'];
        }
        
        $categoriesInfo[$row['category']][$row['infoId']]['id'] = $row['infoId'];
        $categoriesInfo[$row['category']][$row['infoId']]['category_id'] = $row['category_id'];
        $categoriesInfo[$row['category']][$row['infoId']]['tags'] = $row['tags'];
        $categoriesInfo[$row['category']][$row['infoId']]['description'] = $row['description'];            
        
        $rowID = $row['infoId'];
        // Query to get examples
        $sql1 = "SELECT learning_info_examples.* 
        FROM learning_info_examples as learning_info_examples
        WHERE learning_info_id = $rowID
        ORDER BY learning_info_examples.learning_info_id ASC";
        
        $stmt1 = $conn->prepare($sql1);
        $stmt1->execute();  
        while($row1 = $stmt1->fetch(PDO::FETCH_ASSOC)) {
            $categoriesInfoExamples[$row['category']][$row['infoId']][] = $row1;
        }
    }
    if(isset($_POST['deleteCategory'])){
        // Send delete request
        $sql = "DELETE FROM learning WHERE id = ?";        
        $q = $conn->prepare($sql);    
        $response = $q->execute(array($_POST['deleteCategoryId']));    
        $messageDelete = "Category successfully deleted";  
        $_POST['deleteCategory'] = null;
        header("Refresh:0; url=index.php?admin=true");        
    } 
    if(isset($_POST['updateCategoryId'])) {
        // Send update request
        $var=$_POST['category'];
        // check value exist in db
        $query = 'SELECT * FROM learning WHERE id != '.$_POST['updateCategoryId'].'  AND category LIKE ? ';
        $params = array("%$var%");
        if(!empty($params)) {
            $stmt = $conn->prepare($query);
            $stmt->execute($params);            
            $row1 = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!$row1) {
                // update
                $sql = "UPDATE learning SET category = :categoryVal
                WHERE id = :Id";
                $stmt = $conn->prepare($sql);									 
                $stmt->bindParam(':categoryVal', $_POST['category'], PDO::PARAM_STR);
                $stmt->bindParam(':Id', $_POST['updateCategoryId'], PDO::PARAM_INT);
                $stmt->execute();
                $_POST['updateCategoryId'] = null;
                $messageUpdate = "Category updated successfully";
                sleep(2);
                header("Refresh:0; url=index.php?admin=true");
            } else {
                $error = "Category already exist!";
            } 
        }        
    }

    if(isset($_POST['deleteCategoryInfoId'])){
        // Send delete request
        $sql = "DELETE FROM learning_info WHERE id = ?";        
        $q = $conn->prepare($sql);    
        $response = $q->execute(array($_POST['deleteCategoryInfoId']));    
        $messageDelete = "Category Information successfully deleted";  
        $_POST['deleteCategoryInfoId'] = null;
        header("Refresh:0; url=index.php?admin=true");        
    } 
    if(isset($_POST['updateCategoryInfoId'])) {
        // Send update request
        $description = explode(".,", $_POST['description']);
        foreach($description as $key=>$val) {
            if(isset($val) && !empty($val)){
                $desc .= '<ul>';
                $desc .= '<li>'.$val.'</li>';
                $desc .= '</ul>';    
            }   
         }

        $sql = "UPDATE learning_info SET  category_id = :categoryIdVal, description = :descriptionVal, tags = :tagsVal
        WHERE id = :Id";
        $stmt = $conn->prepare($sql);									 
        $stmt->bindParam(':categoryIdVal', $_POST['categoryId'], PDO::PARAM_INT);
        $stmt->bindParam(':descriptionVal', $desc, PDO::PARAM_STR);
        $stmt->bindParam(':tagsVal', $_POST['tags'], PDO::PARAM_STR);
        $stmt->bindParam(':Id', $_POST['updateCategoryInfoId'], PDO::PARAM_INT);
        $stmt->execute();
        $_POST['updateCategoryInfoId'] = null;        
        $messageUpdate = "Category Infromation updated successfully";
        sleep(2);
        header("Refresh:0; url=index.php?admin=true");
    }

    if(isset($_POST['deleteInfoExampleId'])){
        // Send delete request
        $sql = "DELETE FROM learning_info_examples WHERE id = ?";        
        $q = $conn->prepare($sql);    
        $response = $q->execute(array($_POST['deleteInfoExampleId']));    
        $messageDelete = "Example successfully deleted";  
        $_POST['deleteInfoExampleId'] = null;
        header("Refresh:0; url=index.php?admin=true");        
    } 
    if(isset($_POST['updateInfoExampleId'])) {
        // Send update request
        $sql = "UPDATE learning_info_examples SET  image = :imageVal, sub_image = :subImageVal, image_header = :imageHeaderVal, image_description = :imageDescriptionVal
        WHERE id = :Id";
        $stmt = $conn->prepare($sql);									 
        $stmt->bindParam(':imageVal', $_POST['example'][$_POST['updateInfoExampleId']]['image'], PDO::PARAM_INT);
        $stmt->bindParam(':subImageVal', $_POST['example'][$_POST['updateInfoExampleId']]['sub_image'], PDO::PARAM_STR);
        $stmt->bindParam(':imageHeaderVal', $_POST['example'][$_POST['updateInfoExampleId']]['image_header'], PDO::PARAM_STR);
        $stmt->bindParam(':imageDescriptionVal', $_POST['example'][$_POST['updateInfoExampleId']]['image_description'], PDO::PARAM_STR);
        $stmt->bindParam(':Id', $_POST['updateInfoExampleId'], PDO::PARAM_INT);
        $stmt->execute();
        $_POST['updateInfoExampleId'] = null;
        $messageUpdate = "Example updated successfully. Refresh the page to see the change.";
    }
    $_POST = null;
    ?>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-sm-3" id="myScrollspy">
                <ul class="nav nav-pills nav-stacked">
                    <li class="hidden-sm hidden-xs"><img class="icon-rotate img-rounded big-img" alt="VC35Photography" src="favicon.png"></li>
                    <?php
                     foreach($categories as $val){
                        echo '<li><a href="#'.$val.'">'.$val.'</a></li>';  
                     }                     
                     ?>
                </ul>
            </nav>

            <div class="col-sm-9">
                <div class="tab-content">
                    <div id="head">
                        <h4>
                            <span class="hidden-lg hidden-md float-left">
                                <img class="icon-rotate img-rounded small-img" alt="VC35Photography" src="favicon.png">
                            </span>
                            <span class="header-text">VC35Photography</span>                            
                        </h4>
                        <h6 class="search-width">
                            <span>
                                <a href="https://www.instagram.com/vc35photography/" target="blank"><i class="fa fa-instagram"></i></a>
                                <a href="https://www.facebook.com/vc35photography/" target="blank"><i class="fa fa-facebook"></i></a>
                            </span>
                            <span class="logout">Welcome, <?php echo $_SESSION['login_user'].' <span class="fa fa-ellipsis-v"></span> ';  ?> <a href="logout.php">Logout</a></span>
                        </h6>
                        <div class="search-width">
                            <p class="margin-top14"></p>
                            <select class="search" name="searchtags[]" multiple="multiple">
                            </select>
                        </div>
                    </div>
                    <div id="myDIV">
                            <?php if(!empty($messageDelete)){ ?>
                            <div class="alert alert-success">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                                <strong><?php echo $messageDelete ;?></strong>
                            </div>
                            <?php } ?>
                            <?php if(!empty($messageUpdate)){ ?>
                            <div class="alert alert-success">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                                <strong><?php echo $messageUpdate ;?></strong>
                            </div>
                            <?php } ?>
                            <?php if(!empty($error)){ ?>
                                <div class="alert alert-danger">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                                    <strong><?php echo $error ;?></strong>
                                </div>
                            <?php } ?>
                        <?php
                        foreach ($categories as $key=>$category) {
                                echo '<div id="'.$category.'" class="parentDiv">'; 
                        ?>                            
                                <h3 class="height30 row">
                                    <button class="col-xs-10" data-toggle="collapse" data-target="#<?php echo $category; ?>_info">
                                        <span class="glyphicon glyphicon-menu-right"></span><?php echo $category; ?>
                                    </button>
                                    <?php if($editUpdate){ ?>
                                        <div class="col-xs-2 padding-0">
                                            <button type="button" class="btn btn-link col-xs-6 btn-xs" data-toggle="modal" data-target="#myModal<?php echo $key?>"><span class="glyphicon glyphicon-pencil"></span></button>
                                            <form method="POST" action="index.php?admin=true" onsubmit="return confirm('Do you really want to submit the form?');">
                                                <input type="hidden" name="deleteCategory" id="deleteCategory" value="true">
                                                <input type="hidden" name="deleteCategoryId" id="deleteCategoryId" value="<?php echo $categoriesIdArray[$key]?>">
                                                <button type="submit" class="btn btn-link col-xs-6 btn-xs"><span class="glyphicon glyphicon-remove"></span></button>
                                            </form>
                                        </div>
                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal<?php echo $key?>" role="dialog">
                                            <div class="modal-dialog">                        
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                <form method="POST" name="updateForm" action="index.php?admin=true" onsubmit="return confirm('Do you really want to submit the form?');">
                                                        <input type="hidden" name="updateCategory" id="updateCategory" value="true">
                                                        <input type="hidden" name="updateCategoryId" id="updateCategoryId" value="<?php echo $categoriesIdArray[$key]?>">
                                                        <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                                        <h4 class="modal-title">Update</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="email">Category:</label>
                                                                <input type="text" class="form-control" value="<?php echo $category; ?>" name="category" id="category" maxlength="250" required>
                                                            </div> 
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary col-sm-3 col-sm-push-3 col-xs-5 col-xs-push-1">Submit</button>
                                                            <button type="button" class="btn btn-default col-sm-3 col-sm-push-3 col-xs-5 col-xs-push-1" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </form>
                                                </div>                        
                                            </div>
                                        </div>
                                    <?php } ?>
                                </h3>
                                <?php
                                echo '<div id="'.$category.'_info" class="collapse">';
                                ?>
                                <?php
                                foreach ($categoriesInfo[$category] as $id => $categoryInfo) {
                                    $tagsArray = [];
                                    $tagsString = '';
                                    $tagsArray = explode(" ", $categoryInfo['tags']);
                                    
                                    $replaceArray = array("<ul>","<li>","</ul>");
                                    $descriptionView = str_replace($replaceArray, "", $categoryInfo['description']);
                                    $descriptionView = str_replace("</li>", ".,", $descriptionView);
                                ?>
                                <div class="tag" tag="<?php echo $categoryInfo['tags']; ?>">
                                    <?php 
                                        echo '<div class="row"> <div class="col-xs-10">';
                                        foreach($tagsArray as $keyVal=>$tagsval) {
                                            $tagsString = $tagsString.$tagsval;                            
                                            echo '<span class="label label-primary span-warp">'.$tagsval.'</span>';
                                        }  ?>
                                    <?php echo '</div><div class="col-xs-2 padding-0">'; 
                                        if($editUpdate){ ?>
                                            <div class="col-xs-12 padding-0">
                                                <button type="button" class="btn btn-link col-xs-6 btn-xs" data-toggle="modal" data-target="#infoModal<?php echo $id?>"><span class="glyphicon glyphicon-pencil"></span></button>
                                                <form method="POST" action="index.php?admin=true" onsubmit="return confirm('Do you really want to submit the form?');">
                                                    <input type="hidden" name="deleteCategoryInfo" id="deleteCategoryInfo" value="true">
                                                    <input type="hidden" name="deleteCategoryInfoId" id="deleteCategoryInfoId" value="<?php echo $categoryInfo['id'] ?>">
                                                    <button type="submit" class="btn btn-link col-xs-6 btn-xs"><span class="glyphicon glyphicon-remove"></span></button>
                                                </form>
                                            </div>
                                            <!-- Modal -->
                                            <div class="modal fade" id="infoModal<?php echo $id?>" role="dialog">
                                                <div class="modal-dialog">                        
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                    <form method="POST" name="infoUpdateForm" action="index.php?admin=true" onsubmit="return confirm('Do you really want to submit the form?');">
                                                            <input type="hidden" name="updateCategoryInfo" id="updateCategoryInfo" value="true">
                                                            <input type="hidden" name="updateCategoryInfoId" id="updateCategoryInfoId" value="<?php echo $categoryInfo['id'] ?>">
                                                            <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                            <h4 class="modal-title">Update</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label for="email">Category:</label>
                                                                    <select class="form-control" id="categoryId" name="categoryId" required>
                                                                        <?php
                                                                            foreach($categoriesArray as $key=>$val){                                                                                    
                                                                                echo '<option '.( $category == $val ? 'selected="selected"' : '' ).' value="'.$key.'">'.$val.'</option>';
                                                                            }                        
                                                                        ?>
                                                                    </select>
                                                                </div>    
                                                                        
                                                                <div class="form-group">
                                                                    <label for="email">Description(full top comma seperated .,): </label>
                                                                    <textarea class="form-control" name="description"  required id="description" rows="4" cols="50"><?php echo $descriptionView; ?></textarea>
                                                                </div>            
                                                                <div class="form-group">
                                                                    <label for="email">Tags(space seperated): </label>
                                                                    <input class="form-control" type="text" name="tags" id="tags" maxlength="250" value="<?php echo $categoryInfo['tags']; ?>">
                                                                </div>  
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary col-sm-3 col-sm-push-3 col-xs-5 col-xs-push-1">Submit</button>
                                                                <button type="button" class="btn btn-default col-sm-3 col-sm-push-3 col-xs-5 col-xs-push-1" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </form>
                                                    </div>                        
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php 
                                            echo '</div></div>';
                                        ?>
                                    <p class="margin-top10">
                                        <?php                                             
                                            echo htmlspecialchars_decode($categoryInfo['description']);
                                            if(isset($categoriesInfoExamples[$category][$categoryInfo['id']])) {
                                                // Display examples
                                                echo '<div id="'.$category.$tagsString.'Carousel" class="carousel" data-ride="carousel" data-interval=false>';
                                                    //Indicators
                                                    echo '<ol class="carousel-indicators">';
                                                    $ol = 0;
                                                    foreach($categoriesInfoExamples[$category][$categoryInfo['id']] as $exampleId=>$exampleVal){
                                                        if($ol == 0){
                                                            echo '<li data-target="#'.$category.$tagsString.'Carousel" data-slide-to="'.$ol.'" class="active"></li>';
                                                        } else {
                                                            echo '<li data-target="#'.$category.$tagsString.'Carousel" data-slide-to="'.$ol.'"></li>';
                                                        }                                                    
                                                        $ol++;                                                
                                                    }
                                                    echo '</ol>';
                                                    //Wrapper for slides
                                                    echo '<div class="carousel-inner">';
                                                    $info = 0;
                                                    foreach($categoriesInfoExamples[$category][$categoryInfo['id']] as $exampleId=>$exampleVal){ ?>
                                                        <?php if($editUpdate){  ?>
                                                            <div id="editDeleteExample<?php echo $exampleVal['id'] ?>">                                                                
                                                                <!-- Modal -->
                                                                <div class="modal fade" id="infoExampleModal<?php echo $exampleVal['id'] ?>" role="dialog">
                                                                    <div class="modal-dialog">                        
                                                                        <!-- Modal content-->
                                                                        <div class="modal-content">
                                                                        <form method="POST" name="infoExampleUpdateForm<?php echo $exampleVal['id'] ?>" action="index.php?admin=true" onsubmit="return confirm('Do you really want to submit the form?');">
                                                                                <input type="hidden" name="updateInfoExampleId" id="updateInfoExampleId" value="<?php echo $exampleVal['id'] ?>">
                                                                                <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                                                <h4 class="modal-title">Update</h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <div id="<?php echo $exampleVal['id'] ?>Example" class="bordered">
                                                                                        <div class="form-group">
                                                                                            <label for="image">Image URL</label><input value="<?php echo $exampleVal['image'] ?>" class="form-control" type="text" name="example[<?php echo $exampleVal['id'] ?>][image]" id="example[<?php echo $exampleVal['id'] ?>][image]">
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="image">Sub Image URL</label><input value="<?php echo $exampleVal['sub_image'] ?>" class="form-control" type="text" name="example[<?php echo $exampleVal['id'] ?>][sub_image]" id="example[<?php echo $exampleVal['id'] ?>][sub_image]">
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="image">Image Header</label><input value="<?php echo $exampleVal['image_header'] ?>" class="form-control" type="text" name="example[<?php echo $exampleVal['id'] ?>][image_header]" id="example[<?php echo $exampleVal['id'] ?>][image_header]">
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="image">Image Description</label><textarea rows="4" cols="50" class="form-control" name="example[<?php echo $exampleVal['id'] ?>][image_description]" id="example[<?php echo $exampleVal['id'] ?>][image_description]"><?php echo $exampleVal['image_description']; ?></textarea>
                                                                                        </div>
                                                                                    </div>
                                                                                    
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary col-sm-3 col-sm-push-3 col-xs-5 col-xs-push-1">Submit</button>
                                                                                    <button type="button" class="btn btn-default col-sm-3 col-sm-push-3 col-xs-5 col-xs-push-1" data-dismiss="modal">Close</button>
                                                                                </div>
                                                                            </form>
                                                                        </div>                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <?php } ?>
                                                        <?php
                                                        if($info == 0){
                                                            echo '<div class="item active">';
                                                        } else {
                                                            echo '<div class="item">';
                                                        }
                                                            echo '<img class="img-responsive" src="'.$exampleVal['image'].'" alt="'.$exampleVal['image_header'].'">';
                                                            if($exampleVal['sub_image']){
                                                                echo '<img class="sub-img" src="'.$exampleVal['sub_image'].'" alt="'.$exampleVal['image_header'].'">';
                                                            }                                                            
                                                            echo '<div class="carousel-caption">';
                                                            ?>
                                                            <?php
                                                                echo '<h3>'.$exampleVal['image_header'].'</h3>';
                                                                echo '<p>'.$exampleVal['image_description'].'</p>';
                                                            echo '</div>'; 
                                                            ?>
                                                            <?php if($editUpdate){  ?>
                                                                <div class="col-xs-2 col-xs-push-5 padding-0">
                                                                    <button type="button" class="btn btn-link col-xs-6 btn-xs" data-toggle="modal" data-target="#infoExampleModal<?php echo $exampleVal['id'] ?>"><span class="glyphicon glyphicon-pencil"></span></button>
                                                                    <form method="POST" name="exampleDelete<?php echo $exampleVal['id'] ?>" action="index.php?admin=true" onsubmit="return confirm('Do you really want to submit the form?');">
                                                                        <input type="hidden" name="deleteInfoExampleId" id="deleteInfoExampleId" value="<?php echo $exampleVal['id'] ?>">
                                                                        <button type="submit" class="btn btn-link col-xs-6 btn-xs"><span class="glyphicon glyphicon-remove"></span></button>
                                                                    </form>
                                                                </div>
                                                            <?php } ?>
                                                        <?php
                                                        echo '</div>';
                                                        ?>                                                        
                                                        <?php $info ++;
                                                    }                                                    
                                                    echo '</div>';
                                                    // Left and right controls 
                                                    echo '<a class="left carousel-control" href="#'.$category.$tagsString.'Carousel" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                    <a class="right carousel-control" href="#'.$category.$tagsString.'Carousel" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                                        <span class="sr-only">Next</span>
                                                    </a>';
                                                echo '</div>';
                                            }                                            
                                        ?>
                                    </p>
                                </div>
                                <?php
                                }
                                echo '</div>';
                                ?>
                        <?php
                            echo '</div>';
                        } 
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include 'footer.html';  ?>    
</body>
</html>