
package br.inpe.lac;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.json.JSONArray;


public class Main {
    public static void main(String[] args) throws DocumentException{  
        String diretorio_curriculos_lattes = "/home/abraao/NetBeansProjects/Curriculo_Lattes/dados/";
        File dir = new File(diretorio_curriculos_lattes);
        File[] lista_arquivos_xml = dir.listFiles();
        
        
        //pegaTodosAutoresDeUmArtigo();
         
    }
    
    public static TreeMap<Integer, Integer> artigosPublicados(File[] lista_de_arquivos) throws DocumentException{
        List<Integer> anos = new ArrayList<>();
        anos.add(2010);anos.add(2011);anos.add(2012);anos.add(2013);anos.add(2014);anos.add(2015);anos.add(2016);
        TreeMap<Integer, Integer> mapaFinal = new TreeMap<>();
        mapaFinal.put(2010, 0);mapaFinal.put(2011, 0);mapaFinal.put(2012, 0);mapaFinal.put(2013, 0);mapaFinal.put(2014, 0);mapaFinal.put(2015, 0);mapaFinal.put(2016, 0);
        JSONArray jsonArray = new JSONArray();
        Integer totalDeArtigosPublicados=0;
         
        for(File file : lista_de_arquivos){
           CurriculoLattes parser = new CurriculoLattes(file);
           TreeMap<Integer, Integer> resultado = parser.pegaMapaDeArtigosCompletos();
           
           for(Integer ano : anos){
               if(resultado.containsKey(ano))
                   mapaFinal.put(ano, mapaFinal.get(ano)+resultado.get(ano));
           }
        }
        return mapaFinal;
   }
    
    
    public static void pegaTodosAutoresDeUmArtigo() throws DocumentException{
        File file = new File("/home/abraao/NetBeansProjects/Curriculo_Lattes/dados/0048120516904156.xml");
        System.out.println(file.exists());
        CurriculoLattes parser = new CurriculoLattes(file);
        System.out.println(parser.contaCoAutoresEmArtigos().toString());
       
    }
}
