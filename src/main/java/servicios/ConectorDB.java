package servicios;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConectorDB {
    public Connection getConexion() throws SQLException{
        Connection cnx =null;
        
        //useTimeZone=true:
        // Este par�metro indica que se debe utilizar la zona horaria del servidor de la base de datos.
        
        //serverTimezone=UTC
        //Configura la conexi�n para que interprete las fechas y horas en la zona horaria UTC (Tiempo Universal Coordinado).
        
        //autoReconnect=true
        //Habilita la reconexi�n autom�tica en caso de que la conexi�n se pierda
        String url = "jdbc:mysql://localhost:3306/db_ventas?useTimeZone=true&"
                + "serverTimezone=UTC&autoReconnect=true";
        String usuario = "root";
        String clave = "kepler1321";
        
        
        //Especificando el driver JDBC que se utilizar� para la conexi�n a Mysql
        String Driver = "com.mysql.cj.jdbc.Driver";
        
        try {
            Class.forName(Driver);
            cnx = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConectorDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConectorDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnx;
        
    }
    
    
    
    public static void main(String[] args) {
        //probando la conexion a la base de datos (salida en consola) 
        ConectorDB conector = new ConectorDB();
        try (Connection cnx = conector.getConexion()) {
            if (cnx != null) {
                System.out.println("Conexi�n exitosa a la base de datos: " + cnx.getCatalog());
            } else {
                System.out.println("Fallo en la conexi�n a la base de datos.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectorDB.class.getName()).log(Level.SEVERE, null, ex);
        }         
    }
}