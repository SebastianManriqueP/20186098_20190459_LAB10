package com.example.Servlets;



import com.example.Beans.Usuario;
import com.example.Daos.ViajeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ViajeServlet", value = "/ViajeServlet")
public class ViajeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        ViajeDao viajeDao = new ViajeDao();
        Usuario u = (Usuario) request.getSession().getAttribute("usuarioSesion");
        if(u!=null && u.getId()!=0){
            switch (action){
                case"listar"->{
                    request.setAttribute("listaVuelos",viajeDao.listarVuelos(String.valueOf(u.getId())));
                    request.setAttribute("gastoTotal",viajeDao.calcularGasto(String.valueOf(u.getId())));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        }else{
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        ViajeDao viajeDao = new ViajeDao();
        Usuario u = (Usuario) request.getSession().getAttribute("usuarioSesion");
        if(u!=null && u.getId()!=0){
            switch(action){
                case "buscar"->{
                    String textoBuscar = request.getParameter("textoABuscar");
                    request.setAttribute("listaVuelos",viajeDao.BuscarPorCiudad(String.valueOf(u.getId()),textoBuscar));
                    request.setAttribute("gastoTotal",viajeDao.calcularGasto(String.valueOf(u.getId())));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu.jsp");
                    requestDispatcher.forward(request, response);
                }
                case"crear"->{
                    String fecha = request.getParameter("fecha");
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    String empresaSeguro = request.getParameter("seguro");
                    String boletos = request.getParameter("boletos");
                    String costo = request.getParameter("costo");
                    viajeDao.crearVuelo(String.valueOf(u.getId()),fecha,origen,destino,empresaSeguro,boletos,costo);
                    response.sendRedirect(request.getContextPath() + "/ViajeServlet");

                }
                case"editar"->{
                    String id =request.getParameter("viajeId");
                    String fecha = request.getParameter("fecha");
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    String empresaSeguro = request.getParameter("seguro");
                    String boletos = request.getParameter("boletos");
                    String costo = request.getParameter("costo");
                    viajeDao.crearVuelo(String.valueOf(u.getId()),fecha,origen,destino,empresaSeguro,boletos,costo);
                    response.sendRedirect(request.getContextPath() + "/ViajeServlet");

                }
            }
        }else{
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

    }
}
