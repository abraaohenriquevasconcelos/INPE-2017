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
                <h1 class="page-header">Docentes Relacionados com Alunos da CAP
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

                <table class="table table-striped table-bordered table-hover" id="tabela-resultado-do-formulario-de-busca-a-partir-do-nome-do-docente">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Título</th>
                            <th>Sigla Instituição</th>
                            <th>Código</th>
                        </tr>
                    </thead> 
                    <tbody>
                         <% 
                            //out.print(Main.buscarCodigoDoDocenteAPartirDoNome(request.getParameter("nomeDocente")));
                            TreeMap<String, TreeMap<String, String>> docentesRelacionadosComAlunosDaCAP = Main.obterDocentesRelacionadosComAlunosDaCAP();
                            Set<String> codigosDosDocentes = docentesRelacionadosComAlunosDaCAP.keySet();
                            for(String codigoDocente : codigosDosDocentes){
                                TreeMap<String, String> dadosDocente = docentesRelacionadosComAlunosDaCAP.get(codigoDocente);
                        %>
                        <tr>
                            <td><a href="tabela-de-alunos-da-cap-relacionados-com-o-docente.jsp?codigoDocente=<%=codigoDocente%>"><%=dadosDocente.get("NOME_DOCENTE") %></a></td>
                            <td><%=dadosDocente.get("TITULO") %></td>
                            <td><%=dadosDocente.get("SIGLA_INST") %></td>
                            <td><%=codigoDocente %></td>
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
                <h3 class="page-header">Related Projects</h3>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
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