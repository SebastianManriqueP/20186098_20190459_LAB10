package com.example.Daos;

import com.example.Beans.Usuario;

import java.sql.*;

public class LoginDao {
    public Usuario validar(String correo,String password){
        Usuario usuario = null;
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/lab10";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "Select * from usuario where correo_pucp =? and contrasenha=sha2(?,256) and idespecialidad=1";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,correo);
            pstmt.setString(2,password);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    usuario = new Usuario();
                    usuario.setId(rs.getInt(1));
                    usuario.setCorreo_pucp(rs.getString(6));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));

                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
}