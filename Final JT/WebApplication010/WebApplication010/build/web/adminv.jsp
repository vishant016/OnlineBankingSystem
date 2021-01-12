<!DOCTYPE html>
<html>
    <head>
         <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
        %>
        <link rel="stylesheet" type="text/css" href="home.css">
        <script>
            // Get the modal
            var modal = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            form {border: 10px solid #f1f1f1;}

            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
        </style>

    </head>
    <body>
      
     


        <div class="card">
            <a href="start.jsp">home</a>
         
        </div>
      
        <div class="leftcolumn">
            <div class="card">
                <div class="card">

                </div>
                
                <div id="id01" class="modal">
                <h2>Admin Login Form</h2>


                    <form class="modal-content animate" action="adminservlet">
                        <div class="container">
                            <label for="uname"><b>Username</b></label>
                            <input type="text" placeholder="Enter Username" name="uname" required>

                            <label for="psw"><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" min="6" max="12" name="psw" required>

                            <button type="submit">Login</button>
                            <label>
                                <input type="checkbox" checked="checked" name="remember"> Remember me
                            </label>
                        </div>

                        <div class="container" style="background-color:#f1f1f1">
                            <button type="cancel" onclick="window.location = 'http://localhost:8084/WebApplication10/start.jsp'" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>

      

    </body>
</html>
