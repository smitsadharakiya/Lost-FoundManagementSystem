package model;

import java.sql.Date;

public class FoundItem {

    private int id;
    private String itemName;
    private String location;
    private String description;
     private Date date;

    public FoundItem() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
     public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
