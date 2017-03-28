package br.inpe.lac;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;



/**
 *
 * @author abraao
 */
public class Parte1 {
    //Conexão com uma base de dados Local
    private static DB MEU_BANCO = (new MongoClient("localhost", 27017)).getDB("teste");
    private static DBCollection PESSOAS = MEU_BANCO.getCollection("pessoas");
    //private static final MongoDatabase BANCO = (new MongoClient("localhost", 27017)).getDatabase("teste");
    //private static final MongoCollection<Document> PESSOAS = BANCO.getCollection("pessoas");
    
    public static void main(String[] args){
        //inserirDocumento();
        
        /* 
        ********************************************************************************************************* 
        ***********************************************************************************************************
        */
        
        System.out.println(PESSOAS.getCount());
        
        /* 
        ********************************************************************************************************* 
        ***********************************************************************************************************
        */
        
        DBCursor cursor = PESSOAS.find();
        try{
            while(cursor.hasNext())
                System.out.println(cursor.next());
        }finally{
            cursor.close();
        }
        
        /* 
        ********************************************************************************************************* 
        ***********************************************************************************************************
        */
        
        //Pegar um documento com uma consulta simples
        BasicDBObject query = new BasicDBObject("nome", "Maria");
        DBCursor cursor2 = PESSOAS.find(query);   
        try{
            while(cursor2.hasNext())
                System.out.println("\n\nConsulta Simples -> "+cursor2.next());
        }finally{
            cursor2.close();
        }
        
        /* 
        ********************************************************************************************************* 
        ***********************************************************************************************************
        */
        
        //Os operadores com $ representam chaves de String regulares
        //$gt seleciona os documentos onde o valor é maior do que o valor especificado
        BasicDBObject query2 = new BasicDBObject("idade", new BasicDBObject("$gt", 29));
        DBCursor cursor3 = PESSOAS.find(query2);
        try{
            System.out.println("\n\nConsulta arrojada");
            while(cursor3.hasNext())
                System.out.println(cursor3.next());
        }finally{
            cursor3.close();
        }
        
        /* 
        ********************************************************************************************************* 
        ***********************************************************************************************************
        */
        
        // 20 < idade <= 39
        BasicDBObject query3 = new BasicDBObject("idade", new BasicDBObject("$gt", 18).append("$lte", 39));
        DBCursor cursor4 = PESSOAS.find(query3);
        try{
            System.out.println("\n\n18 < idade <= 39");
            while(cursor4.hasNext())
                System.out.println(cursor4.next());
        }finally{
            cursor4.close();
        }
        
        /* 
        ********************************************************************************************************* 
        ***********************************************************************************************************
        */
       
    }
    
    
    
    /* 
     ****************************************************************************************************************
     **************************************************************************************************************** 
     ****************************************************************************************************************
    */
    
    
    
    
    
    /**Esse método vai inserir um documento na coleção Pessoas
     * @see 
     */
    public static void inserirDocumento(){
        /*
        {
            "nome": "Jão",
            "idade": 48
            "informacao":{
                "x": 200,
                "y": 300
            }
        }
        */

        //Vamos usar a classe BasicDBObject para criar o documento
        BasicDBObject Jão = new BasicDBObject("_id", 2)
        .append("nome", "Maria")
        .append("idade", 29)
        .append("informacao", new BasicDBObject("x", 400).append("y", 500));
        PESSOAS.insert(Jão);
    }
    
    
    /* 
     ****************************************************************************************************************
     **************************************************************************************************************** 
     ****************************************************************************************************************
    */
    
    
    
    
}
