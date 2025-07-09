<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.NumberFormat" %>
<%
    String error = (String) request.getAttribute("error");

    String nombre = (String) request.getAttribute("nombre");
    Double precio = (Double) request.getAttribute("precio");
    String descripcion = (String) request.getAttribute("descripcion");
    Integer stock = (Integer) request.getAttribute("stock");
    String categoria = (String) request.getAttribute("categoria");
    String imagen = (String) request.getAttribute("imagen");

    NumberFormat formato = NumberFormat.getCurrencyInstance();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="UTF-8" />
    <title>Detalles del Producto - <%= nombre != null ? nombre : "" %></title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Montserrat:wght@600&display=swap" rel="stylesheet" />

    <style>
        /* Reset básico */
        *, *::before, *::after {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background-color: #fff;
            font-family: 'Lato', sans-serif;
            color: #222;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding: 60px 20px;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background-color: #fafafa;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.07);
            padding: 40px 35px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-image {
            width: 100%;
            max-height: 320px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            background-color: #eaeaea;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .product-image img {
            max-width: 100%;
            height: auto;
            object-fit: contain;
        }

        .product-name {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.2rem;
            font-weight: 600;
            color: #1b1b1b;
            margin-bottom: 12px;
            text-align: center;
            letter-spacing: 0.04em;
            word-wrap: break-word;
            hyphens: auto;
        }

        .product-price {
            font-size: 1.8rem;
            font-weight: 700;
            color: #3a4e6f; /* Azul grisáceo */
            margin-bottom: 24px;
        }

        .product-info {
            font-size: 1rem;
            line-height: 1.6;
            color: #555;
            margin-bottom: 16px;
            width: 100%;
            word-wrap: break-word;
            hyphens: auto;
        }

        .product-info strong {
            color: #333;
        }

        .error {
            color: #d32f2f;
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
        }

        .back-button {
            margin-top: 35px;
            width: 100%;
            text-align: center;
        }
        .back-button a {
            display: inline-block;
            text-decoration: none;
            background-color: transparent;
            border: 2.5px solid #3a4e6f;
            color: #3a4e6f;
            font-weight: 600;
            padding: 12px 28px;
            border-radius: 8px;
            font-size: 1rem;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .back-button a:hover {
            background-color: #3a4e6f;
            color: #fafafa;
        }

        /* Responsive */
        @media (max-width: 640px) {
            body {
                padding: 30px 15px;
            }
            .container {
                padding: 30px 25px;
            }
            .product-name {
                font-size: 1.8rem;
            }
            .product-price {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 360px) {
            .product-name {
                font-size: 1.5rem;
            }
            .product-price {
                font-size: 1.2rem;
            }
            .product-info {
                font-size: 0.9rem;
            }
            .back-button a {
                padding: 10px 20px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <% if (error != null) { %>
        <p class="error"><%= error %></p>
    <% } else { %>
        <div class="product-image">
            <% if (imagen != null && !imagen.isEmpty()) { %>
                <img src="<%= imagen %>" alt="Imagen del producto" />
            <% } else { %>
                <span style="color:#999; font-style: italic;">[Sin imagen disponible]</span>
            <% } %>
        </div>
        <div class="product-name"><%= nombre %></div>
        <div class="product-price"><%= formato.format(precio) %></div>
        <div class="product-info"><strong>Descripción:</strong> <%= descripcion %></div>
        <div class="product-info"><strong>Categoría:</strong> <%= categoria %></div>
        <div class="product-info"><strong>Stock disponible:</strong> <%= stock %></div>
    <% } %>

    <div class="back-button">
        <a href="inicio.html">← Volver al inicio</a>
    </div>
</div>

</body>
</html>
