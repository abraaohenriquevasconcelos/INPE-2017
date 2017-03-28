
package br.inpe.lac;

import java.io.File;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

/**
 *
 * @author abraao
 */
public class CurriculoLattes {
    private Document doc;
    
    public CurriculoLattes(File file) throws DocumentException{
        SAXReader reader = new SAXReader();
        doc = reader.read(file); //read(File file): Document
    }
    
    public TreeMap<Integer, Integer> pegaMapaDeArtigosCompletos(){
        TreeMap<Integer, Integer> mapa = new TreeMap<>();
        List<Node> artigos = doc.selectNodes("//PRODUCAO-BIBLIOGRAFICA/ARTIGOS-PUBLICADOS/ARTIGO-PUBLICADO");
        for(Node artigo : artigos){
            Node dados_basicos_do_artigo = artigo.selectSingleNode("./DADOS-BASICOS-DO-ARTIGO");
            int ano = Integer.parseInt(dados_basicos_do_artigo.valueOf("@ANO-DO-ARTIGO"));
            String natureza = dados_basicos_do_artigo.valueOf("@ANO-DO-ARTIGO");
             if (natureza.equalsIgnoreCase("COMPLETO")){
                 int i = 0;
                 if(mapa.containsKey(ano)){
                     i = mapa.get(ano);
                 }
                 mapa.put(ano, i + 1);
             }
        }
        return mapa;
    }
    
    /****************************************************************************************************************
     ****************************************************************************************************************/
    
    
    public TreeMap<String, TreeSet<String>> contaCoAutoresEmArtigos(){
        TreeMap<String, TreeSet<String>> mapa = new TreeMap<>();
        TreeSet<String> todosAutores = new TreeSet<>();
        List<Node> artigos = doc.selectNodes("//PRODUCAO-BIBLIOGRAFICA/ARTIGOS-PUBLICADOS/ARTIGO-PUBLICADO");
        for(Node artigo : artigos){
            Node dados_basicos_do_artigo = artigo.selectSingleNode("./DADOS-BASICOS-DO-ARTIGO");
            String tituloArtigo = dados_basicos_do_artigo.valueOf("@TITULO-DO-ARTIGO");
            List<Node> autores = artigo.selectNodes("AUTORES");
            for(Node autor : autores){
                String nomeCompletoAutor = autor.valueOf("@NOME-COMPLETO-DO-AUTOR");
                todosAutores.add(nomeCompletoAutor);
            }
            mapa.put(tituloArtigo, todosAutores);
        }
        return mapa;
    }
    
    
    
    
    
}
