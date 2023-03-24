<?php
    session_start();
    require_once('./API/getapp.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
        integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    <title>Trang chủ</title>
    <link rel="icon" href="assets/image/icon-pgn-11.jpg">
</head>
<body class="nen">
    <nav class="navbar navbar-expand-lg navbar-light bg-light py-3 sticky-top">
        <div class="container-fluid">
            <a  class="navbar-brand m-0 py-3" href="index.php" >SPStore <img src="./assets/image/icon-pgn-11.jpg" alt="" width="32" height="30" class="d-inline-block align-text-top"></a>
            <?php if(isset($_SESSION['user'])){?>
                <div>
                    <a class="btn btn-sm btn-outline-success mr-2" href="./dashboard/">Trang cá nhân</a>
                    <a class="btn btn-sm btn-outline-success" href="logout.php">Đăng xuất</a>
                </div>
            <?php } else {?>
                <div>
                    <a class="btn btn-sm btn-outline-success mr-2" href="login.php">Đăng nhập</a>
                    <a class="btn btn-sm btn-outline-success" href="register.php">Đăng ký</a>
                </div>
            <?php }?>
        </div>
    </nav>
<!-- Search Bar -->
<?php
     require_once('./API/function.php');
     $success ='';
     $error ='';
     $Name = ' ';
    if (isset($_POST['Searchproduct'])) {
        $Name = $_POST['Searchproduct'];
        $KeySearch = array_search($Name, array_column($data, 'name'));
        if($KeySearch === 0 ||!empty($KeySearch)){
            $Search = json_decode(getAppSearch($Name));
        }else{
            $error = "App not found !";
        }
        }
    if (empty($Name)) {
        $error = 'Please enter app name !';
    }
?>
 <script>
    function changeStyle(){
        var element = document.getElementById("mes");
        element.style.display = "none";
    }
    </script>
    <form  method="post"  enctype="multipart/form-data"> 
                    <div class= " d-flex justify-content-center">
                    <div class="input-group rounded w-25 ">
                    <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" name ="Searchproduct" id="Searchproduct"/>
                    <button type ="submit" onclick="changeStyle() name ="Searchproduct" class="input-group-text border-0" id="search-addon" >
                        <i class="fas fa-search"></i>
                        </button>
                    </div>
                    </div>
                <?php
                            if (!empty($error)) {
                                echo "<div class='d-flex justify-content-center' id ='mes'><div class='alert alert-danger text-center w-25'>$error</div></div>";
                            }   
                    ?>
            </form>
<?php  ?>
 <!-- Search Bar -->
    <div class="row">
        <div class="col-xl-3 col-lg-3 col-md-4 col-12 p-5">
        <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
                    <i class="fas fa-stream"></i>  Application
                </button>
                <?php
                 require_once('./API/function.php');
                     $getCategories = json_decode(getCategories());
                    foreach($getCategories as $category) {?>
            <div class="list-group">
                <button type="button" class="list-group-item list-group-item-action"><?=$category->name?></button>      
            </div>
            <?php } 
            ?>
        </div>
        <div class="col-xl-9 col-lg-9 col-md-8 col-12 p-5">
            <div class="row">
                <?php
                    $d = json_decode(getApp(1));
                    $ArrayName = array_column($d,'name');
                    $Search = json_decode(getAppSearch($Name));
                    foreach($d as $value){
                ?>
                    <div class="col-xl-2 col-lg-3 col-md-4 col-6 mb-4"<?php    
                        $KeySearch = array_search($Name, array_column($data, 'name'));
                        if (($KeySearch === 0 || !empty($KeySearch)) && in_array($Name,$ArrayName)) echo " style='display: none';";
                    ?>>
                            <div class="card p-3 shadow app-hover justify-content-center bg-dark mb-3 card text-white h-100"  >
                                <div class="w-75">
                                <img src="./dashboard/tmpfile/<?= $value->icon?>" class="card-img-top image-fluid" alt="..." width="auto" height="auto">
                                </div>
                                <div class="card-body p-2">
                                    <small class="card-text text-center "><?=$value->name?></small>
                                </div>
                                <a class="app-info-link" href="dashboard/tmpfileup/<?= $value->download?>" download><button class="btn btn-primary btn-block">Download</button></a>
                            </div>
                    </div>
                <?php } 
                foreach($Search as $Search1){
                    ?>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-6 mb-4 ">
                                <div class="card p-3 shadow app-hover justify-content-center bg-dark mb-3 card text-white h-100" >
                                    <div class="w-75">
                                    <img src="./dashboard/tmpfile/<?= $Search1->icon?>" class="card-img-top image-fluid" alt="..." width="auto" height="auto">
                                    </div>
                                    <div class="card-body p-2">
                                        <small class="card-text text-center "><?=$Search1->name?></small>
                                    </div>
                                    <a class="app-info-link" href="dashboard/tmpfileup/<?= $Search1->download?>" download><button class="btn btn-primary btn-block">Download</button></a>
                                </div>
                        </div>
                    <?php } 
                ?>
            </div>
        </div>
    </div>
    <footer class="bg-dark">
        <!-- Footer main -->
        <section class="ft-main">
            <div class="ft-main-item">
                <h2 class="ft-title">About</h2>
                <ul class="list-group-custom-footer">
                    <li><a class="text-white" href="#">Services</a></li>
                    <li><a class="text-white" href="#">Portfolio</a></li>
                    <li><a class="text-white" href="#">Pricing</a></li>
                    <li><a class="text-white" href="#">Customers</a></li>
                    <li><a class="text-white" href="#">Careers</a></li>
                </ul>
            </div>
            <div class="ft-main-item">
                <h2 class="ft-title">Resources</h2>
                <ul class="list-group-custom-footer">
                    <li><a class="text-white" href="#">Docs</a></li>
                    <li><a class="text-white" href="#">Blog</a></li>
                    <li><a class="text-white" href="#">eBooks</a></li>
                    <li><a class="text-white" href="#">Webinars</a></li>
                </ul>
            </div>
            <div class="ft-main-item">
                <h2 class="ft-title">Contact</h2>
                <ul class="list-group-custom-footer">
                    <li><a class="text-white" href="#">Help</a></li>
                    <li><a class="text-white" href="#">Sales</a></li>
                    <li><a class="text-white" href="#">Advertise</a></li>
                </ul>
            </div>
            <div class="ft-main-item text-white">
                <h2 class="ft-title">Stay Updated</h2>
                <p>Subscribe to our newsletter to get our latest news.</p>
                <form  method="POST">
                    <input class="form-control mb-3" type="email" name="email" placeholder="Enter email address">
                    <button class="btn btn-primary" type="submit" value="Subscribe">Subscribe</button>
                </form>
            </div>
        </section>
        <!-- Footer social -->
        <section class="ft-social">
            <ul class="ft-social-list">
                <li><a class="text-white" href="https://www.facebook.com/phansi2804"><i class="fab fa-facebook"></i></a></li>
                <li><a class="text-white" href="#"><i class="fab fa-twitter"></i></a></li>
                <li><a class="text-white" href="#"><i class="fab fa-instagram"></i></a></li>
                <li><a class="text-white" href="#"><i class="fab fa-github"></i></a></li>
                <li><a class="text-white" href="#"><i class="fab fa-linkedin"></i></a></li>
                <li><a class="text-white" href="#"><i class="fab fa-youtube"></i></a></li>
            </ul>
        </section>
        <!-- Footer legal -->
        <section class="ft-legal text-white">
            <ul class="ft-legal-list">
                <li><a class="text-white" href="#">Terms &amp; Conditions</a></li>
                <li><a class="text-white" href="#">Privacy Policy</a></li>
                <li>&copy; PhanSi 2021</li>
            </ul>
        </section>
    </footer>
</body>
</html>