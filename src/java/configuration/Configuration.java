/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configuration;




public class Configuration {

 
    
    private final String jdbcOffLineTrx;
    private final String userJdbcOffLineTrx;
    private final String passwordJdbcOffLineTrx;
    private final String jdbcCatalog;
    private final String userJdbcCatalog;
    private final String passwordJdbcCatalog;
    private final String jdbcProgram;
    private final String userJdbcProgram;
    private final String passwordJdbcProgram;
    private final String jdbcPos;
    private final String userJdbcPos;
    private final String passwordJdbcPos;
    private final String poolOffLineTrx;
    private final String poolCatalog;
    private final String poolProgram;
    private final String poolPos;
    private final String wsdlLocation;
    private final String urlPos1;
    private final String urlPos2;
    
    public  Configuration(){
        jdbcOffLineTrx = "";
        userJdbcOffLineTrx="";
        passwordJdbcOffLineTrx="";
        jdbcCatalog="";
        passwordJdbcCatalog="";
        userJdbcCatalog="";
        jdbcProgram="DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = oracleprd06-scan)(PORT = 3873)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = PLEDBPA))";
        userJdbcProgram="sm_program";
        passwordJdbcProgram="vsdowe34ds";
        jdbcPos="DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = oracleprd04-scan)(PORT = 3877))(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = POSDBPA))";
        passwordJdbcPos="ysdTpo20d";
        userJdbcPos="pos_offlinetrx";
        poolOffLineTrx="JDBC/PLEPA_TRX";
        poolCatalog="JDBC/PLEPA";
        poolProgram="";
        poolPos="";
        wsdlLocation="http://172.16.168.143:7018/WS_PLE_BRIDGE_PA/PackageCore?WSDL";
        urlPos1="http://172.16.168.139:7018/wsValidatorPOS/webresources/validate/loadData";
        urlPos2="http://172.16.168.138:7018/wsValidatorPOS/webresources/validate/loadData";
    }
    
     public String getUrlPos2() {
        return urlPos2;
    }
    
    public String getUrlPos1() {
        return urlPos1;
    }
  
    public String getJdbcOffLineTrx() {
        return jdbcOffLineTrx;
    }

   
    public String getUserJdbcOffLineTrx() {
        return userJdbcOffLineTrx;
    }

   
    public String getPasswordJdbcOffLineTrx() {
        return passwordJdbcOffLineTrx;
    }

   
    public String getJdbcCatalog() {
        return jdbcCatalog;
    }

  
    public String getUserJdbcCatalog() {
        return userJdbcCatalog;
    }

   
    public String getPasswordJdbcCatalog() {
        return passwordJdbcCatalog;
    }

    
    public String getJdbcProgram() {
        return jdbcProgram;
    }

   
    public String getUserJdbcProgram() {
        return userJdbcProgram;
    }

  
    public String getPasswordJdbcProgram() {
        return passwordJdbcProgram;
    }

  
    public String getJdbcPos() {
        return jdbcPos;
    }

   
    public String getUserJdbcPos() {
        return userJdbcPos;
    }

 
    public String getPasswordJdbcPos() {
        return passwordJdbcPos;
    }

   
    public String getPoolOffLineTrx() {
        return poolOffLineTrx;
    }

    
    public String getPoolCatalog() {
        return poolCatalog;
    }

   
    public String getPoolProgram() {
        return poolProgram;
    }

    
    public String getPoolPos() {
        return poolPos;
    }

   
    public String getWsdlLocation() {
        return wsdlLocation;
    }
    

    
    
    
    
}
