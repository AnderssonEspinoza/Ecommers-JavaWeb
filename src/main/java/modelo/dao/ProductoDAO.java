/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.Producto;
import servicios.ConectorDB;

/**
 *
 * @author Juan Jose
 */
public class ProductoDAO {
    
    ConectorDB cn = new ConectorDB();
    Connection con;

    // Metodo para capturar los datos de los usuarios en una lista
    public List<Producto> getAll() {
        List<Producto> lista = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "SELECT id_producto,nombre_producto,precio,ruta_img,categoria from producto";

        try {
            con = cn.conectar();
            ps = con.prepareStatement(cadSQL);
            rs = ps.executeQuery();
            lista = new ArrayList<>();

            while (rs.next()) {
                Producto pr = new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre_producto"),
                        rs.getDouble("precio"),
                        rs.getString("ruta_img"),
                        rs.getString("categoria")
                );
                lista.add(pr);
            }
            rs.close();
        } catch (SQLException ex) {
            //logger.error("Error al obtener la lista de usuarios", ex);
        }

        return lista;
    }       
    
}
