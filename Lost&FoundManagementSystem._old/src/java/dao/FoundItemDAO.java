package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.FoundItem;

public class FoundItemDAO {

    public static void save(FoundItem item) {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO found_items(item_name, location, description, found_date) VALUES (?,?,?,?)"
            );
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getLocation());
            ps.setString(3, item.getDescription());
            ps.setDate(4, item.getDate());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<FoundItem> getAllFoundItems() {
        ArrayList<FoundItem> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM found_items ORDER BY id DESC"
            );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FoundItem item = new FoundItem();
                item.setId(rs.getInt("id"));
                item.setItemName(rs.getString("item_name"));
                item.setLocation(rs.getString("location"));
                item.setDescription(rs.getString("description"));
                item.setDate(rs.getDate("found_date"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
