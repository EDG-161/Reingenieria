from django.core.validators import *
from django.db import models


# Create your models here.
class User(models.Model):
    email = models.EmailField(max_length=150)
    password = models.CharField(max_length=50)
    name = models.CharField(max_length=200)
    user_type = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(2)], default=1)

    class Meta:
        ordering = ["name"]

    def __str__(self):
        return self.email


class Owner(models.Model):
    id_user = models.ForeignKey(
        'User',
        on_delete=models.CASCADE,
    )


class Client(models.Model):
    id_user = models.ForeignKey(
        'User',
        on_delete=models.CASCADE,
    )
    location = models.TextField(max_length=500, default="Sin direccion")


class PaperStore(models.Model):
    id_owner = models.ForeignKey(
        'Owner',
        on_delete=models.CASCADE,
    )
    location = models.TextField(max_length=500)
    description = models.TextField()
    name = models.CharField(max_length=100)
    image_paper = models.ImageField(upload_to='Papeleria/static/PaperStore/', default='PaperStore/None/no-img.jpg')

    class Meta:
        ordering = ["name"]

    def __str__(self):
        return self.name


class Category(models.Model):
    id_owner = models.ForeignKey('Owner', on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    image_category = models.ImageField(upload_to='Papeleria/static/Category/', default='Category/None/no-img.jpg')

    class Meta:
        ordering = ["name"]


class Item(models.Model):
    id_paper_store = models.ForeignKey('PaperStore',
                                        on_delete=models.CASCADE,)
    name = models.CharField(max_length=100)
    description = models.TextField(max_length=500)
    price = models.FloatField()
    category = models.ForeignKey(
        'Category',
        on_delete=models.CASCADE,
    )
    inventory = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(1000)])
    image_item = models.ImageField(upload_to='Papeleria/static/Item/', default='Item/None/no-img.jpg')

    class Meta:
        ordering = ["name"]


class ShoppingCart(models.Model):
    id_client = models.ForeignKey(
        'Client',
        on_delete=models.CASCADE,
    )
    id_item = models.ForeignKey(
        'Item',
        on_delete=models.CASCADE,
    )
    number_of_item = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(50)])

    class Meta:
        ordering = ["number_of_item"]
