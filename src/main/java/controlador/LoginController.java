package controlador;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.UsuariosDAO;
import modelo.dto.Usuarios;


public class LoginController extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    private UsuariosDAO usuariosDAO;

    @Override
    public void init() throws ServletException {
        try {
            usuariosDAO = new UsuariosDAO();
        } catch (SQLException e) {
            logger.error("Error al inicializar UsuariosDAO", e);
            throw new ServletException("No se pudo inicializar UsuariosDAO", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8"); // Asegura que se maneja como JSON

        String correo = request.getParameter("loginEmail");
        String password = request.getParameter("loginPassword");

        Usuarios usuario = usuariosDAO.getUsuarioByCorreo(correo);

        if (usuario != null && usuario.getContrasena().equals(password) && "Administrador".equals(usuario.getRol())) {
            response.getWriter().write("{\"success\": true}");
        } else if(usuario != null && usuario.getContrasena().equals(password) && "Cliente".equals(usuario.getRol())) {
            response.getWriter().write("{\"success\": true}");
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
