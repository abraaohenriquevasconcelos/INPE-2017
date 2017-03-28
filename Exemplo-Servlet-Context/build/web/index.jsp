

<%@page import="java.io.File"%>
<%@page import="pacote.LeArquivo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teste: Abrindo um Arquivo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <p>https://www.caelum.com.br/apostila-java-web/apendice-topicos-da-servlet-api/#19-9-o-servletcontext-e-o-escopo-de-aplicacao</p>
        <img src="ss.png">
        <p>Testes:</p>
        <ul>
            <li>Lendo com um método estático em Java (direto): </li>
            <%
                out.println(LeArquivo.leLinha(""));
            %>
            <br/><br/>
            <li>Lendo com um método estático em Java (usando ServletContext): </li>
            <%
                // Esta linha é a chave: me diga qual é o caminho REAL da aplicação, onde quer que ela esteja!
                String path = request.getServletContext().getRealPath("/");
                out.println("request.getServletContext().getRealPath('/'):"+path);
                out.println(LeArquivo.leLinha(path));
            %>
            <br/><br/>  
            <li>Terceiro jeito: </li>
            <%
                // Esta linha é a chave: me diga qual é o caminho REAL da aplicação, onde quer que ela esteja!
                String arq = request.getServletContext().getRealPath("/Dados/dados.txt");
                out.println("request.getServletContext().getRealPath('/Dados/dados.txt'): "+arq+"---> ");
                File f = new File(arq);
                out.println(f.length()+"bytes");
            %>



      </ul>
    </div>
  </body>
</html>
