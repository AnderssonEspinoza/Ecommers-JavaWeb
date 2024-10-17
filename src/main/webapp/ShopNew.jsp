<%@page import="modelo.dto.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Menú</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.html" class="nav-item nav-link">Inicio</a>
                            <a href="shop.html" class="nav-item nav-link active">Menú</a>
                            <a href="reservas.html" class="nav-item nav-link">Reservas</a>
                            <!--<a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>-->
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.html" class="dropdown-item">Cart</a>
                                    <a href="chackout.html" class="dropdown-item">Chackout</a>
                                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                    <!--<a href="404.html" class="dropdown-item">404 Page</a>-->
                                </div>
                            </div>

                            <a href="contact.html" class="nav-item nav-link">Contacto</a>

                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                            <a href="#" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                            </a>
                            <a href="#" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5 container-menu">
            <div class="container py-5">
                <h1 class="mb-4">Nuestros productos</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <h4>Postres</h4>   
                    </div>
                   
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">                                        
                                        <%
    List<Producto> productos = (List<Producto>) request.getAttribute("productos");

        for (int i = 0; i < productos.size(); i++) {
            Producto pr = productos.get(i);
            if (pr.getCategoria().equals("postre")) {  // Asegúrate de que el producto no sea nulo
%>
<div class="col-md-6 col-lg-4 col-xl-3">
    <div class="rounded position-relative fruite-item">
        <div class="fruite-img">
            <img src="<%= pr.getRuta_img() %>" class="img-fluid w-100 rounded-top" alt=""/>
        </div>
        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
            <h4><%= pr.getNombre_producto() %></h4>
            <div class="d-flex justify-content-between flex-lg-wrap">
                <p class="text-dark fs-5 fw-bold mb-0">$ <%= pr.getPrecio() %></p>
                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Añadir al carrito</a>
            </div>
        </div>
    </div>
</div>                
<%
            }
        }

%>

                                                                                                                       
                        <h4>Bebidas</h4>      
                                                                <%
        for (int i = 0; i < productos.size(); i++) {
            Producto pr = productos.get(i);
            if (pr.getCategoria().equals("bebida")){  // Asegúrate de que el producto no sea nulo
%>
<div class="col-md-6 col-lg-4 col-xl-3">
    <div class="rounded position-relative fruite-item">
        <div class="fruite-img">
            <img src="<%= pr.getRuta_img() %>" class="img-fluid w-100 rounded-top" alt=""/>
        </div>
        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
            <h4><%= pr.getNombre_producto() %></h4>
            <div class="d-flex justify-content-between flex-lg-wrap">
                <p class="text-dark fs-5 fw-bold mb-0">$ <%= pr.getPrecio() %></p>
                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Añadir al carrito</a>
            </div>
        </div>
    </div>
</div>                
<%
            }
        }

%>
                                                                                                                                                                               
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">

                                <h1 class="text-primary mb-0">Napoleón</h1>
                                <p class="text-secondary mb-0">Haute Pâtisserie</p>

                            </a>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mx-auto">

                                <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Tu Email">
                                <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscríbete ahora</button>
                            </div>
                        </div>
<div class="col-lg-3">
    <div class="d-flex justify-content-end pt-3">
        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="https://www.instagram.com/napoleon_patisserie/?hl=es" target="_blank">
            <i class="fab fa-instagram"></i>
        </a>
        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="https://www.facebook.com/NapoleonPatisserieParis/" target="_blank">
            <i class="fab fa-facebook-f"></i>
        </a>
        <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="https://www.tiktok.com/@napoleon_patisserie?is_from_webapp=1&sender_device=pc" target="_blank">
            <i class="fab fa-tiktok"></i>
        </a>
    </div>
</div>
                </div>  
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">¿Por qué Napoleón?</h4>
                            <p class="mb-4">Napoléon es un pedazo de Francia en Lima. Jérôme Galiano lo nombró asi en honor al famoso pastelero francés Gaston Lenôtre, conocido por los parisinos como “el Napoleón de la pastelería” </p>


                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">

                            <h4 class="text-light mb-3">Nosotros</h4>
                            <a class="btn-link" href="shop.html">Menú</a>
                            <a class="btn-link" href="contact.html">Contáctanos</a>
                            <a class="btn-link" href="privacidad.html">Política de Privacidad</a>
                            <a class="btn-link" href="terminos.html">Términos y condiciones</a>
                            <a class="btn-link" href="preguntas.html">Preguntas Frecuentes</a>
 

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">

                            <h4 class="text-light mb-3">Cuenta</h4>
                            <a class="btn-link" href="">Mi cuenta</a>
                            <a class="btn-link" href="">Mis compras</a>
                            <a class="btn-link" href="reclamaciones.html">Libro de Reclamaciones</a>
                            <a class="btn-link" href="sugerencias.html">Sugerencias</a>

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">

                            <h4 class="text-light mb-3">Contacto</h4>
                            <p>Dirección: Vía Principal 176, San Isidro 15073</p>
                            <p>Email: napoleon.cafe@gmail.com</p>
                            <p>Whatsapp: + 51 925 261 398</p>
                            <p>Formas de Pago</p>

                            <img src="img/payment.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    </body>

</html>
