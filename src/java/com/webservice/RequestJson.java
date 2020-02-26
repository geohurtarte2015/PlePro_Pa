/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webservice;

import com.pojo.Response;
import com.pojo.ResultQueryUserResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author LENOVO
 */
public class RequestJson {
    
    public Response createUser(String url, String msisdn,String countryId,String origin,String name,String lastName, String email, String motherLastName){
        Response response = new Response();
        response.setCode(-1);
        response.setDescription("Error");    
        try {
            GetWebservice getWebservice = new GetWebservice();
            String stringToParse = getWebservice.doPostJson(url, "{\n" +
                    "  \"createUserOttRequest\": { \n" +
                    "    \"msisdn\": \""+msisdn+"\",\n" +
                    "    \"countryId\": \""+countryId+"\",\n" +
                    "    \"origin\": \""+origin+"\",\n" +
                    "    \"name\": \""+name+"\",\n" +
                    "    \"lastName\": \""+lastName+"\",\n" +
                    "    \"email\": \""+email+"\",\n" +
                    "    \"motherLastName\": \""+motherLastName+"\",  \n" +
                    "    }\n" +
                    "}");
            
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(stringToParse);
            String resultMessage = (String) ((JSONObject) json.get("createUserResponse")).get("resultMessage");
            String resultCode = (String) ((JSONObject) json.get("createUserResponse")).get("resultCode");
            
            response.setCode(Integer.parseInt(resultCode));
            response.setDescription(resultMessage);
            System.out.println(response);

        } catch (ParseException ex) {
            System.out.println("Error response json "+ex);
            return response;
        }
        return response;
        
    }

    public ResultQueryUserResponse queryUserOtt(String url,String countryId,String origin, String email, String msisdn ){
        ResultQueryUserResponse resultQueryResult = new ResultQueryUserResponse();
       
        try {
            Response response = new Response();
            response.setCode(-1);
            response.setDescription("Error");
            
            
            GetWebservice getWebservice = new GetWebservice();
            
            String stringToParse = "{\n" +
                    "     \"queryUserOttRequest\": {\n" +
                    "          \"invokeMethod\": \"consultardatoscliente\",\n" +
                    "          \"correlatorId\": \"PA000030952019123000000001005\",\n" +
                    "          \"countryId\": \"GT\",\n" +
                    "          \"employeeId\": \"ABC123456\",\n" +
                    "          \"origin\": \"AMCOOTT_GT\",\n" +
                    "          \"extraData\": {\n" +
                    "                \"data\": [\n" +
                    "                     {\n" +
                    "                          \"key\": \"email\",\n" +
                    "                          \"value\": \""+email+"\"\n" +
                    "                     },\n" +
                    "                     {\n" +
                    "                          \"key\": \"msisdn\",\n" +
                    "                          \"value\": \""+msisdn+"\"\n" +
                    "                     }\n" +
                    "                ]\n" +
                    "          },\n" +
                    "          \"serviceName\": \"consultardatoscliente\",\n" +
                    "          \"providerId\": \"PA00003095\",\n" +
                    "          \"iccidManager\": \"AMCOGT\"\n" +
                    "     }\n" +
                    "}";
            
            String responseJson = getWebservice.doPostJson(url, stringToParse);
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(responseJson);
            String resultMessage = (String) ((JSONObject) json.get("queryUserOttResponse")).get("resultMessage");
            String resultCode = (String) ((JSONObject) json.get("queryUserOttResponse")).get("resultCode"); 
           // JSONObject userData = (JSONObject) ((JSONObject) json.get("queryUserOttResponse")).get("userData");
            JSONObject subscriptionList = (JSONObject) ((JSONObject) ((JSONObject) json.get("queryUserOttResponse")).get("subscriptionList"));      
         
            JSONArray subscription = (JSONArray) subscriptionList.get("subscription");
                    
            response.setCode(Integer.parseInt(resultCode));
            response.setDescription(resultMessage);
            //int size = userData.size();
            int sizeSubscriptionList = subscription.size();
           
            
            //String[] arrayUserData = new String[size];
            //arrayUserData[0]= (String) ((JSONObject) userData.get("item")).get("value");
            JSONObject listItem =  (JSONObject) subscription.get(0);
            JSONArray item = (JSONArray) listItem.get("item");
            int sizeItem = item.size();
            
            
            ArrayList<String[]> listSubscriptionUser = new ArrayList<>(); 
                    
            for(int y=0;y<sizeSubscriptionList;y++){
            String[] arraySubsciptionList = new String[sizeItem];
            
            arraySubsciptionList[0] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(0)).get("value");
            arraySubsciptionList[1] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(2)).get("value");
            arraySubsciptionList[2] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(5)).get("value");
            arraySubsciptionList[3] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(6)).get("value");
            arraySubsciptionList[4] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(7)).get("value");
            arraySubsciptionList[5] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(8)).get("value");
            arraySubsciptionList[6] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(9)).get("value");
            arraySubsciptionList[7] = (String) ((JSONObject)((JSONArray) ((JSONObject) subscription.get(y)).get("item")).get(10)).get("value");
            
         
            listSubscriptionUser.add(arraySubsciptionList);
            }
            
            resultQueryResult.setResponse(response);
            resultQueryResult.setUserResponse(listSubscriptionUser);
            System.out.println(response);
    
        } catch (ParseException ex) {
           System.out.println("Error to Parse Json queryUserOttResponse"+ex);
        }
                 return resultQueryResult;
    }
   
    
}
