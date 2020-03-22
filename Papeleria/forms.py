from django import forms
from django.core.validators import *


class PaperStoreImageForm(forms.Form):
    image_paper = forms.ImageField()
    location = forms.CharField(max_length=500)
    description = forms.CharField(max_length=500)
    name = forms.CharField(max_length=100)


class AddProductForm(forms.Form):
    name = forms.CharField(max_length=100)
    description = forms.CharField(max_length=500)
    price = forms.FloatField(validators=[MinValueValidator(0.0001), MaxValueValidator(1000000)])
    category = forms.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(1000000)])
    inventory = forms.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(1000)])
    image_item = forms.ImageField()


class AddCategoryForm(forms.Form):
    name = forms.CharField(max_length=50)
    image_category = forms.ImageField()
