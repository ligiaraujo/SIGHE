package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <title>SIGHE - LOGIN </title>\n");
      out.write("     \n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write(" <img  width=\"100%\" src=\"imagens/newbanner.png\" class=\"\"/> </p>\n");
      out.write("\t\t\n");
      out.write("    <div class=\"wrapper\"> \n");
      out.write("<div class=\"content\">\n");
      out.write("<div id=\"form_wrapper\" class=\"form_wrapper\">\n");
      out.write("\n");
      out.write("<form class=\"login active\">\n");
      out.write("<img src=\"imagens/banner.jpg\" width=\"350px\" id=\"user\"/> \n");
      out.write("<div>\n");
      out.write("          <label>Matrícula:</label>\n");
      out.write("          <input type=\"text\" size=\"30\" maxlength=\"20\" placeholder=\"Sua Matricula\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("  </div>\n");
      out.write("  <div>\n");
      out.write("          <label>Senha</label>\n");
      out.write("          <input type=\"password\" name=\"senha\" size=\"30\" maxlength=\"10\" placeholder=\"********\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("          <input type=\"submit\" value=\"Entrar\" class=\"btnPositivo\" > \n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"clear\"> </div>\n");
      out.write("\n");
      out.write("<div class=\"clear\"></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</form>\n");
      out.write(" </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write(" <style type=\"text/css\">\n");
      out.write("\n");
      out.write("\tbody{\n");
      out.write("\n");
      out.write("background-image: url(imagens/bg.gif);\n");
      out.write("background-repeat: repeat;\n");
      out.write("margin-top: 90px;\n");
      out.write("margin-left:200px;\n");
      out.write("margin-right:200px;\n");
      out.write("margin-bottom: 20px;\n");
      out.write("border-bottom: 35px solid green;    \n");
      out.write("border-left: 35px solid green;\n");
      out.write("border-right: 35px solid green;\n");
      out.write("border-top: 35px solid green;\n");
      out.write("\n");
      out.write("}  \n");
      out.write("\n");
      out.write("</style>\n");
      out.write("\t");
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
