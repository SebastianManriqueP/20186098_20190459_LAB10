package com.example.Servlets;

import com.example.Beans.Usuario;
import com.example.Daos.CrearDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
                int idespecialidad = Integer.parseInt(request.getParameter("especialidad"));
                String correo_pucp = request.getParameter("correo");
                String codigo = request.getParameter("codigo");

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

    }
}
