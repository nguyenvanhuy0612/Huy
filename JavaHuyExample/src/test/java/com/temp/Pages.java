package com.temp;

public class Pages {
    private int id;
    private String name;

    public Pages(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Pages() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
