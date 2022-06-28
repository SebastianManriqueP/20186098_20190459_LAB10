package com.example.Daos;
import com.example.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;
public class CrearDao {


      String user = "root";
      String pass = "root";
      String url = "jdbc:mysql://localhost:3306/lab10";

        public void crearUsuario(Usuario usuario) {

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String sql = "insert into usuario (nombre,apellido,edad,codigo_pucp,correo_pucp,contrasenha,idespecialidad)  VALUES (?,?,?,?,?,sha2(?,256),?)";

            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, usuario.getNombre());
                pstmt.setString(2, usuario.getApellido());
                pstmt.setInt(3, usuario.getEdad());
                pstmt.setString(4, usuario.getCodigo());
                pstmt.setString(5,usuario.getCorreo_pucp());
                pstmt.setString(6, usuario.getContrasenha());
                pstmt.setInt(7, usuario.getIdespecialidad());
                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
}
