// 
// Decompiled by Procyon v0.5.36
// 

package controller;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import model.ExecuteSql;


public class Main
{
    public static void main(final String[] args) {
        

            //LdapConnection ldap = new LdapConnection();
            
           //ldap.connectToLDAP("ldap://172.16.168.102:389","GPPTTMAF_GT@clarogt", "-w*$q/b)x€E");
           
           
           ExecuteSql ldapSql = new ExecuteSql("VALIDATEUSR/LDAP");
           
          ArrayList<String[]> listLdap = ldapSql.selectSql("select RESPONSE, GPP_LDAP_PAIS, CODIGO_IBM, DISPLAY_NAME, MAIL from table(ldap_register(502,'edgar.hurtarte'))");
          
          System.out.println(listLdap);
           
           
            
    

        

    }
}
