<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: equinoxmohit
  Date: 2/14/17
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- /.website title -->
    <title>E-Commerce Site</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <!-- CSS Files -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
    <link href="<c:url value="/resources/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/animate.css"/>" rel="stylesheet" media="screen">
    <link href="<c:url value="/resources/css/owl.theme.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/owl.carousel.css"/>" rel="stylesheet">

    <!-- Colors -->
    <link href="<c:url value="/resources/css/css-index.css"/>" rel="stylesheet" media="screen">

    <!-- Google Fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />
</head>
<!-- NAVIGATION -->
<div id="menu">
    <nav class="navbar-wrapper navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-backyard">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="<c:url value="/"/>" class="navbar-brand site-name"><strong>The De-Facto</strong></a>
            </div>

            <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="<c:url value="/products"/>">Products</a></li>
                    <li><a href="#">Reviews</a></li>
                    <li><a href="#intro">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>



