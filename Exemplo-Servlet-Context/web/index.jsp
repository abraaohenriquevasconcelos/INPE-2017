

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
        <p>
        As aplicações Web em Java têm 3 escopos possíveis: o request, o session, e um escopo global. Podemos
        colocar um atributo no request com request.setAttribute() e ele estará disponível para todo o request
        (desde a Action até o JSP, os filtros etc).
        
        Da mesma forma, podemos pegar o HttpSession e colocar um atributo com session.setAttribute() e o atributo
        estará disponível na sessão daquele usuário através de vários requests.
        
        O terceiro escopo é um escopo global, onde os objetos são compartilhados na aplicação inteira, por todos os
        usuários em todos os requests. É o chamado escopo de aplicação, acessível pelo ServletContext. Podemos, em 
        uma Servlet, setar algum atributo usando: getServletContext().setAttribute("nomeGlobal", "valorGlobal");
        Depois, podemos recuperar esse valor com: Object obj = getServletContext().getAttribute("nomeGlobal");
        
        Um bom uso é compartilhar configurações globais da aplicação, como por exemplo usuário e senha de um banco
        de dados, ou algum objeto de cache compartilhado etc. Você pode, por exemplo, inicializar algum objeto global
        usando um ServletContextListener e depois disponibilizá-lo no ServletContext para o resto da aplicação acessar.
        
        E como fazemos para acessar o escopo de aplicação no nosso JSP? Assim:
        ServletContext application = getServletContext();
        Portanto podemos utilizá-la através de scriptlet:
        application.getAttribute("nomeGlobal")</p>
        
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
