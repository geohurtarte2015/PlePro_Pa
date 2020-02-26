
package pojo;

import java.util.HashMap;


public final class CodeErrorWebservice {
    
    private HashMap reponse;
    
    
    public CodeErrorWebservice(){    
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
    objectResponse.put(0,"Aprovisionado correctamente");
    objectResponse.put(-100,"Clave/Origen No Existe en el sistema");
    objectResponse.put(-101,"Perfil No valido Para Este Servicio");
    objectResponse.put(-102,"Tarifa No Registrada");
    objectResponse.put(-103,"No se pudo Realizar el Credito Para Esta Operación");
    objectResponse.put(-104,"Saldo Insuficiente Para Este Servicio");
    objectResponse.put(-105,"No se pudo Realizar el Debito Para Esta Operación");
    objectResponse.put(-106,"Tipo de Cuenta No definido");
    objectResponse.put(-107,"Fallo Recarga de Paquete");
    objectResponse.put(-108,"No se pudo Realizar el Rollback de Debito"); 
    objectResponse.put(-109,"Saldo Insuficiente para Combo");
    objectResponse.put(-110,"Servicio no activo");      
    objectResponse.put(-111,"Servicio No Valido por Situacion Actual"); 
       
    this.setReponse(objectResponse);
    }


    
}
