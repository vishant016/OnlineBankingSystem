package g;

import java.sql.*;

public class RegisterUser {

    static int status = 0;
    //private static int accountno;
//static int accountno=1;

    public static int register(String usrname, String password,String phone, String email, String cif) {
        //public static int register(String email,String password,String gender,String country,String na){

        Connection con = GetCon.getCon();
        String uname = null;
        String pass = null;
        String phne = null;
        String cifs = null;
        String emails = null;
        PreparedStatement ps1;
        try {
            ps1 = con.prepareStatement("select * from bank where username=?");
            ps1.setString(1, usrname);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {

                uname = rs.getString(2);
                pass = rs.getString(3);

                phne = rs.getString(4);
                emails = rs.getString(5);
                cifs = rs.getString(6);
            }
            if (uname.equals(usrname)&& pass.equals(password)&& phne.equals(phone) && emails.equals(email) && cifs.equals(cif)) {
                status = 1;
                System.out.println(status);
            }
        } catch (SQLException e) {
            System.out.println("vishant");
        }
        return status;

    }
}
