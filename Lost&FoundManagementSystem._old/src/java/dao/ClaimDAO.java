package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ClaimDAO {

    public static void save(String itemName) {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO claims(item_name) VALUES(?)"
            );

            ps.setString(1, itemName);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
