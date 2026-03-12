package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO {

    
    public static boolean validate(User user) {
        boolean status = false;

        try {
         
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());

        
            ResultSet rs = ps.executeQuery();

          
            if (rs.next()) {
                status = true;
                user.setRole(rs.getString("role")); 
            }

         
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}

