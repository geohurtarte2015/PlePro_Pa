/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojo;

import java.util.ArrayList;


public class ResultQueryUserResponse {
    
    private ArrayList<String[]> userResponse;
    private Response response;    


    public ArrayList<String[]> getUserResponse() {
        return userResponse;
    }

  
    public void setUserResponse(ArrayList<String[]> userResponse) {
        this.userResponse = userResponse;
    }

  
    public Response getResponse() {
        return response;
    }


    public void setResponse(Response response) {
        this.response = response;
    }
   
}
