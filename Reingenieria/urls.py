"""Reingenieria URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from PIL._imaging import path
from django.contrib import admin
from django.urls import path
from Papeleria import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name="index"),
    path('signUp', views.register_user, name="signUp"),
    path('home', views.home, name="home"),
    path('signOut', views.SignOut, name="signOut"),
    path('signIn', views.signIn, name="signIn"),
    path('register_paper_store', views.register_paper_store, name="register_paper_store"),
    path('PaperStore/<int:paper_id>/watch', views.paper_store, name="paper_store"),
    path('PaperStore/<int:paper_id>/addProduct', views.addProduct, name="addProduct"),
    path('addCategory/<int:owner_id>', views.addCategory, name="addCategory"),
    path('addItemCart', views.addItemCart, name="addItemCart"),
    path('shopping_cart', views.shopping_cart, name="shopping_cart"),
    path('delItemCart', views.delItemCart, name="delItemCart"),
    path('buyCart', views.buyCart, name="buyCart"),
    path('sales', views.sales, name="sales"),
]

