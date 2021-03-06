
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

    <script src="js/loading.js"></script>
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

        <!-- 
        ******************************************************************************************************
        ******************************************************************************************************
        ******************************************************************************************************
        -->
        
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Pesquisar alunos ativos utilizando filtro de meses
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
                <form action="tabela-resultado-do-formulario-de-busca-alunos-ativos-utilizando-filtro-de-meses.jsp" method="post">
                        <div class="form-group">
                            <label for="nivelAluno">Escolha o Nível</label>
                            <select class="form-control" name="nivelAluno" id="nivelAluno" >
                                <option value="Mestrado">Mestrado</option>
                                <option value="Doutorado">Doutorado</option>
                            </select>
                        </div>
                	<div class="form-group">
                            <label for="quantidadeMeses">Escolha a quantidade de meses (serão recuperados os alunos com quantidade igual ou superior à quantidade de meses escolhida)</label>
                            <select class="form-control" name="quantidadeMeses" id="quantidadeMeses" >
                                <%for(int i = 1; i <= 100; i++){ %>
                                <option value="<%=i %>"><%=i %></option>
                                <% } %>
                            </select>
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

    </div><!--container-->
    

 
    <script src="js/jquery.js"></script>

   
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
