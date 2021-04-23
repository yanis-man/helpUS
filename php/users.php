<?php

class User
{
    protected $surname;
    protected $name;
    protected $email;
    protected $level;
    protected $user_class;
    protected $uuid;
    protected $role;
    
    function __construct($surname, $name, $email, $level, $class_,$uuid, $role)
    {
        $this->surname = $surname;
        $this->name = $name;
        $this->email = $email;
        $this->level = $level;
        $this->class_ = $class_;
        $this->uuid = $uuid;
        $this->role = $role;
    }
}

?>