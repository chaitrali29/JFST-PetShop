<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Best Sellers</title>
    <style>
        /* Reuse the same CSS as in the Dog Accessories page */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5fffa;
            height: 100vh;
        }

        .container {
            width: 90%;
            margin: auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
            font-weight: bold;
            background: linear-gradient(135deg, #ff7f50, #ff6347);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .product-card {
            border: 1px solid #ddd;
            border-radius: 12px;
            text-align: center;
            padding: 15px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .product-title {
            font-size: 18px;
            font-weight: bold;
            margin: 15px 0;
            color: #4b0082;
        }

        .product-price {
            font-size: 16px;
            color: #444;
            margin: 5px 0;
        }

        .add-to-cart button {
            background-color: #ff6347;
            border: none;
            color: white;
            padding: 12px 18px;
            cursor: pointer;
            border-radius: 8px;
            font-size: 15px;
            margin-top: auto;
            transition: background-color 0.3s ease;
        }

        .add-to-cart button:hover {
            background-color: #ff7f50;
        }

        header {
            background-color: #ff6347;
            padding: 20px 0;
            text-align: center;
        }

        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-size: 1.1em;
        }

        nav a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        footer a {
            color: #ff6347;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="shop.jsp">Shop</a>
            <a href="about.jsp">About Us</a>
            <a href="contact.jsp">Contact Us</a>
        </nav>
    </header>

    <div class="container">
        <h1>Best Sellers</h1>
        <div class="product-grid">
            <%-- Sample product list using JSP syntax --%>
            <%
                // Assuming products are retrieved from a database or other data source
                // Example of a hardcoded product list for demonstration
                class Product {
                    String title, imagePath;
                    double price;

                    public Product(String title, String imagePath, double price) {
                        this.title = title;
                        this.imagePath = imagePath;
                        this.price = price;
                    }
                }

                List<Product> bestSellers = Arrays.asList(
                    new Product("Stylish Dog Collar", "images/dog-collar.jpg", 199.00),
                    new Product("Premium Dog Bed", "images/dog-bed.jpg", 1499.00),
                    new Product("Eco-friendly Dog Bowl", "images/dog-bowl.jpg", 299.00),
                    new Product("Interactive Dog Toy", "images/dog-toy.jpg", 399.00)
                );

                for (Product product : bestSellers) {
            %>
            <div class="product-card">
                <img src="<%= product.imagePath %>" alt="<%= product.title %>">
                <div class="product-title"><%= product.title %></div>
                <div class="product-price">₹<%= String.format("%.2f", product.price) %></div>
                <div class="add-to-cart">
                    <button>Add to Cart</button>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 PetLover. All rights reserved.</p>
        <p>Visit our <a href="#">Privacy Policy</a> and <a href="#">Terms of Service</a>.</p>
    </footer>
</body>
</html>
