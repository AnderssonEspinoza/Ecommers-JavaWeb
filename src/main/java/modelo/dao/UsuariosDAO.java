package modelo.dao;

//import controlador.LoginController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.Usuarios;
import servicios.ConectorDB;

public class UsuariosDAO {

    private Connection cnx;
    //private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    public UsuariosDAO() throws SQLException {
        cnx = new ConectorDB().conectar();
    }

    // Metodo para capturar los datos de los usuarios en una lista
    public List<Usuarios> getList() {
        List<Usuarios> lista = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "select id_usuario, nombre_usuario, contrasena, correo, rol, id_cliente, fecha_registro from usuarios";

        try {
            ps = cnx.prepareStatement(cadSQL);
            rs = ps.executeQuery();
            lista = new ArrayList<>();

            while (rs.next()) {
                Usuarios u = new Usuarios(
                        rs.getInt("id_usuario"),
                        rs.getString("nombre_usuario"),
                        rs.getString("contrasena"),
                        rs.getString("correo"),
                        rs.getString("rol"),
                        
                        rs.getDate("fecha_registro")
                );
                lista.add(u);
            }
            rs.close();
        } catch (SQLException ex) {
            //logger.error("Error al obtener la lista de usuarios", ex);

        }

        return lista;
    }

    // Método para capturar un usuario usando como argumento su nombre
    public Usuarios getUsuarioByCorreo(String correo) {
        Usuarios usuario = null;
        String consulSql = "SELECT * FROM usuarios WHERE correo = ?";

        try (PreparedStatement ps = cnx.prepareStatement(consulSql)) {
            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuarios(
                            rs.getInt("id_usuario"),
                            rs.getString("nombre_usuario"),
                            rs.getString("contrasena"),
                            rs.getString("correo"),
                            rs.getString("rol"),
                            
                            rs.getDate("fecha_registro")
                    );
                }
            }
        } catch (SQLException ex) {
           // logger.error("Error al obtener el usuario por nombre de usuario", ex);
        }

        return usuario;
    }

    // Método para insertar un nuevo usuario
    public boolean registrarUsuario(Usuarios usuario) {
        String sql = "INSERT INTO usuarios (nombre_usuario, correo, contrasena) VALUES (?, ?, ?)";
        try (PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre_usuario());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getContrasena()); // Asegúrate de encriptar la contraseña
            
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public boolean existByCorreo(String correo) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE correo = ?";
        try ( PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setString(1, correo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Devuelve verdadero si existe al menos un registro
            }
        }
        return false;
    }

}
