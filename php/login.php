<?php
session_start();
if(isset($_POST))
{
    require_once("database.php");
    require_once("error.php");

    $SQL = "SELECT * FROM users WHERE email=?";
    $db = new Database();

    $_POST = $db->sanitize($_POST);
    
    $result = $db->pull($SQL, array($_POST['email']));
    $hashed_password = $db->hasher($_POST['password']);

    $db = null;

    if($result)
    {
        header('Content-Type: application/json');
        $result = $result['0'];
        if($result['passwd'] == $hashed_password)
        {
            echo json_encode(['uuid' => $result['uuid'], 'error' => "none"]);
            $_SESSION['user'] = new User($result['surname'], $result['s_name'], $result['email'], (int) $result['s_level'], (int) $result['class_'], $result['uuid'], $result['s_role']);
        }
        else
        {
            $credErr = new ErrorMSG("CredentialsException");
            echo $credErr->sendErr();
        }
    }
    else
    {
        echo json_encode(["status"=>"error"]);
    }

}

?>