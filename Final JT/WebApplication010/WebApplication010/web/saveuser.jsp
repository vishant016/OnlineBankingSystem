




<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="home.css">
         <style>
        
            .container {
                padding: 16px;
            }

            /* Full-width input fields */
            input[type=text] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }
               input[type=date] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }
            input[type=text]:focus{
                background-color: #ddd;
                outline: none;
            }

            /* Overwrite default styles of hr */
            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            /* Set a style for the submit/register button */
            .registerbtn {
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 48%;
                opacity: 0.8;
            }

            .registerbtn:hover {
                opacity:1;
            }

            /* Add a blue text color to links */
            a {
                color: dodgerblue;
            }

            /* Set a grey background color and center the text of the "sign in" section */
            .signin {
                background-color: #f1f1f1;
                text-align: center;
            }
        </style>

    </head>

    <body>
        <a href="admin.jsp">Back</a>
        <br>
         <div class="center">
            <div class="card">
                 <div class="container">
        <form action="adduser" method="post">
            <table width="350px" border=0 align="center" style="background-color:ffeeff;">


                <tr>
                    <td colspan=2  style="font-weight:bold;font-size:20pt;" align="center">Add User Detail </td>

                </tr>
                <tr>
                    <td colspan=2>&nbsp;</td>

                </tr>
                  <tr>
                    <td>Name </td>
                    <td><input type="text" name="name" placeholder="Name" required></td>
                </tr>
                  <tr>
                    <td>Address </td>
                    <td><input type="text" name="adress" placeholder="Adress" required></td>
                </tr>
                <tr>
                    <td>Account No. </td>
                    <td><input type="text" name="accountno" placeholder="Account number" required></td>
                </tr>
                <tr>
                    <td>Temp. user Name </td>
                    <td><input type="text" name="username" placeholder="Temp. username" required></td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td><input type="text" name="phone" placeholder="Contact number" pattern="[0-9]{10}" required></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" placeholder="Email id" required></td>
                </tr>
                <tr>
                    <td>Cif no.</td>
                    <td><input type="text" name="cif" placeholder="cif number" required></td>
                </tr>
                <tr>
                    <td>Date of birth</td>
                    <td><input type="date" name="dob" placeholder="dob" max="01-01-2001" required></td>
                </tr>
                  <tr>
                    <td>amount </td>
                    <td><input type="text" name="amount" placeholder="Amount" required></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" name="Submit" value="Add user" class="registerbtn"></td>
                </tr>
            </table>
        </form>
            </div>
            </div>
         </div>
    </body>
</html>


