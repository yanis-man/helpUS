$(document).ready(function(){

    $("button").click(function(){

        const name = document.getElementsByName("name")[0].value;
        const surname = document.getElementsByName("surname")[0].value;
        const email = document.getElementsByName("email")[0].value;
        const level = $("#level option:selected").val();
        const class_ = $("#class option:selected").val();
        const password = document.getElementsByName("password")[0].value;

        if(name && surname && level && class_ && email && password)
        {
            $.post("../php/register.php", 
            {
                name: name,
                surname:surname,
                email:email,
                level:level,
                class_:class_,
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