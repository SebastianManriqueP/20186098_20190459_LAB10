package com.example.Daos;

import com.example.Beans.BViaje;

import java.sql.*;
import java.util.ArrayList;

public class ViajeDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/lab10";

    public ArrayList<BViaje> listarVuelos(String idUser){
        ArrayList<BViaje> listaVuelos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql ="SELECT v.idViaje, v.fecha_reserva, v.fecha_viaje, v.ciudad_origen, v.ciudad_destino, v.num_boletos, v.costo_total, e.nombre FROM viaje v, empresa e where v.idEmpresa = e.idEmpresa and v.idUsuario = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,idUser);

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    BViaje bviaje = new BViaje();
                    bviaje.setIdViaje(rs.getString(1));
                    bviaje.setFechaReserva(rs.getString(2));
                    bviaje.setFechaViaje(rs.getString(3));
                    bviaje.setCiudadOrigen(rs.getString(4));
                    bviaje.setCiudadDestino(rs.getString(5));
                    bviaje.setBoletos(rs.getInt(6));
                    bviaje.setCosto(rs.getFloat(7));
                    bviaje.setEmpresa(rs.getString(8));
                    listaVuelos.add(bviaje);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaVuelos;
    }



    public ArrayList<BViaje> BuscarPorCiudad(String idUser, String ciudadABuscar){
        ArrayList<BViaje> listaVuelos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql ="SELECT v.idViaje, v.fecha_reserva, v.fecha_viaje, v.ciudad_origen, v.ciudad_destino, v.num_boletos, v.costo_total, e.nombre FROM viaje v, empresa e where v.idEmpresa = e.idEmpresa and v.idUsuario = ? and ( v.ciudad_destino like ? or v.ciudad_origen like ?) ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,idUser);
            pstmt.setString(2,ciudadABuscar);
            pstmt.setString(3,ciudadABuscar);

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    BViaje bviaje = new BViaje();
                    bviaje.setIdViaje(rs.getString(1));
                    bviaje.setFechaReserva(rs.getString(2));
                    bviaje.setFechaViaje(rs.getString(3));
                    bviaje.setCiudadOrigen(rs.getString(4));
                    bviaje.setCiudadDestino(rs.getString(5));
                    bviaje.setBoletos(rs.getInt(6));
                    bviaje.setCosto(rs.getFloat(7));
                    bviaje.setEmpresa(rs.getString(8));
                    listaVuelos.add(bviaje);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaVuelos;
    }



    public void crearVuelo(String idUser,String fechaVuelo, String origen, String destino, String idEmpresa, String boletos, String costo){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO viaje (idViaje, fecha_reserva, fecha_viaje, ciudad_origen, ciudad_destino, num_boletos, costo_total, idEmpresa, idUsuario) VALUES (?, NOW(), ? , ? , ?, ?, ?, ?, ?);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            int idVuelo = this.generarId();
            pstmt.setString(1, String.valueOf(idVuelo));
            pstmt.setString(2,fechaVuelo);
            pstmt.setString(3,origen);
            pstmt.setString(4,destino);
            pstmt.setString(5,boletos);
            pstmt.setString(6,costo);
            pstmt.setString(7,idEmpresa);
            pstmt.setString(8,idUser);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }



    public float calcularGasto(String idUser){
        float gastototal=0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql ="SELECT sum(v.costo_total) FROM viaje v where v.idUsuario = ?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,idUser);

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    gastototal = rs.getFloat(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return gastototal;

    }


    public int generarId() {
        double id = 10000000 + Math.random() * 90000000;
        return (int) id;
    }

    public void editarVuelo(String idVuelo,String fechaVuelo, String origen, String destino, String idEmpresa, String boletos, String costo){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO viaje (idViaje, fecha_reserva, fecha_viaje, ciudad_origen, ciudad_destino, num_boletos, costo_total, idEmpresa, idUsuario) VALUES (?, NOW(), ? , ? , ?, ?, ?, ?, ?);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setString(1, String.valueOf(idVuelo));
            pstmt.setString(2,fechaVuelo);
            pstmt.setString(3,origen);
            pstmt.setString(4,destino);
            pstmt.setString(5,boletos);
            pstmt.setString(6,costo);
            pstmt.setString(7,idEmpresa);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


}


