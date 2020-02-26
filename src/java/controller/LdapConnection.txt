
package controller;


import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.Name;
import javax.naming.NameParser;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;


public class LdapConnection {
    
     //private final String URL_LDAP="ldap://172.16.168.102:389";
     //private final String DOMAIN="@CLAROGT";
    
    public boolean searchLdap(String user, String psw, String url,String port, String domainldap){
        
        String URL_LDAP = "ldap://"+url+":"+port;
        String DOMAIN = "@"+domainldap;
        
        
        Hashtable<String, String> environment = new Hashtable<String, String>();
        DirContext dirContext;
        boolean connected=false;
        environment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        environment.put(Context.PROVIDER_URL, URL_LDAP);
        environment.put(Context.SECURITY_AUTHENTICATION, "simple");
        environment.put(Context.SECURITY_PRINCIPAL, user + DOMAIN);
        environment.put(Context.SECURITY_CREDENTIALS, psw);
        try 
        {   if( user.length()>1 &&  psw.length()>1){
                dirContext = new InitialDirContext(environment);                
                System.out.println("Connected..");
                connected=true;
            }
            
        } 
        catch (Exception ex ) 
        {
            System.out.println(ex.getMessage());
            return false;
        }
        
           return connected;
      
    }
    
    
        

    public DirContext connectToLDAP(String url,String user, String psw) {
        DirContext dirContext = null;

        try {
            Hashtable<String, String> environment = new Hashtable<String, String>();

            boolean connected = false;
            environment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");            
            environment.put(Context.PROVIDER_URL, url);
            environment.put(Context.SECURITY_AUTHENTICATION, "simple");
            environment.put(Context.SECURITY_PRINCIPAL, user);
            environment.put(Context.SECURITY_CREDENTIALS, psw);

            dirContext = new InitialDirContext(environment);
            
             System.out.println("Connected .....");

        } catch (NamingException ex) {
            System.out.println("Error " + ex);
        }
        return dirContext;
    }
    

    
    public static void closeConnectionToLDAP(DirContext ctx) {
    try {
        ctx.close();
    } catch (NamingException e) {
        // No se habia podido conectar, ya se habia cerrado la conexion, etc..
        e.printStackTrace();
    }
}
    
    
    
}
