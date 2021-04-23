<?php
    require_once("users.php");
    require_once("database.php");

    class Student extends User
    {
        public $surname;
        public $name;
        public $email;
        public $level;
        public $user_class;
        public $uuid;
        public $role;
        protected $db;

        public $mentor_uuid;
        
    public function __construct($surname, $name, $email, $level, $class_,$uuid, $role)
    {
        $db = new Database();

        $result = $db->get("SELECT mentor FROM students WHERE uuid=?", array($uuid));
        //need to search for student mentors by requesting in databse
        $this->surname = $surname;
        $this->name = $name;
        $this->email = $email;
        $this->level = $level;
        $this->class_ = $class_;
        $this->uuid = $uuid;
        $this->role = $role;

        $this->mentor_uuid = explode(",", $result[0]['mentor']);

        User::__construct($surname, $name, $email, $level, $class_, $uuid, $role);
    }

    public function getMentor()
    {
        $tmp_result = $this->db->pull("SELECT mentor FROM students WHERE uuid=?", array($this->uuid));
        return explode(",", $tmp_result[0]["mentor"]);
    }

    public function addMentor($newMentor)
    {
        $uuid_string;

        foreach($this->mentor_uuid as $uuid)
        {
            $uuid_string = $uuid_string.$uuid;
        }

        $uuid_string.$newMentor;

        $this->db->push("UPDATE students SET mentor=? WHERE uuid=?", array($uuid_string, $this->uuid));
    }

    public function __destruct()
    {
        $this->db = null;
    }

    }
?>