package com.example.Servlets;

import com.example.Beans.Usuario;
import com.example.Daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        String logout = request.getParameter("finish");

        if(logout == null) {
                  Usuario u = (Usuario) request.getSession().getAttribute("usuarioSesion");
                if(u!=null && u.getId()!=0){
                    requestDispatcher = request.getRequestDispatcher("Menu.jsp");
                    requestDispatcher.forward(request,response);
                }else{
                    requestDispatcher = request.getRequestDispatcher("index.jsp");
                    requestDispatcher.forward(request,response);
                }
        }else{
            if(logout.equals("yes")){
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/IndexServlet");
            }else{

                requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request,response);

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDao loginDao = new LoginDao();
        String correo = request.getParameter("correo");
        String pass = request.getParameter("pass");
        Usuario usuario = loginDao.validar(correo, pass);
        HttpSession session = request.getSession();

        if(usuario !=null){

            session.setAttribute("usuarioSesion",usuario);
            session.setMaxInactiveInterval(60*60);
            response.sendRedirect(request.getContextPath()+"/ViajeServlet");


        }else{

            session.setAttribute("indicador","error");
            response.sendRedirect(request.getContextPath()+"/LoginServlet");
        }

    }
}
