# Generated by Django 2.2.11 on 2020-03-21 20:01

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Papeleria', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('image_category', models.ImageField(default='Category/None/no-img.jpg', upload_to='Category/')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('location', models.TextField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField(max_length=500)),
                ('price', models.FloatField()),
                ('inventory', models.IntegerField(validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(1000)])),
                ('image_item', models.ImageField(default='Item/None/no-img.jpg', upload_to='Item/')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Papeleria.Category')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='Owner',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.RenameModel(
            old_name='Usuario',
            new_name='User',
        ),
        migrations.CreateModel(
            name='ShoppingCart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number_of_item', models.IntegerField(validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(50)])),
                ('id_client', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Papeleria.Client')),
                ('id_item', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Papeleria.Item')),
            ],
            options={
                'ordering': ['number_of_item'],
            },
        ),
        migrations.CreateModel(
            name='PaperStore',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('location', models.TextField(max_length=500)),
                ('description', models.TextField()),
                ('name', models.CharField(max_length=100)),
                ('image_item', models.ImageField(default='PaperStore/None/no-img.jpg', upload_to='PaperStore/')),
                ('id_owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Papeleria.Owner')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.AddField(
            model_name='owner',
            name='id_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Papeleria.User'),
        ),
        migrations.AddField(
            model_name='client',
            name='id_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Papeleria.User'),
        ),
    ]
