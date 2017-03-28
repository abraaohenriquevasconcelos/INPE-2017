package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.File;
import pacote.LeArquivo;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <title>Teste: Abrindo um Arquivo</title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    <div>\n");
      out.write("      <p>Criamos um arquivo dados.txt na pasta web/Dados, com uma linha de texto.</p>\n");
      out.write("      <img src=\"ss.png\">\n");
      out.write("      <p>\n");
      out.write("        Testes:</p>\n");
      out.write("      <ul>\n");
      out.write("        <li>Lendo com um método estático em Java (direto): </li>\n");
      out.write("        ");

          out.println(LeArquivo.leLinha(""));
          
      out.write("\n");
      out.write("        <li>Lendo com um método estático em Java (usando ServletContext): </li>\n");
      out.write("        ");

          // Esta linha é a chave: me diga qual é o caminho REAL da aplicação, onde quer que ela esteja!
          String path = request.getServletContext().getRealPath("/");
          out.println(LeArquivo.leLinha(path));
          
      out.write("\n");
      out.write("        \n");
      out.write("        ");

          // Esta linha é a chave: me diga qual é o caminho REAL da aplicação, onde quer que ela esteja!
          String arq = request.getServletContext().getRealPath("/Dados/dados.txt");
          File f = new File(arq);
          out.println(f.length());
          
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
