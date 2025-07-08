package servlets;

import conexion.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MostrarProductos extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try (Connection con = ConexionDB.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM productos")) {
            
            out.println("<html><body><h1>Lista de Productos</h1><ul>");
            while (rs.next()) {
                out.println("<li>" + rs.getString("nombre") + " - $" + rs.getDouble("precio") + "</li>");
            }
            out.println("</ul></body></html>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}
