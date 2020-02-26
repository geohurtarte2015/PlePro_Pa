package pojo;
// Generated 16/11/2016 11:58:03 AM by Hibernate Tools 4.3.1


import java.util.Date;




public class User  implements java.io.Serializable {


     private long idUser;
     private String apellido;
     private String nombre;
     private String password;
     private String email;
     private Date dateCreate;
     private String username;
     private Rol RolClaroVideo;
 

    public User() {
        
        
    }

	
    public User(long idUser, String apellido) {
        this.idUser = idUser;
        this.apellido = apellido;
    }
  
    public User( String apellido, String nombre, String password, Date dateCreate, String username) {
       
       this.apellido = apellido;
       this.nombre = nombre;
       this.password = password;
       this.dateCreate = dateCreate;
       this.username = username;
      
    }
   

    public long getIdUser() {
        return this.idUser;
    }
    
    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }

    

    public String getApellido() {
        return this.apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    

    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }


    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateCreate() {
        return this.dateCreate;
    }
    
    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    

    public Rol getRolClaroVideo() {
        return RolClaroVideo;
    }

    
    public void setRolClaroVideo(Rol RolClaroVideo) {
        this.RolClaroVideo = RolClaroVideo;
    }

}


