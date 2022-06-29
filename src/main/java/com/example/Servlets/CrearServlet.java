package com.example.Servlets;

import com.example.Beans.Usuario;
import com.example.Daos.CrearDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

@WebServlet(name = "CrearServlet", value = "/CrearServlet")
public class CrearServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher view =request.getRequestDispatcher("crear.jsp");
        view.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        CrearDao crearDao = new CrearDao();


                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                int edad  = Integer.parseInt(request.getParameter("edad"));
                String contrasenha = request.getParameter("contra");
                String copia = request.getParameter("copia");
                int idespecialidad = Integer.parseInt(request.getParameter("especialidad"));
                String correo_pucp = request.getParameter("correo");
                String codigo = request.getParameter("codigo");

                Boolean a1 = nombre.substring(0).equals(" ")
                        ||  (nombre.substring(0).equals('0'))
                        || (nombre.substring(0).equals('1'))
                        || (nombre.substring(0).equals('2'))
                        || (nombre.substring(0).equals('3'))
                        || (nombre.substring(0).equals('4'))
                        || (nombre.substring(0).equals('5'))
                        || (nombre.substring(0).equals('6'))
                        || (nombre.substring(0).equals('7'))
                        || (nombre.substring(0).equals('8'))
                        || (nombre.substring(0).equals('9')) ;
        Boolean a2 = apellido.substring(0).equals(" ")
                ||  (apellido.substring(0).equals('0'))
                || (apellido.substring(0).equals('1'))
                || (apellido.substring(0).equals('2'))
                || (apellido.substring(0).equals('3'))
                || (apellido.substring(0).equals('4'))
                || (apellido.substring(0).equals('5'))
                || (apellido.substring(0).equals('6'))
                || (apellido.substring(0).equals('7'))
                || (apellido.substring(0).equals('8'))
                || (apellido.substring(0).equals('9')) ;
        Boolean a3 = edad>=18 && edad<30;
        char[] ch = codigo.toCharArray();
        Boolean a4 = (codigo.length()==8
                        && Character.isDigit(ch[0])
                && Character.isDigit(ch[1])
                && Character.isDigit(ch[2])
                && Character.isDigit(ch[3])
                && Character.isDigit(ch[4])
                && Character.isDigit(ch[5])
                && Character.isDigit(ch[6])
                && Character.isDigit(ch[7]));
        Boolean a5 = correo_pucp.contains(codigo);
        ch = contrasenha.toCharArray();
        Boolean a6 = (!(contrasenha.equals(contrasenha.toLowerCase()))
                      && ( Character.isDigit(ch[0])
                || Character.isDigit(ch[1])
                || Character.isDigit(ch[2])
                || Character.isDigit(ch[3])
                || Character.isDigit(ch[4])
                || Character.isDigit(ch[5])
                || Character.isDigit(ch[6])
                || Character.isDigit(ch[7]))
                      &&  (contrasenha.contains("$") || contrasenha.contains("&") || contrasenha.contains("#")
                           || contrasenha.contains("@") || contrasenha.contains(":") || contrasenha.contains("."))
                      );
        Boolean a7 = contrasenha.equals(copia);
        if((!a1)&&(!a2)&& a3 && a4 && a5 && a7 && (a6)){
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setEdad(edad);
            usuario.setContrasenha(contrasenha);
            usuario.setIdespecialidad(idespecialidad);
            usuario.setCorreo_pucp(correo_pucp);
            usuario.setCodigo(codigo);
            crearDao.crearUsuario(usuario);
            response.sendRedirect(request.getContextPath() + "/IndexServlet");
        }else {

            request.getSession().setAttribute("indicador2","error");
            response.sendRedirect(request.getContextPath()+"/CrearServlet");
        }

    }
}
