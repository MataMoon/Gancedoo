<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.NumberFormat" %>
<%
    String error = (String) request.getAttribute("error");

    String nombre = (String) request.getAttribute("nombre");
    String referencia = (String) request.getAttribute("referencia");
    Double precio = (Double) request.getAttribute("precio");
    Integer stock = (Integer) request.getAttribute("stock");
    String tiempoFabricacion = (String) request.getAttribute("tiempo");
    String material = (String) request.getAttribute("material");
    String instruccionesLavado = (String) request.getAttribute("lavado");
    String composicion = (String) request.getAttribute("composicion");
    String ancho = (String) request.getAttribute("ancho");
    String peso = (String) request.getAttribute("peso");
    String resistenciaLuz = (String) request.getAttribute("resistencia");
    String imagenUrl = (String) request.getAttribute("imagen");

    NumberFormat formato = NumberFormat.getCurrencyInstance();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title><%= nombre != null ? nombre : "Producto" %> | Showroom</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Montserrat:wght@600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Lato', sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .product-name {
            font-family: 'Montserrat', sans-serif;
            font-size: 32px;
            color: #3a4e6f;
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .product-info {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .product-info strong {
            color: #3a4e6f;
        }

        .error {
            color: red;
            font-weight: bold;
        }

        .back-button {
            margin-top: 30px;
        }

        .back-button a {
            color: #3a4e6f;
            text-decoration: none;
            border: 2px solid #3a4e6f;
            padding: 8px 16px;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .back-button a:hover {
            background-color: #3a4e6f;
            color: white;
        }

        .product-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <% if (error != null) { %>
        <p class="error"><%= error %></p>
    <% } else { %>
        <% if (imagenUrl != null && !imagenUrl.isEmpty()) { %>
            <img src="<%= request.getContextPath() + "/" + imagenUrl %>" alt="Imagen del producto" class="product-image" />
        <% } %>
        <div class="product-name"><%= nombre %></div>
        <div class="product-price"><%= precio != null ? formato.format(precio) : "N/D" %></div>
        <div class="product-info"><strong>Referencia:</strong> <%= referencia %></div>
        <div class="product-info"><strong>Stock:</strong> <%= stock %></div>
        <div class="product-info"><strong>Tiempo de fabricación:</strong> <%= tiempoFabricacion %></div>
        <div class="product-info"><strong>Material:</strong> <%= material %></div>
        <div class="product-info"><strong>Instrucciones de lavado:</strong> <%= instruccionesLavado %></div>
        <div class="product-info"><strong>Composición:</strong> <%= composicion %></div>
        <div class="product-info"><strong>Ancho:</strong> <%= ancho %></div>
        <div class="product-info"><strong>Peso:</strong> <%= peso %></div>
        <div class="product-info"><strong>Resistencia a la luz:</strong> <%= resistenciaLuz %></div>
    <% } %>

    <div class="back-button">
        <a href="<%= request.getContextPath() + "/index.html" %>">← Volver al inicio</a>
    </div>
</div>

</body>
</html>
