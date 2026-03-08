package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO {

    // Validate user login and set role
    public static boolean validate(User user) {
        boolean status = false;

        try {
            // Get connection from DBConnection.java
            Connection con = DBConnection.getConnection();

            // Prepare SQL query to check email and password
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());

            // Execute query
            ResultSet rs = ps.executeQuery();

            // If user exists, set status true and get role
            if (rs.next()) {
                status = true;
                user.setRole(rs.getString("role")); // store role in User object
            }

            // Close resources
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
