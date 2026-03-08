package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.LostItem;
import dao.DBConnection;

public class LostItemDAO {

    // INSERT
    public static void save(LostItem item) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO lost_items (item_name, location, description, lost_date) VALUES (?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getLocation());
            ps.setString(3, item.getDescription());
            ps.setDate(4, item.getDate());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // SELECT
    public static ArrayList<LostItem> getAllLostItems() {
        ArrayList<LostItem> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            ResultSet rs = con.createStatement().executeQuery(
                "SELECT * FROM lost_items ORDER BY id DESC"
            );

            while (rs.next()) {
                LostItem item = new LostItem();
                item.setItemName(rs.getString("item_name"));
                item.setLocation(rs.getString("location"));
                item.setDescription(rs.getString("description"));
                item.setDate(rs.getDate("lost_date"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
