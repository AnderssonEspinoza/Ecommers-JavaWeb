/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.UsuariosDAO;
import modelo.dto.Usuarios;

/**
 *
 * @author esola
 */
public class ControladorRegistro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorRegistro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorRegistro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Obtener los parámetros del formulario
            String nombre_usuario = request.getParameter("nombre_usuario");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            //String rol = "cliente";  // Rol por defecto
            Date fecha_registro = new Date(System.currentTimeMillis());  // Fecha actual

            // Crear el objeto Usuario
            Usuarios usuario = new Usuarios(0, nombre_usuario, correo, contrasena, "cliente", fecha_registro);

            // Registrar el usuario usando el DAO
            UsuariosDAO dao = new UsuariosDAO();

            if (dao.existByCorreo(correo)) {
                out.println("<html><body>");
                out.println("<h1>Error: El usuario con el correo \"" + correo + "\" ya existe.</h1>");
                out.println("</body></html>");
            } else {
                // Guardar el usuario en la base de datos
                dao.registrarUsuario(usuario); // Método que guarda el usuario en la base de datos
                // Mensaje inserccion éxitosa
                out.println("<html><body>");
                out.println("<h1>Usuario registrado exitosamente</h1>");
                out.println("</body></html>");
            }
        } catch (SQLException ex) {
            // Manejar el error SQL
            Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(javax.servlet.http.HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al acceder a la base de datos");
        } catch (Exception ex) {
            // Manejar errores generales
            Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(javax.servlet.http.HttpServletResponse.SC_BAD_REQUEST, "Datos inválidos en el formulario");
        }
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
