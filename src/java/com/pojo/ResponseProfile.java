
package com.pojo;

import java.util.HashMap;


public final class ResponseProfile {
    
    private HashMap reponse;
    
    
    public ResponseProfile(){    
        this.initCode();
    }


    public HashMap getReponse() {
        return reponse;
    }

  
    public void setReponse(HashMap reponse) {
        this.reponse = reponse;
    }
    
    public void initCode(){
    HashMap objectResponse = new HashMap();
    objectResponse.put(0,"Exito");
    objectResponse.put(-1,"Error");
    objectResponse.put(-2,"Error indice violado");
  
    this.setReponse(objectResponse);
    }


    
}
