package br.inpe.lac;

import com.healthmarketscience.jackcess.Column;
import com.healthmarketscience.jackcess.Cursor;
import com.healthmarketscience.jackcess.CursorBuilder;
import com.healthmarketscience.jackcess.Database;
import com.healthmarketscience.jackcess.DatabaseBuilder;
import com.healthmarketscience.jackcess.Row;
import com.healthmarketscience.jackcess.Table;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Set;
import java.util.TreeMap;
import javax.swing.JOptionPane;

import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Main {
   

    public static TreeMap<String, TreeMap<String, String>> buscarCodigoDocenteAPartirDoNome(String nome, Table docente){
        TreeMap<String, TreeMap<String, String>> mapaResultado = new TreeMap<>();
        for(Row linha : docente){   
            if(linha.getString("NOME_DOCENTE") != null && linha.getString("NOME_DOCENTE").contains(nome)){
                TreeMap<String, String> dadosDocente = new TreeMap<>();
                dadosDocente.put("NOME_DOCENTE", linha.getString("NOME_DOCENTE"));
                if(linha.get("TITULO") != null)
                    dadosDocente.put("TITULO", linha.getString("TITULO"));
                if(linha.get("SIGLA_INST") != null)
                    dadosDocente.put("SIGLA_INST", linha.getString("SIGLA_INST"));
                mapaResultado.put(Utilitario.formataRegistroDocente(String.valueOf(linha.get("REG_DOCENT"))), dadosDocente);
            }
        }
        
        return mapaResultado;
    }
    
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    
    public static String buscarNomeDocenteAPartirDoCodigo(String codigoDocente, Table docente){
        String nomeDocente = "";

        for(Row linha : docente){
            String REG_DOCENT = "";
            if(linha.get("REG_DOCENT") != null)
                REG_DOCENT = Utilitario.formataRegistroDocente(String.valueOf(linha.get("REG_DOCENT")));
            if(codigoDocente.equals(REG_DOCENT)){
                nomeDocente = linha.getString("NOME_DOCENTE");
                break;
            }
        }
        
        return nomeDocente;
    }
    
    
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    
    
    
    public static TreeMap<String, TreeMap<String, String>> buscarAlunosComStatusConcluidoAPartirDoCodigoDocente(String codigoDocente, Table curso_al, Table gdrpess){
        ArrayList<String> codigosAlunos = new ArrayList<>();
        TreeMap<String, TreeMap<String, String>> mapaResultado = new TreeMap<>();
        for(Row linha : curso_al){
            String O_PESQ1 = ""; String O_PESQ2 = ""; String O_PESQ3 = ""; String O_PESQ4 = "";
            if(linha.get("O_PESQ1") != null)
                O_PESQ1 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ1")));
            if(linha.get("O_PESQ2") != null)
                O_PESQ2 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ2")));
            if(linha.get("O_PESQ3") != null)
                O_PESQ3 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ3")));
            if(linha.get("O_PESQ4") != null)
                O_PESQ4 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ4")));
            if(codigoDocente.equals(O_PESQ1) || codigoDocente.equals(O_PESQ2) || codigoDocente.equals(O_PESQ3) || codigoDocente.equals(O_PESQ4)){
                if(linha.getString("STATUS").equals("Concluído"))
                    codigosAlunos.add(Utilitario.formataRegistroAluno(String.valueOf(linha.get("REG_ALUNO"))));

            }
        }
            
        for(Row linha : gdrpess){
            String REG_ALUNO = Utilitario.formataRegistroAluno(String.valueOf(linha.get("REG_ALUNO")));
            if(codigosAlunos.contains(REG_ALUNO)){
                TreeMap<String, String> dadosAluno = new TreeMap<>();
                dadosAluno.put("NOME", linha.getString("NOME"));
                dadosAluno.put("NIVEL", linha.getString("NIVEL"));
                dadosAluno.put("CURSO", linha.getString("CURSO"));
                mapaResultado.put(REG_ALUNO, dadosAluno);
            }
        }
       return mapaResultado;
    }

    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    public static TreeMap<String, TreeMap<String, String>> buscarAlunosAtivosAPartirDeUmaDeterminadaQuantidadeDeMeses(String nivelAluno, String quantidadeMeses, Table curso_al, Table gdrpess){
        int qtdMeses = Integer.parseInt(quantidadeMeses);
        TreeMap<String, TreeMap<String, String>> mapaResultado = new TreeMap<>();
        
        for(Row linha1 : curso_al){
            /*Ao criarmos uma variável do tipo Calendar, devemos instanciá-la utilizando o método getInstance
            da própria classe Calendar. Ao fazermos tal instanciação, estamos ao mesmo tempo, criando o objeto
            e o inicializando com os valores (data e hora) do sistema operacional.*/
            if(linha1.getString("STATUS").equalsIgnoreCase("Ativo") && linha1.getString("NIVEL").equalsIgnoreCase(nivelAluno)){
                Date dataAtual = new Date();
                Calendar calendarAtual = Calendar.getInstance();
                calendarAtual.setTime(dataAtual);
                /********************************************************************************************************/
                Calendar calendarAdmissaoDoAluno = Calendar.getInstance();
                calendarAdmissaoDoAluno.setTime(linha1.getDate("D_ADIMISSA"));
                String diaAdmissaoAluno = String.valueOf(calendarAdmissaoDoAluno.get(Calendar.DAY_OF_MONTH));
                int mesAdmissaoAlunoInt = calendarAdmissaoDoAluno.get(Calendar.MONTH)+1;
                String mesAdmissaoAluno = String.valueOf(mesAdmissaoAlunoInt);
                String anoAdmissaoAluno = String.valueOf(calendarAdmissaoDoAluno.get(Calendar.YEAR));
                /********************************************************************************************************/
                int totalMeses = (calendarAtual.get(Calendar.YEAR)-calendarAdmissaoDoAluno.get(Calendar.YEAR))*12;
                int mesDeAdmissaoDoAluno = calendarAdmissaoDoAluno.get(Calendar.MONTH)+1;
                int mesAtual = calendarAtual.get(Calendar.MONTH)+1;
                totalMeses = totalMeses-mesDeAdmissaoDoAluno+mesAtual;
                
                if(totalMeses >= qtdMeses){

                    String REG_ALUNO1 = Utilitario.formataRegistroAluno(String.valueOf(linha1.get("REG_ALUNO")));
                    String nomeAluno="";
                    for(Row linha2 : gdrpess){
                        String REG_ALUNO2 = Utilitario.formataRegistroAluno(String.valueOf(linha2.get("REG_ALUNO")));
                        if(REG_ALUNO1.equals(REG_ALUNO2) && linha2.getString("NIVEL").equals(linha1.getString("NIVEL"))){
                            nomeAluno = linha2.getString("NOME");
                        }
                    }
                    /********************************************************************************************************/
                    TreeMap<String, String> dadosAluno = new TreeMap<>();
                    dadosAluno.put("NOME", nomeAluno);
                    dadosAluno.put("NIVEL", linha1.getString("NIVEL"));
                    dadosAluno.put("STATUS", linha1.getString("STATUS"));
                    dadosAluno.put("SIGLA_CURS", linha1.getString("SIGLA_CURS"));
                    dadosAluno.put("DATA_ADMISSAO", diaAdmissaoAluno+"/"+mesAdmissaoAluno+"/"+anoAdmissaoAluno);
                    mapaResultado.put(REG_ALUNO1, dadosAluno);
                    File file = new File("/home/abraao/Desktop/Doutorado/"+nomeAluno+".txt");
                }
            }
            
        }
        return mapaResultado;
    }
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    public static TreeMap<String, TreeMap<String, String>> obterDocentesRelacionadosComAlunosDaCAP(Table curso_al, Table docente){
        ArrayList<String> codigosDocentes = new ArrayList<>();
        TreeMap<String, TreeMap<String, String>> docentesRelacionadosComAlunosDaCAP = new TreeMap<>();
        for(Row linha : curso_al){
            if(linha.get("SIGLA_CURS") != null && linha.getString("SIGLA_CURS").equalsIgnoreCase("CAP") && linha.get("STATUS") != null && linha.getString("STATUS").equalsIgnoreCase("Ativo")){
                if(linha.get("O_PESQ1") != null){
                    String O_PESQ1 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ1")));
                    if(!O_PESQ1.equals("0")){
                        if(!codigosDocentes.contains(O_PESQ1))codigosDocentes.add(O_PESQ1);
                    }
                        
                }
                if(linha.get("O_PESQ2") != null){
                    String O_PESQ2 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ2")));
                    if(!O_PESQ2.equals("0")){
                        if(!codigosDocentes.contains(O_PESQ2))codigosDocentes.add(O_PESQ2);
                    }
                        
                }
                if(linha.get("O_PESQ3") != null){
                    String O_PESQ3 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ3")));
                    if(!O_PESQ3.equals("0")){
                        if(!codigosDocentes.contains(O_PESQ3))codigosDocentes.add(O_PESQ3);
                    }
                        
                }
                if(linha.get("O_PESQ4") != null){
                    String O_PESQ4 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ4")));
                    if(!O_PESQ4.equals("0")){
                        if(!codigosDocentes.contains(O_PESQ4))codigosDocentes.add(O_PESQ4);
                    }
                        
                }
            }
        }
        
        for(String codigoDocente : codigosDocentes){
            for(Row linha : docente){
                String REG_DOCENT = "";
                if(linha.get("REG_DOCENT") != null)
                    REG_DOCENT = Utilitario.formataRegistroDocente(String.valueOf(linha.get("REG_DOCENT")));
                if(codigoDocente.equals(REG_DOCENT)){
                   TreeMap<String, String> dadosDocente = new TreeMap<>();
                   dadosDocente.put("NOME_DOCENTE", linha.getString("NOME_DOCENTE"));
                   dadosDocente.put("TITULO", linha.getString("TITULO"));
                   dadosDocente.put("SIGLA_INST", linha.getString("SIGLA_INST"));
                   docentesRelacionadosComAlunosDaCAP.put(codigoDocente, dadosDocente);
                   break;
                }
            }
        }
        return docentesRelacionadosComAlunosDaCAP;
    }
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    public static TreeMap<String, TreeMap<String, String>> obterAlunosAtivosDoCAPAPartirDoCodigoDocente(String codigoDocente, Table curso_al, Table gdrpess){
        TreeMap<String, TreeMap<String, String>> mapaResultado = new TreeMap<>();
        for(Row linha : curso_al){
            if(linha.get("SIGLA_CURS") != null && linha.getString("SIGLA_CURS").equalsIgnoreCase("CAP") && linha.get("STATUS") != null && linha.getString("STATUS").equalsIgnoreCase("Ativo")){
                String O_PESQ1 = ""; String O_PESQ2 = ""; String O_PESQ3 = ""; String O_PESQ4 = "";
                Calendar calendarAdmissaoDoAluno = Calendar.getInstance();
                if(linha.get("O_PESQ1") != null)
                    O_PESQ1 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ1")));
                if(linha.get("O_PESQ2") != null)
                    O_PESQ2 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ2")));
                if(linha.get("O_PESQ3") != null)
                    O_PESQ3 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ3")));
                if(linha.get("O_PESQ4") != null)
                    O_PESQ4 = Utilitario.formataRegistroDocente(String.valueOf(linha.get("O_PESQ4")));
                
                if(codigoDocente.equals(O_PESQ1)){
                    calendarAdmissaoDoAluno.setTime(linha.getDate("D_ADIMISSA"));
                    String REG_ALUNO = Utilitario.formataRegistroAluno(String.valueOf(linha.get("REG_ALUNO")));
                    String nomeAluno = "";
                    for(Row linha2 : gdrpess){
                        String REG_ALUNO2 = "";
                        if(linha2.get("REG_ALUNO") != null)
                            REG_ALUNO2 = Utilitario.formataRegistroAluno(String.valueOf(linha2.get("REG_ALUNO")));
                        if(REG_ALUNO.equals(REG_ALUNO2) && linha2.getString("NIVEL").equals(linha.getString("NIVEL"))){
                            nomeAluno = linha2.getString("NOME");
                        }
                    }
                    TreeMap<String, String> dadosAluno = new TreeMap<>();
                    dadosAluno.put("NOME", nomeAluno);
                    dadosAluno.put("NIVEL", linha.getString("NIVEL"));
                    dadosAluno.put("STATUS", linha.getString("STATUS"));
                    dadosAluno.put("SIGLA_CURS", linha.getString("SIGLA_CURS"));
                    dadosAluno.put("DATA_ADMISSAO", String.valueOf(calendarAdmissaoDoAluno.get(Calendar.DAY_OF_MONTH))+"/"+(calendarAdmissaoDoAluno.get(Calendar.MONTH)+1)+"/"+calendarAdmissaoDoAluno.get(Calendar.YEAR));
                    dadosAluno.put("O_PESQ1",O_PESQ1);
                    dadosAluno.put("O_PESQ2",O_PESQ2);
                    dadosAluno.put("O_PESQ3",O_PESQ3);
                    dadosAluno.put("O_PESQ4",O_PESQ4);
                    mapaResultado.put(REG_ALUNO, dadosAluno);
                }else if(codigoDocente.equals(O_PESQ2)){
                    calendarAdmissaoDoAluno.setTime(linha.getDate("D_ADIMISSA"));
                    String REG_ALUNO = Utilitario.formataRegistroAluno(String.valueOf(linha.get("REG_ALUNO")));
                    String nomeAluno = "";
                    for(Row linha2 : gdrpess){
                        String REG_ALUNO2 = "";
                        if(linha2.get("REG_ALUNO") != null)
                            REG_ALUNO2 = Utilitario.formataRegistroAluno(String.valueOf(linha2.get("REG_ALUNO")));
                        if(REG_ALUNO.equals(REG_ALUNO2) && linha2.getString("NIVEL").equals(linha.getString("NIVEL"))){
                            nomeAluno = linha2.getString("NOME");
                        }
                    }
                    TreeMap<String, String> dadosAluno = new TreeMap<>();
                    dadosAluno.put("NOME", nomeAluno);
                    dadosAluno.put("NIVEL", linha.getString("NIVEL"));
                    dadosAluno.put("STATUS", linha.getString("STATUS"));
                    dadosAluno.put("SIGLA_CURS", linha.getString("SIGLA_CURS"));
                    dadosAluno.put("DATA_ADMISSAO", String.valueOf(calendarAdmissaoDoAluno.get(Calendar.DAY_OF_MONTH))+"/"+(calendarAdmissaoDoAluno.get(Calendar.MONTH)+1)+"/"+calendarAdmissaoDoAluno.get(Calendar.YEAR));
                    dadosAluno.put("NOME", nomeAluno);
                    dadosAluno.put("NIVEL", linha.getString("NIVEL"));
                    dadosAluno.put("STATUS", linha.getString("STATUS"));
                    dadosAluno.put("SIGLA_CURS", linha.getString("SIGLA_CURS"));
                    dadosAluno.put("DATA_ADMISSAO", String.valueOf(calendarAdmissaoDoAluno.get(Calendar.DAY_OF_MONTH))+"/"+(calendarAdmissaoDoAluno.get(Calendar.MONTH)+1)+"/"+calendarAdmissaoDoAluno.get(Calendar.YEAR));
                    dadosAluno.put("O_PESQ1",O_PESQ1);
                    dadosAluno.put("O_PESQ2",O_PESQ2);
                    dadosAluno.put("O_PESQ3",O_PESQ3);
                    dadosAluno.put("O_PESQ4",O_PESQ4);
                    mapaResultado.put(REG_ALUNO, dadosAluno);
                }else if(codigoDocente.equals(O_PESQ3)){
                    calendarAdmissaoDoAluno.setTime(linha.getDate("D_ADIMISSA"));
                    String REG_ALUNO = Utilitario.formataRegistroAluno(String.valueOf(linha.get("REG_ALUNO")));
                    String nomeAluno = "";
                    for(Row linha2 : gdrpess){
                        String REG_ALUNO2 = "";
                        if(linha2.get("REG_ALUNO") != null)
                            REG_ALUNO2 = Utilitario.formataRegistroAluno(String.valueOf(linha2.get("REG_ALUNO")));
                        if(REG_ALUNO.equals(REG_ALUNO2) && linha2.getString("NIVEL").equals(linha.getString("NIVEL"))){
                            nomeAluno = linha2.getString("NOME");
                        }
                    }
                    TreeMap<String, String> dadosAluno = new TreeMap<>();
                    dadosAluno.put("NOME", nomeAluno);
                    dadosAluno.put("NIVEL", linha.getString("NIVEL"));
                    dadosAluno.put("STATUS", linha.getString("STATUS"));
                    dadosAluno.put("SIGLA_CURS", linha.getString("SIGLA_CURS"));
                    dadosAluno.put("DATA_ADMISSAO", String.valueOf(calendarAdmissaoDoAluno.get(Calendar.DAY_OF_MONTH))+"/"+(calendarAdmissaoDoAluno.get(Calendar.MONTH)+1)+"/"+calendarAdmissaoDoAluno.get(Calendar.YEAR));
                    dadosAluno.put("O_PESQ1",O_PESQ1);
                    dadosAluno.put("O_PESQ2",O_PESQ2);
                    dadosAluno.put("O_PESQ3",O_PESQ3);
                    dadosAluno.put("O_PESQ4",O_PESQ4);
                    mapaResultado.put(REG_ALUNO, dadosAluno);
                }else if(codigoDocente.equals(O_PESQ4)){
                    calendarAdmissaoDoAluno.setTime(linha.getDate("D_ADIMISSA"));
                    String REG_ALUNO = Utilitario.formataRegistroAluno(String.valueOf(linha.get("REG_ALUNO")));
                    String nomeAluno = "";
                    for(Row linha2 : gdrpess){
                        String REG_ALUNO2 = "";
                        if(linha2.get("REG_ALUNO") != null)
                            REG_ALUNO2 = Utilitario.formataRegistroAluno(String.valueOf(linha2.get("REG_ALUNO")));
                        if(REG_ALUNO.equals(REG_ALUNO2) && linha2.getString("NIVEL").equals(linha.getString("NIVEL"))){
                            nomeAluno = linha2.getString("NOME");
                        }
                    }
                    TreeMap<String, String> dadosAluno = new TreeMap<>();
                    dadosAluno.put("NOME", nomeAluno);
                    dadosAluno.put("NIVEL", linha.getString("NIVEL"));
                    dadosAluno.put("STATUS", linha.getString("STATUS"));
                    dadosAluno.put("SIGLA_CURS", linha.getString("SIGLA_CURS"));
                    dadosAluno.put("DATA_ADMISSAO", String.valueOf(calendarAdmissaoDoAluno.get(Calendar.DAY_OF_MONTH))+"/"+(calendarAdmissaoDoAluno.get(Calendar.MONTH)+1)+"/"+calendarAdmissaoDoAluno.get(Calendar.YEAR));
                    dadosAluno.put("O_PESQ1",O_PESQ1);
                    dadosAluno.put("O_PESQ2",O_PESQ2);
                    dadosAluno.put("O_PESQ3",O_PESQ3);
                    dadosAluno.put("O_PESQ4",O_PESQ4);
                    mapaResultado.put(REG_ALUNO, dadosAluno);
                }
            }
        }
        return mapaResultado;
    }
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    public static String montaGráficoComAEstimativaDeTempoParaCadaAlunoAssociadoAoDocente(String codigoDocente, TreeMap<String, TreeMap<String, String>> alunosAssociadosAoDocente){
        StringBuilder sb = new StringBuilder().append("{label:\"\",");
        Set<String> codigosDosAlunos = alunosAssociadosAoDocente.keySet();
        for(String codigoAluno : codigosDosAlunos){
            TreeMap<String, String> dadosAluno = alunosAssociadosAoDocente.get(codigoAluno);   
            if(dadosAluno.get("NIVEL").equalsIgnoreCase("Mestrado")){
                Date dataAtual = new Date();
                Calendar calendarAtual = Calendar.getInstance();
                calendarAtual.setTime(dataAtual);
                /********************************************************************************************************/
                String[] dataAdmissaoAluno = dadosAluno.get("DATA_ADMISSAO").split("/");
                /********************************************************************************************************/
                int totalMeses = calendarAtual.get(Calendar.YEAR)-Integer.parseInt(dataAdmissaoAluno[2]);
                totalMeses = totalMeses * 12;
                int mesAtual = calendarAtual.get(Calendar.MONTH)+1;
                totalMeses = totalMeses-Integer.parseInt(dataAdmissaoAluno[1])+mesAtual;
                if(totalMeses <= 36){
                    totalMeses = 36 - totalMeses;
                    sb.append("\""+dadosAluno.get("NOME")+"\""+":"+totalMeses+",");
                }
                else
                    sb.append("\""+dadosAluno.get("NOME")+"\""+":0,");
            }
            if(dadosAluno.get("NIVEL").equalsIgnoreCase("Doutorado")){
                Date dataAtual = new Date();
                Calendar calendarAtual = Calendar.getInstance();
                calendarAtual.setTime(dataAtual);
                /********************************************************************************************************/
                String[] dataAdmissaoAluno = dadosAluno.get("DATA_ADMISSAO").split("/");
                /********************************************************************************************************/
                int totalMeses = calendarAtual.get(Calendar.YEAR)-Integer.parseInt(dataAdmissaoAluno[2]);
                totalMeses = totalMeses * 12;
                int mesAtual = calendarAtual.get(Calendar.MONTH)+1;
                totalMeses = totalMeses-Integer.parseInt(dataAdmissaoAluno[1])+mesAtual;
                if(totalMeses <= 60){
                    totalMeses = 60 - totalMeses;
                    sb.append("\""+dadosAluno.get("NOME")+"\""+":"+totalMeses+",");
                }
                else
                    sb.append("\""+dadosAluno.get("NOME")+"\""+":0,");
            }
        }
        sb.append("}");
        return sb.toString();
    }
    
    
    /*
     ********************************************************************************************************
     ********************************************************************************************************
     ********************************************************************************************************
    */
    
    public static void main(String[] args) throws IOException{
         
      
        
    }
}
