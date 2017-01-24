
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portfolio Item - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/portfolio-item.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <%@include file="menu.jsp" %>

    <!-- 
    ******************************************************************************************************
    ******************************************************************************************************
    ******************************************************************************************************
    -->
    
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Lista de Funcionalidades 
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
                <label>&nbsp;</label>
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" href="#collapse1">Docentes</a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse">
                            <ul class="list-group">
                                <a href="formulario-de-busca-a-partir-do-nome-do-docente.jsp" class="list-group-item">OBTER CÓDIGO DO DOCENTE A PARTIR DO NOME</a>
                                <a href="tabela-docentes-relacionados-com-alunos-da-cap.jsp" class="list-group-item">OBTER DOCENTES RELACIONADOS COM ALUNOS DA CAP</a>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="panel-group" style="margin-top: -20px;">
                   <div class="panel panel-default">
                       <div class="panel-heading">
                           <h4 class="panel-title">
                               <a data-toggle="collapse" href="#collapse2">Discentes</a>
                           </h4>
                       </div>
                       <div id="collapse2" class="panel-collapse collapse">
                           <ul class="list-group">
                               <a href="formulario-de-busca-alunos-com-o-status-conluido-a-partir-do-codigo-do-docente.jsp" class="list-group-item">OBTER ALUNOS COM O STATUS "CONCLUÍDO" A PARTIR DO CÓDIGO DO DOCENTE</a>
                               <a href="formulario-de-busca-alunos-ativos-utilizando-filtro-de-meses.jsp" class="list-group-item">BUSCAR ALUNOS ATIVOS UTILIZANDO FILTRO DE MESES</a>
                           </ul>
                        </div>
                    </div>
                </div>
            
            </div>
                

            <div class="col-md-4">
                
                <h3>Project Description</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                <!--<h3>Project Details</h3>
                <ul>
                    <li>Lorem Ipsum</li>
                    <li>Dolor Sit Amet</li>
                    <li>Consectetur</li>
                    <li>Adipiscing Elit</li>
                </ul>-->
           
            </div>

        </div>
        
        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        -->
        
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

        <%@include file="rodape.jsp" %>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>

