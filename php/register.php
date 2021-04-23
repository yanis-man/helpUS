<?php
session_start();
if(isset($_POST))
{
    require_once("database.php");
    require_once("users.php");

    $db = new Database();

    $_POST = $db->sanitize($_POST);

    $SQL = "SELECT uuid FROM users WHERE email=?";
    $isDouble = $db->check_double_entry($SQL, array($_POST['email']));
    if($isDouble == false)
    {
        $hash = $db->hasher($_POST['password']);
        $SQL = "INSERT INTO users (surname, s_name, passwd, email, s_level, class, uuid, s_role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $uuid = time();
        $data = array($_POST['surname'], $_POST['name'], $hash, $_POST['email'], (int) $_POST['level'], (int) $_POST['class_'], $uuid, 0);

        $db = new Database();
        $db->push($SQL, $data);

        $db = null;

        header('Content-Type: application/json');

        $_SESSION['user'] = new User($_POST['surname'], $_POST['name'], $_POST['email'], (int) $_POST['level'], (int) $_POST['class_'], $uuid, 0);
    }
}
//$name, $surname, $email, $level, $class_,$password



?>