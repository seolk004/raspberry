package com.test.myapp.dto;

public class FileDTO {
    private String id;
    private String name;

    public String getName(){
        return name;
    }
    public String getId(){
        return id;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setId(String id){
        this.id = id;
    }

}
