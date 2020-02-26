package model;


import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ConnectionOds
{
  private ExecuteSql bridgedb;
  private DataSource Ods;
  private Context c;
  
  public ConnectionOds(String jdni)
  {
    System.out.println("########Obteniendo ParametroCos via JNDI Pool###########");
    Properties prop = new Properties();
    prop.setProperty("java.naming.factory.initial", "weblogic.jndi.WLInitialContextFactory");
    try
    {
      Ods = null;
      c = new InitialContext(prop);
      Ods = ((DataSource)c.lookup(jdni));
      System.out.println("Connected pool...");
    }
    catch (NamingException e) {
      System.out.println("Error while getting jdbc resource " + Ods);
      System.out.println("Error..." + e.getMessage());
    }
  }
  
  public DataSource getOds()
  {
    return Ods;
  }
  
  public boolean getStatusDbPool() {
    System.out.println("Get status connect to Db");
    try {
      if ((!Ods.getConnection().isClosed()) || (Ods.getConnection() != null)) {
        return true;
      }
    } catch (SQLException e) {
      return false;
    }
    return false;
  }
  
  public void reconnect(String jdni) {
    System.out.println("Reconnect to db");
    ConnectionOds connection = new ConnectionOds(jdni);
  }
  
  public void closeContext()
  {
    try {
      c.close();
      System.out.println("close context");
    } catch (NamingException ex) {
      System.out.println("Error close context " + ex);
    }
  }
  
  public void closeDataSource()
  {
    try
    {
      Ods.getConnection().close();
    } catch (SQLException ex) {
      Logger.getLogger(ConnectionOds.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
}
