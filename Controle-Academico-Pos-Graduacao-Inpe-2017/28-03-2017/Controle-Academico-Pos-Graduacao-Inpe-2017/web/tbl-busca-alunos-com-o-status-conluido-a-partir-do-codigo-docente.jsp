
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="br.inpe.lac.Main" %>

<%@page import="java.io.File"%>
<%@page import="com.healthmarketscience.jackcess.DatabaseBuilder"%>
<%@page import="com.healthmarketscience.jackcess.Database"%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>


<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="iso-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>


    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/portfolio-item.css" rel="stylesheet">
    
   
    

    <script src="js/jquery.js"></script><!-- -->
    <script src="js/bootstrap.min.js"></script><!-- -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    
    <script type="text/javascript">
        function criarArquivoCSV(){
            var data = "Nome;Nível;Curso;Status;Código\n";
            /*****************************************************************************************
             ******************************************************************************************/
            <%
                Database academxp_2 = DatabaseBuilder.open(new File(request.getServletContext().getRealPath("/")+"Data/Academxp.mdb"));
                TreeMap<String, TreeMap<String, String>> mapa_resultado = Main.buscarAlunosComStatusConcluidoAPartirDoCodigoDocente(request.getParameter("codigoDocente"), academxp_2.getTable("CURSO_AL"), academxp_2.getTable("GDRPESS"));
                Set<String> codigos_alunos = mapa_resultado.keySet();
                for(String codigo_aluno : codigos_alunos){
                    TreeMap<String, String> dados_aluno = mapa_resultado.get(codigo_aluno);
            %>
            data = data+"<%=dados_aluno.get("NOME") %>"+";"+"<%=dados_aluno.get("NIVEL")%>"+";"+"<%=dados_aluno.get("CURSO") %>"+";Concluído;"+"<%=codigo_aluno %>"+"\n";           
            <% } %>
            /*****************************************************************************************
             ******************************************************************************************/
            var mylink = document.createElement("a");
            mylink.download = "csvname.csv";
            //The scape() function encodes a string. This function makes a string portable, so it can be transmitted across
            //any network to any computer that supports ASCII characteres 
            //This function encodes special characters, with the exception of: * @ - _ + .
            //document.write(escape("Need tips? Visit W3Schools!"));
            //Need%20tips%3F%20Visit%20W3Schools%21
            mylink.href = "data:text/csv;charset=utf-8,"+encodeURI(data);
            mylink.click();
        }
    </script>
        
    <script>     
        $(document).ready(function(){
            $("#tabela-resultado-do-formulario-de-busca-alunos-com-o-status-conluido-a-partir-do-codigo-do-docente").DataTable();
        });
    </script>

</head>

<body>
    
    <%
        Database academxp = DatabaseBuilder.open(new File(request.getServletContext().getRealPath("/")+"Data/Academxp.mdb"));
    %>

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
                <h1 class="page-header">Orientador: <span style="color: red"> <%= Main.buscarNomeDocenteAPartirDoCodigo(request.getParameter("codigoDocente"), academxp.getTable("DOCENTE")) %></span>
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
                
                <!-- 
                ******************************************************************************************************
                ******************************************************************************************************
                ******************************************************************************************************
                -->
                
                <div style="margin-bottom: 10px;">
                    <a  href="#" class="btn btn-default " onclick="criarArquivoCSV()">
                        <span class="glyphicon glyphicon-floppy-save"></span> CSV
                    </a>
                    <a  href="#" class="btn btn-default " onclick="criarArquivoCSV()">
                        <span class="glyphicon glyphicon-floppy-save"></span> Excel
                    </a>
                </div>
                
                <!-- 
                ******************************************************************************************************
                ******************************************************************************************************
                ******************************************************************************************************
                --> 
                
                <table id="tabela-resultado-do-formulario-de-busca-alunos-com-o-status-conluido-a-partir-do-codigo-do-docente" class="table table-bordered table-striped" style="margin-top: 15px;">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Nível</th>
                            <th>Curso</th>
                            <th>Status</th>
                            <th>Código</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            //out.print(Main.buscarCodigoDoDocenteAPartirDoNome(request.getParameter("nomeDocente")));
                            TreeMap<String, TreeMap<String, String>> mapaResultado = Main.buscarAlunosComStatusConcluidoAPartirDoCodigoDocente(request.getParameter("codigoDocente"), academxp.getTable("CURSO_AL"), academxp.getTable("GDRPESS"));
                            Set<String> codigosDosAlunos = mapaResultado.keySet();
                            for(String codigoAluno : codigosDosAlunos){
                                TreeMap<String, String> dadosAluno = mapaResultado.get(codigoAluno);
                        %>
                        <tr>
                            <td><%=dadosAluno.get("NOME") %></td>
                            <td><%=dadosAluno.get("NIVEL") %></td>
                            <td><%=dadosAluno.get("CURSO") %></td>
                            <td>Concluído</td>
                            <td><%=codigoAluno %></td>
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
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                    <img class="img-responsive portfolio-item" src="" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
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

