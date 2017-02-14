/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pacote;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author rafael
 */
public class LeArquivo{

public static String leLinha(String base){
    String line = "Linha ainda não inicializada";
    File completo = new File(base,"Dados/dados.txt");
    try (BufferedReader br = new BufferedReader(new FileReader(completo));){
      line = br.readLine();
    }
    catch (IOException ex){
      line = "Erro: "+ex.getMessage();
    }
    return line;
}

  
  public static void main(String[] args)
    {
    System.out.println(leLinha("")); // Erro!
    System.out.println(leLinha("web")); // OK!
    }
  
  }
