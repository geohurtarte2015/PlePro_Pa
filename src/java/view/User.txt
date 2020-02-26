package view;

import controller.LdapConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ExecuteSql;


public class User
  extends HttpServlet
{
  public User() {}
  
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {}
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
    PrintWriter out = response.getWriter();
    try
    {
      boolean valUsuario = false;
      
      String usuario = request.getParameter("name");
      String password = request.getParameter("pass");
      String country = request.getParameter("country");
      
      ExecuteSql executeSql = new ExecuteSql();
      
      String sentence = "select * from ldap_cfg where country_id="+country;
      String sentence2 = "select id, nombre,apellido,usuario,rol from tb_user_ple where usuario='"+usuario+"' and country="+country;
      
      List<String[]> list = executeSql.selectSql(sentence);
      
      String domainldap= list.get(0)[1];
      String url= list.get(0)[2];
      String port= list.get(0)[3];
      
      LdapConnection ldap = new LdapConnection();
      valUsuario = ldap.searchLdap(usuario, password, url, port, domainldap);
      

            if (valUsuario) {

                List<String[]> listUser = executeSql.selectSql(sentence2);
                int size = listUser.size();

                if (size != 0) {
                    String nombreSesion = "";
                    String apellidoSesion = "";
                    String rolSesion = "";
                    nombreSesion = listUser.get(0)[1];
                    apellidoSesion = listUser.get(0)[2];
                    rolSesion = listUser.get(0)[4];

                    HttpSession httpSession = request.getSession(true);
                    httpSession.setAttribute("nombre", nombreSesion);
                    httpSession.setAttribute("apellido", apellidoSesion);
                    httpSession.setAttribute("rol", rolSesion);
                } else {
                    String error = "errorusuario";
                    out.println(error.trim());
                }

            } else {
                String error = "errorusuario";
                out.println(error.trim());
            }
        } finally {
            out.close();
        }
    }


  public String getServletInfo()
  {
    return "Short description";
  }
}
