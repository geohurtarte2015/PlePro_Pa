/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojo;

import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class ResultListProfile {
    
    private ArrayList<ProfileList> listProfileList;
    private String nameFile;
    private Response response;


 
    public ArrayList<ProfileList> getListProfileList() {
        return listProfileList;
    }

  
    public void setListProfileList(ArrayList<ProfileList> listProfileList) {
        this.listProfileList = listProfileList;
    }


    public String getNameFile() {
        return nameFile;
    }

 
    public void setNameFile(String nameFile) {
        this.nameFile = nameFile;
    }

 
    public Response getResponse() {
        return response;
    }


    public void setResponse(Response response) {
        this.response = response;
    }
    

    
}
