package model;

import configuration.Configuration;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import pojo.Result;



public class ExecuteSql
{
  private ConnectionOds ods=null;
  private Configuration configuration = null;
  
  
  public ExecuteSql()
  {       

        configuration = new Configuration();
        String poolCatalog=configuration.getPoolCatalog();
        ods = new ConnectionOds(poolCatalog);

  }
  
  public ExecuteSql(String odsParam)
  {     
     
        ods = new ConnectionOds(odsParam);
      
  }
  
  public ArrayList<String[]> selectSql(String sql)
  {
    Connection con = null;
    PreparedStatement pr = null;
    ResultSet rs = null;
    ArrayList<String[]> sequence = new ArrayList();
    try
    {
      con = ods.getOds().getConnection();
      pr = con.prepareStatement(sql);
      rs = pr.executeQuery();
      
      ResultSetMetaData rsmd = rs.getMetaData();
      int columnsNumber = rsmd.getColumnCount();
      int valResp = rs.getRow();
      

      while (rs.next()) {
        String[] column = new String[columnsNumber];
        int cont = 0;
        while (columnsNumber > cont) {
          column[cont] = rs.getString(cont + 1);
          cont++;
        }
        sequence.add(column);
      }
      pr.close();
      rs.close();
      con.close();
      //ods.closeContext();
      //ods.closeDataSource();

    }
    catch (SQLException ex)
    {
        try {
            System.out.println("Error SQL " + ex);
            int value = ex.getErrorCode();         
            con.close();
            //ResultSet rs = ex.getMessage();      
        } catch (SQLException ex1) {
                System.out.println("Error close connection SQL " + ex);
        }
    }
    

    return sequence;
  }
  
  public Result insertSql(String sql) {
    Connection con = null;
    ArrayList<String[]> sequence = new ArrayList();
    Result result = new Result();
    result.setCodeError("0");
    result.setMessage("Successful");
    try
    {
      con = ods.getOds().getConnection();
      Statement statement = con.createStatement();
      statement.executeUpdate(sql);
      con.commit();
      con.close();
      
      System.out.println("Commit\n" + sql);
    } catch (SQLException ex) {
      System.out.println("Error SQL " + ex);
      int codeError = ex.getErrorCode();
      String message = ex.getMessage();
      result.setMessage(message);
      result.setCodeError(String.valueOf(codeError));
        try {
            con.close();
            return result;
        } catch (SQLException ex1) {
            System.out.println("Error close connection SQL " + ex1);
        }
    }
    return result;
  }
  
  public Result deleteSql(String sql) {
    ArrayList<String[]> sequence = new ArrayList();
    Result result = new Result();
    result.setCodeError("0");
    result.setMessage("Successful");
    Connection con = null;
    
    try
    {
      con = ods.getOds().getConnection();
      PreparedStatement pr = con.prepareStatement(sql);
      ResultSet rs = pr.executeQuery();
      

      pr.close();
      rs.close();
      con.close();
      //ods.closeContext();
      //ods.closeDataSource();
    }
    catch (SQLException ex)
    {
        try {
            System.out.println("Error SQL " + ex);
            int codeError = ex.getErrorCode();
            String message = ex.getMessage();
            result.setMessage(message);
            result.setCodeError(String.valueOf(codeError));
            con.close();
            return result;
        } catch (SQLException ex1) {
            System.out.println("Error close connection SQL " + ex);
        }
      
    }
    

    return result;
  }
}
