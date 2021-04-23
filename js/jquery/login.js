$(document).ready(function(){

    $("button").click(function(){

        const email = document.getElementsByName("email")[0].value;
        const password = document.getElementsByName("password")[0].value;

        if(email && password)
        {
            $.post("../php/login.php", 
            {
                email:email,
                password:password

            }
            )
            .success(function(data)
            {
                if(data["error"] === "none")
                {
                    location.href = '../index.html';
                }
            });
        }
    });

  });