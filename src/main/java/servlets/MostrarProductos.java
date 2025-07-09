package servlets;

import conexion.ConexionDB;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MostrarProductos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            request.setAttribute("error", "❌ ID de producto no especificado.");
            request.getRequestDispatcher("/producto.jsp").forward(request, response);
            return;
        }

        try (Connection con = ConexionDB.getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT * FROM productos WHERE id = ?")) {

            stmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("nombre", rs.getString("nombre"));
                request.setAttribute("precio", rs.getDouble("precio"));
                request.setAttribute("descripcion", rs.getString("descripcion"));
                request.setAttribute("stock", rs.getInt("stock"));
                request.setAttribute("categoria", rs.getString("categoria"));
                request.setAttribute("imagen", rs.getString("imagen_url"));
            } else {
                request.setAttribute("error", "❌ Producto no encontrado con ID: " + id);
            }

            request.getRequestDispatcher("/producto.jsp").forward(request, response);

        } catch (SQLException | NumberFormatException ex) {
            ex.printStackTrace();
            request.setAttribute("error", "⚠️ Error: " + ex.getMessage());
            request.getRequestDispatcher("/producto.jsp").forward(request, response);
        }
    }
}
