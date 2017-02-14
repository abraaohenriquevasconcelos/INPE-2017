
package br.inpe.lac;


public class Utilitario {
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    /**Método para formatar o registro do Docente
     * 
     * @params - Registro do Docente
     * @return String - Registro do Docente formatado
     */
    public static String formataRegistroDocente(String s){
        if (s == null) 
            return "";
        if (s.length() == 0) 
            return "";
        
        double asDouble = Double.parseDouble(s);
        String asStr = String.format("%11.0f", asDouble).trim();
        
        return asStr;
    }
    
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    
    
    /**Método para formatar o registro do aluno no formato XXX/YYYY onde YYYY é um ano
     * 
     * @params - Registro do Aluno 
     * @return String - Registro do Aluno formatado
     */
    public static String formataRegistroAluno(String s){
        
        double asDouble = Double.parseDouble(s);        
        StringBuilder asStr = new StringBuilder(String.format("%11.0f", asDouble).trim());
        
        while(asStr.length() < 5) 
            asStr.insert(0,'0');
        
        asStr.insert(asStr.length()-4,"/");
        
        return asStr.toString();
    }

    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
}
