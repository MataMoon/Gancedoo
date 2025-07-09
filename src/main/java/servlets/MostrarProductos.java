package servlets;

import conexion.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MostrarProductos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        // try-with-resources para cerrar automáticamente el PrintWriter
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");

            if (id == null || id.trim().isEmpty()) {
                out.println("<html><body><p>❌ ID de producto no especificado.</p></body></html>");
                return;
            }

            try (Connection con = ConexionDB.getConnection();
                 PreparedStatement stmt = con.prepareStatement("SELECT * FROM productos WHERE id = ?")) {

                stmt.setInt(1, Integer.parseInt(id)); // Asegura que sea número
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String nombre = rs.getString("nombre");
                    double precio = rs.getDouble("precio");
                    String descripcion = rs.getString("descripcion");
                    int stock = rs.getInt("stock");
                    String categoria = rs.getString("categoria");
                    String imagen = rs.getString("imagen_url");

                    out.println("<!DOCTYPE html>");
                    out.println("<html><head><meta charset='UTF-8'><title>Detalles del Producto</title>");
                    out.println("<style>");
                    out.println("body { font-family: Arial, sans-serif; background-color: #f0f0f0; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }");
                    out.println(".card { background-color: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 400px; text-align: center; }");
                    out.println(".product-image { width: 100%; height: 200px; background-color: #ddd; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin-bottom: 20px; overflow: hidden; }");
                    out.println(".product-image img { width: 100%; height: auto; }");
                    out.println(".product-name { font-size: 24px; font-weight: bold; margin-bottom: 10px; }");
                    out.println(".product-price { font-size: 20px; color: green; margin-bottom: 10px; }");
                    out.println(".product-info { font-size: 16px; color: #555; margin-bottom: 5px; }");
                    out.println("</style>");
                    out.println("</head><body>");

                    out.println("<div class='card'>");

                    if (imagen != null && !imagen.isEmpty()) {
                        out.println("<div class='product-image'><img src='" + imagen + "' alt='Imagen del producto'></div>");
                    } else {
                        out.println("<div class='product-image'>[Sin imagen]</div>");
                    }

                    out.println("<div class='product-name'>" + nombre + "</div>");
                    out.println("<div class='product-price'>$" + precio + "</div>");
                    out.println("<div class='product-info'><strong>Descripción:</strong> " + (descripcion != null ? descripcion : "No disponible") + "</div>");
                    out.println("<div class='product-info'><strong>Categoría:</strong> " + (categoria != null ? categoria : "No especificada") + "</div>");
                    out.println("<div class='product-info'><strong>Stock disponible:</strong> " + stock + "</div>");

                    out.println("</div></body></html>");

                } else {
                    out.println("<html><body><p>❌ Producto no encontrado con ID: " + id + "</p></body></html>");
                }

            } catch (SQLException | NumberFormatException ex) {
                ex.printStackTrace();
                out.println("<html><body><p>⚠️ Error: " + ex.getMessage() + "</p></body></html>");
            }
        }
    }
}
