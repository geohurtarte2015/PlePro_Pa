
package com.webservice;

import com.pojo.Response;
import com.pojo.ResultQueryUserResponse;
import java.util.ArrayList;




public class Main {

   
    public static void main(String[] args) {
        
        RequestJson requestJson = new RequestJson();
        ResultQueryUserResponse responseQueryUserResponse = new ResultQueryUserResponse();
        Response response = new Response();
        
        responseQueryUserResponse = requestJson.queryUserOtt("http://172.16.68.235:8312/hubOTT/internal/rest/queryUserOTT", "GT", "AMCOOTT_GT", "arturolajpop.00@gmail.com", "50200000000");
        
        String description = responseQueryUserResponse.getResponse().getDescription();
        int code = responseQueryUserResponse.getResponse().getCode();
        ArrayList<String[]> responseList = responseQueryUserResponse.getUserResponse();
        
        
        
    }
    
    
}