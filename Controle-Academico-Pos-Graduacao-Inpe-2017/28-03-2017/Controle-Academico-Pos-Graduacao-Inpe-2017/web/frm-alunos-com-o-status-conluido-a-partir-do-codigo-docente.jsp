
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/portfolio-item.css" rel="stylesheet">

    <script src="js/loading.js"></script>
   
    

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
                <h1 class="page-header">Obter os alunos com o status "Concluído"
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
                <form action="tbl-busca-alunos-com-o-status-conluido-a-partir-do-codigo-docente.jsp" method="post">
                	<div class="form-group">
                		<label for="codigoDocente">Digite o código do docente</label>
                                <input type="text" class="form-control" name="codigoDocente" id="codigoDocente" style="">
                	</div>
                    <button type="submit" class="btn btn-default" onclick="loading()">Confirmar</button><img id="xxx" src="imagens/loading.gif" width="90" height="90" style="display:none;">
                </form>

            </div>

            <div class="col-md-4">
                <h3>Descrição da Funcionalidade</h3>
                <p>Esta funcionalidade permite realizar um filtro a partir de qualquer parte do nome procurado. Digite no campo de texto qualquer pedaço do nome que esteja procurando.</p>
                <h3></h3>
                <ul>
                    <!--<li>Lorem Ipsum</li>
                    <li>Dolor Sit Amet</li>
                    <li>Consectetur</li>
                    <li>Adipiscing Elit</li>-->
                </ul>
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

    </div><!--container-->
    

 
    <script src="js/jquery.js"></script>

   
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
