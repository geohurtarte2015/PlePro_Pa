
package com.model;

import com.pojo.DetailError;
import com.pojo.Phone;
import com.pojo.Product;
import com.pojo.ProfileList;
import com.pojo.Response;
import com.pojo.ResultUpload;
import configuration.Configuration;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.Result;


public class DaoObject {
    
DriverConnection driver =null;
private  Configuration configuration=null;
private  String jdbcPos=null;
private  String userPos=null;
private  String passwordPos=null;
private  String jdbcProgram=null;
private  String userProgram=null;
private  String passwordProgram=null;

public DaoObject(){
    
        configuration = new Configuration();
        jdbcPos = configuration.getJdbcPos();
        userPos = configuration.getUserJdbcPos();
        passwordPos = configuration.getPasswordJdbcPos();
        jdbcProgram = configuration.getJdbcProgram();
        userProgram = configuration.getUserJdbcProgram();
        passwordProgram = configuration.getPasswordJdbcProgram();        
    
}

public List<DetailError> getErrorDetails(String sql){

      driver = new DriverConnection(jdbcPos,userPos,passwordPos);
      List<DetailError> listError = new ArrayList<>();
    try {
        ConnectionBd connection = new ConnectionBd();
        ArrayList<String[]> listString= connection.getSelect(driver, sql);        
              
        for (String[] arrayObject : listString) {            
            DetailError error = new DetailError();
            error.setId(arrayObject[0]);
            error.setIdUpload(arrayObject[1]);
            error.setNumRecord(arrayObject[2]);
            error.setDescription("Error en ingreso de registro");
           
            listError.add(error);
	}
        
        System.out.println("Finish");
        
        
        
        
    } catch (SQLException ex) {
        System.out.println("Error: "+ex);
    
    }
    return listError;
}
    
public List<Product> getListProduct(String sql){
       driver = new DriverConnection(jdbcPos,userPos,passwordPos);
      List<Product> listProducts = new ArrayList<>();
    try {
        ConnectionBd connection = new ConnectionBd();
        ArrayList<String[]> listString= connection.getSelect(driver, sql);        
      
        
        for (String[] arrayObject : listString) {            
            Product product = new Product();
            product.setId(arrayObject[0]);
            product.setDescription(arrayObject[1]);
            product.setDiscount(arrayObject[2]);
            product.setStatus(arrayObject[3]);
            product.setMarcacion(arrayObject[5]);
            listProducts.add(product);
	}
        
        System.out.println("Finish");
        
        
        
        
    } catch (SQLException ex) {
        System.out.println("Error: "+ex);
    
    }
    return listProducts;
}

public int getCountError(String sql){
       driver = new DriverConnection(jdbcPos,userPos,passwordPos);
      List<DetailError> listError = new ArrayList<>();
      int size = 0;
    try {
        ConnectionBd connection = new ConnectionBd();
        ArrayList<String[]> listString= connection.getSelect(driver, sql); 
        size =Integer.parseInt(listString.get(0)[0]);
        System.out.println("Finish count errors");
        
    } catch (SQLException ex) {
        System.out.println("Error read table count errors: "+ex);
    
    }
    return size;
}

public List<Product> getOneProduct(String sql){
      driver = new DriverConnection(jdbcPos,userPos,passwordPos);
      List<Product> listProducts = new ArrayList<>();
    try {
        ConnectionBd connection = new ConnectionBd();
        ArrayList<String[]> listString= connection.getSelect(driver, sql);   
        for (String[] arrayObject : listString) {            
            Product product = new Product();
            product.setId(arrayObject[0]);
            product.setDescription(arrayObject[1]);
            product.setDiscount(arrayObject[2]);
            product.setStatus(arrayObject[3]);
            product.setMarcacion(arrayObject[5]);
            listProducts.add(product);
	}
        
        System.out.println("Finish");
        
        
        
        
    } catch (SQLException ex) {
        System.out.println("Error: "+ex);
    
    }
    return listProducts;
}

public String updateProduct(String sql){
      driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    String result=null;
      List<Product> listProducts = new ArrayList<>();
      ConnectionBd connection = new ConnectionBd();
      result = connection.getUpdate(driver,sql);
      System.out.println("Finish");
    return result;
}

public Integer getSequence(String sql){
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    Integer numSequence = 0;

    List<Product> listProducts = new ArrayList<>();
    try {
        ConnectionBd connection = new ConnectionBd();
        ArrayList<String[]> listString = connection.getSelect(driver, sql);
        numSequence = Integer.parseInt(listString.get(0)[0]);
    } catch (SQLException ex) {
        System.out.println("Error: " + ex);

    }

    return numSequence;
}

public String insertProduct(Product product) throws SQLException{
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    List<Product> listProduct = new ArrayList<Product>();
    listProduct.add(product);
    ConnectionBd connection = new ConnectionBd();
    String response = connection.insertPack(listProduct, driver);
    return response;
}

public String insertListPhone(List<Phone> list){
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    ConnectionBd connection = new ConnectionBd();
    String response = connection.insertMsisdn(list, driver);
    return response;
}

public String insertUpload(ResultUpload list){
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    ConnectionBd connection = new ConnectionBd();
    String response = connection.insertUpload(list, driver);
    return response;
}

public Response insertPhonesStoreProcedure(List<Phone> list,int countRow,int idUpload){
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    ConnectionBd connection = new ConnectionBd();
    Response response = connection.insertPhonesStoreProcedure(driver, list,countRow,idUpload);
            
return response;
}

public ArrayList<Response> insertProfileStoreProcedure(List<ProfileList> list){
 driver = new DriverConnection(jdbcProgram,userProgram,passwordProgram);
    ConnectionBd connection = new ConnectionBd();
     
    ArrayList<Response> response = connection.insertProfileStoreProcedure(driver, list);
            
return response;
}

public String deletePhonesStoreProcedure(List<Phone> list){
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    ConnectionBd connection = new ConnectionBd();
    String response = connection.deletePhonesStoreProcedure(driver, list);            
return response;
}

public ArrayList<String[]> selectSql(String sql) {
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
        ArrayList<String[]> sequence = new ArrayList();
        try {
            //driver = new DriverConnection();
            ConnectionBd connection = new ConnectionBd();
            sequence = connection.getSelect(driver, sql);
        } catch (SQLException ex) {
            Logger.getLogger(DaoObject.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sequence;
    }
 
public Result insertSql(String[] sql) {
 driver = new DriverConnection(jdbcPos,userPos,passwordPos);
    int size = sql.length;
    ArrayList<String[]> sequence = new ArrayList();
    Result result = new Result();
    result.setCodeError("0");
    result.setMessage("Successful");
    try
    {
        try (Connection con = driver.getCon()) {
            con.setAutoCommit(false);
            Statement statement = con.createStatement();
            
            for(int i=0;i<size;i++){
                statement.executeUpdate(sql[i]);
            }
            
            con.commit();
        }
      
      System.out.println("Commit\n" + sql);
    } catch (SQLException ex) {
      System.out.println("Error SQL " + ex);
      int codeError = ex.getErrorCode();
      String message = ex.getMessage();
      result.setMessage(message);
      result.setCodeError(String.valueOf(codeError));
    }
    return result;
  }


}