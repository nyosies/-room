<!DOCTYPE html>
<html lang="en">
<head>
    <?php
    session_start();
    require_once ("config.php");
    include("footer_head.php");
    ?>
</head>
<?php
if(isset($_POST["submit"])&&$_POST["submit"]) {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $right = $_POST["right"];
    switch ($right) {
    case "admin":
        $sqlLogin = "SELECT `admin_ID` FROM tbl_admin WHERE admin_userName='" . $username . "'AND admin_password='" . $password . "'";
    if ($res = mysqli_query($db, $sqlLogin)) {
    if ($gets = mysqli_fetch_assoc($res)) {
        echo "succsess";
        $_SESSION["right"] = 0;
        $_SESSION["admin_ID"] = $gets["admin_ID"];
        ?>
        <script>window.location = "1_DRM_index.php?LoginName=<?php echo $gets["admin_ID"]?>";</script><?php
    }else{
    ?>
        <script>
            alert("密码错误！");
            window.location = "sign-in.php";
        </script>
    <?php
    }
    } else {
        echo $sqlLogin;
    }
    break;
    case "teacher":
    $sqlLogin = "SELECT `tea_ID` FROM tbl_teacher WHERE `tea_userName`='" . $username . "'AND `tea_password`='" . $password . "'";
    if ($res = mysqli_query($db, $sqlLogin)) {
    if ($gets = mysqli_fetch_assoc($res)) {
    $_SESSION["right"] = 1;
    $_SESSION["tea_ID"] =$gets["tea_ID"];
    ?>
        <script>window.location = "2_DRM_index.php";</script><?php
    }else{
    ?>
        <script>
            alert("密码错误！");
            window.location = "sign-in.php";
        </script>
    <?php
    }
    } else {
        echo $sqlLogin;
    }
    break;
    case "student":
    $sqlLogin = "SELECT `stu_ID` FROM tbl_student WHERE `stu_userName`='$username'AND `stu_password`='$password'";
    if ($res = mysqli_query($db, $sqlLogin)) {
    if ($gets = mysqli_fetch_assoc($res)) {
    // echo "succsess";
    $_SESSION["right"] = 2 ;
    $_SESSION["un"] = $gets['stu_ID'];
    ?>
        <script>window.location = "3_DRM_index.php?LoginName=<?php echo $gets['stu_ID']?>";</script><?php

    }else{
    ?>
        <script>
            alert("密码错误！");
            window.location = "sign-in.php";
        </script>
    <?php
    }
    } else {
        echo $sqlLogin;
    }
    break;
    default:
    $sqlLogin = ""; ?>
        <script>window.location = "sign_in.php"</script><?php ;
        break;
    }
}else{
?>
<style>
   h1{
    color:#000;
    font-weight: 400;
    text-align:center;
   }
   h2{font-weight: 400;
       color:#000;
       text-align:center;
   }
   /* body{
       background:#d7d7d7;
   } */
</style>
<body>
<div class="row-fluid">
 <h1>学生管理系统</h1>
 <h2>
Welcome to our student management system</h2>
    <div class="dialog">
        <div class="block">
            <p class="block-heading">登录</p>
            <div class="block-body">
                <form action="sign-in.php" method="post">
                    <label>用户权限：</label>
                    <select name="right" class="span12">
                        <option value="admin">管理员</option>
                        <option value="teacher">教师</option>
                        <option value="student">学生</option>
                    </select>
                    <label>用户名：</label>
                    <input type="text" class="span12" name="username">
                    <label>密码：</label>
                    <input type="password" class="span12" name="password">

                    <input class="btn btn-primary pull-right" type="submit" name="submit" value="登录">
                    <label class="remember-me"><input type="checkbox">记住我</label>
                </form>
            </div>
        </div>
        <p class="pull-right" style=""></p>
        <p><a href="reset-password.php">忘记密码？</a></p>
    </div>
</div>


<script src="lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function () {
        $('.demo-cancel-click').click(function () {
            return false;
        });
    });
</script>

</body>
</html>

<?php
}
?>
