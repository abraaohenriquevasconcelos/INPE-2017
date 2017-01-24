<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="br.inpe.lac.Main" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"
    <title></title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet"><!-- -->
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="css/portfolio-item.css" rel="stylesheet">
    
    
    <script src="js/jquery.js"></script><!-- -->
    <script src="js/bootstrap.min.js"></script><!-- -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#tabela-resultado-do-formulario-de-busca-a-partir-do-nome-do-docente").DataTable();
        });
    </script>
    
</head>
<body>
    
    <%@include file="menu.jsp" %>
    
    
    <!-- 
    ******************************************************************************************************
    ******************************************************************************************************
    ******************************************************************************************************
    -->
    
    <div class="container">

        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        -->
        
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Orientador: <span style="color: red"> <%= Main.pegarNomeDocenteAPartirDoCodigo(request.getParameter("codigoDocente")) %></span>
                    <small></small>
                </h1>
            </div>
        </div>
        
        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        -->           

        <div class="row">
            <div class="col-md-8">
                
                <div style="margin-bottom: 10px;">
                    <a  href="blabla.jsp?codigoDocente=<%=request.getParameter("codigoDocente")%>" class="btn btn-default " onclick="">
                        <span class="glyphicon glyphicon-signal"></span> Estimativa
                    </a>
                    <a  href="#" class="btn btn-default " onclick="">
                        <span class="glyphicon glyphicon-floppy-save"></span> CSV
                    </a>
                </div>
    
                <table class="table table-striped table-bordered table-hover" id="tabela-resultado-do-formulario-de-busca-a-partir-do-nome-do-docente">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>Nível</th>
                            <th>Status</th>
                            <th>Sigla Curso</th>
                            <th>Data Admissão</th>
                            <th>O_PESQ1</th>
                            <th>O_PESQ2</th>
                            <th>O_PESQ3</th>
                            <th>O_PESQ4</th>
                        </tr>
                    </thead> 
                    <tbody>
                         <% 
                            //out.print(Main.buscarCodigoDoDocenteAPartirDoNome(request.getParameter("nomeDocente")));
                            TreeMap<String, TreeMap<String, String>> mapaResultado = Main.obterAlunosAtivosDoCAPAPartirDoCodigoDoDocente(request.getParameter("codigoDocente"));
                            Set<String> codigosDosAlunos = mapaResultado.keySet();
                            for(String codigoAluno : codigosDosAlunos){
                                TreeMap<String, String> dadosAluno = mapaResultado.get(codigoAluno);
                        %>
                        <tr>
                            <td><%=codigoAluno %></td>
                            <td><%=dadosAluno.get("NOME") %></td>
                            <td><%=dadosAluno.get("NIVEL") %></td>
                            <td><%=dadosAluno.get("STATUS") %></td>
                            <td><%=dadosAluno.get("SIGLA_CURS") %></td>
                            <td><%=dadosAluno.get("DATA_ADMISSAO") %></td>
                            <td><%=dadosAluno.get("O_PESQ1") %></td>
                            <td><%=dadosAluno.get("O_PESQ2") %></td>
                            <td><%=dadosAluno.get("O_PESQ3") %></td>
                            <td><%=dadosAluno.get("O_PESQ4") %></td> 
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                    
            </div>

            <div class="col-md-4">
                <h3></h3>
                <p></p>
                <h3></h3>
                <ul>
                    <!--<li></li>
                    <li></li>
                    <li></li>
                    <li></li>-->
                </ul>
            </div>

        </div>
        
        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        --> 
        
        <!-- Related Projects Row -->
        <div class="row">
            
            
            
            <div class="col-lg-12">
                <h3 class="page-header">Colocar Algo Aqui</h3>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
                    <img class="img-responsive portfolio-item" src="" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="" alt="">
                </a>
            </div>

        </div>
        
        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        --> 

        <hr>

        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        --> 
        
        <%@include file="rodape.jsp" %>

    </div><!-- container -->
    
    
    
    
   
    
    
</body>
</html>