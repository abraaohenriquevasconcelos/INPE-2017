package br.inpe.lac;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import com.mongodb.BasicDBObject;
import com.mongodb.Block;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.model.Filters;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

public class Parte2 {
    private static final MongoDatabase BANCO = (new MongoClient("localhost", 27017)).getDatabase("teste");
    private static final MongoCollection<Document> PESSOAS = BANCO.getCollection("pessoas");
    
    public static void main(String[] args){
        //System.out.println(getNomes().toString());
        //System.out.println("\n\nPessoas com Altura\n"+getPessoasComAltura().toString());
        //System.out.println("\n\nPessoas e Cursos\n"+pegarPessoasCursos().toString());
        System.out.println(pegarPessoasEndereços().toString());    
    }
    
    
    /* 
    ********************************************************************************************************* 
    ***********************************************************************************************************
    */
    
    public static TreeSet<String> getNomes(){
         /*
	"_id" : 6,
	"nome" : "Valeska ",
	"idade" : 20,
	"altura" : 1.73,
	"informacao" : {
		"x" : 40,
		"y" : 30
        }
        */
        TreeSet<String> nomes = new TreeSet<>();
        BasicDBObject query = new BasicDBObject("_id", new BasicDBObject("$lte", 3));
        FindIterable<Document> iterable = PESSOAS.find(query);
        
        iterable.forEach(new Block<Document>(){
            @Override
            public void apply(final Document document){
                System.out.println(document.getString("nome"));
                System.out.println(document.getInteger("idade"));
                System.out.println(document.toString()+"\n\n"); 
                nomes.add(document.getString("nome"));
            }
        });
        
        return nomes;
    }
    
    /* 
    ********************************************************************************************************* 
    ***********************************************************************************************************
    */
    
    public static TreeSet<String> getPessoasComAltura(){
        /*
	"_id" : 6,
	"nome" : "Valeska ",
	"idade" : 20,
	"altura" : 1.73,
	"informacao" : {
		"x" : 40,
		"y" : 30
        }
        */
        TreeSet<String> nomes = new TreeSet<>();
        FindIterable<Document> iterable = PESSOAS.find(Filters.exists("altura"));
        
        iterable.forEach(new Block<Document>(){
            @Override
            public void apply(final Document document){ 
                nomes.add(document.getString("nome"));
            }
        });
        
        return nomes;
    }
    
    
    
    /* 
    ********************************************************************************************************* 
    ***********************************************************************************************************
    */
    
    public static TreeMap<String, TreeMap<String, String>> pegarPessoasEndereços(){
        TreeMap<String, TreeMap<String, String>> pessoas = new TreeMap<>();
        
        /*
        {
            "_id" : 1,
            "nome" : "Jão",
            "salario" : 1500.9,
            "endereço" : {
                    "rua" : "Rua das Lagoas",
                    "bairro" : "Valadares",
                    "numero" : "67"
            },
            "cursos" : [
                    {
                            "nome" : "java",
                            "tipo" : "informatica"
                    },
                    {
                            "nome" : "culinaria",
                            "tipo" : "comida"
                    }
            ]
        }
        */
        
        FindIterable<Document> iterable = PESSOAS.find();
        
        iterable.forEach(new Block<Document>(){
            @Override
            public void apply(final Document document){
                TreeMap<String, String> resultado = new TreeMap<>();
                Document endereço = (Document) document.get("endereço");
                resultado.put("rua", endereço.getString("rua"));
                resultado.put("bairro", endereço.getString("bairro"));
                resultado.put("numero", endereço.getString("numero"));
                pessoas.put(document.getString("nome"), resultado);
            }
        });
        
        return pessoas;
    }
    
    
    public static TreeMap<String, TreeSet<String>> pegarPessoasCursos(){
         /*
            {
	"_id" : 1,
	"nome" : "Jão",
	"salario" : 1500.9,
	"endereço" : {
		"rua" : "Rua das Lagoas",
		"bairro" : "Valadares",
		"numero" : "67"
	},
	"cursos" : [
		{
			"nome" : "java",
			"tipo" : "informatica"
		},
		{
			"nome" : "culinaria",
			"tipo" : "comida"
		}
	]
}
        */
        TreeMap<String, TreeSet<String>> pessoas = new TreeMap<>();
        FindIterable<Document> iterable = PESSOAS.find();
        
        iterable.forEach(new Block<Document>(){
            @Override
            public void apply(final Document document){
                TreeSet<String> resultado = new TreeSet<>();
                
                //Lista -> [Document{{nome=java, tipo=informatica}}, Document{{nome=culinaria, tipo=comida}}]
                List<Document> cursos = (List<Document>) document.get("cursos");
                for(Document curso : cursos){
                    resultado.add(curso.getString("nome"));
                }
                
                pessoas.put(document.getString("nome"), resultado);
            }
        }); 
        
        return pessoas; // -> {Jão=[culinaria, java], Maria=[balé, medicina]}
    }
    
}
