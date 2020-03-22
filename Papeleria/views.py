from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from Papeleria.forms import *
from Papeleria.models import *
from Papeleria.auth import *


def register_user(request):
    if request.method == "POST":
        if request.POST.__contains__('name') and request.POST.__contains__('password') and \
                request.POST.__contains__('repeat_password') and \
                request.POST.__contains__('user') and request.POST.__contains__('type_user') \
                and len(User.objects.filter(email=request.POST['user'])) == 0:

            user = User(name=request.POST['name'], email=request.POST['user'], password=request.POST['password'],
                        user_type=int(request.POST['type_user']))
            if int(request.POST['type_user']) == 1:
                user.save()
                owner = Owner(id_user=user)
                owner.save()
                request.session['type_user'] = int(request.POST['type_user'])
                request.session['id_user'] = user.id
                return redirect('/home')
            elif int(request.POST['type_user']) == 2:
                user.save()
                client = Client(id_user=user)
                client.save()
                request.session['type_user'] = int(request.POST['type_user'])
                request.session['id_user'] = user.id
                return redirect('/home')
            else:
                return render(request, 'register.html', {'error': 'true', 'message': 'El tipo de usuario no es valido'})
        else:
            if len(User.objects.filter(email=request.POST['user'])) > 0:
                return render(request, 'register.html', {'error': 'true', 'message': 'El correo se encuentra en uso'})
            elif request.POST['password'] != request.POST['repeat_password']:
                return render(request, 'register.html', {'error': 'true', 'message': 'Las contraseñas no coinciden'})
            else:
                return render(request, 'register.html', {'error': 'true', 'message': 'Los datos no son validos'})
    else:
        return render(request, 'register.html')


def index(request):
    if request.session.has_key('id_user'):
        if request.session['id_user'] is not None:
            return redirect('/home')
        else:
            return render(request, 'index.html')
    else:
        return render(request, 'index.html')


def home(request):
    try:
        if request.session['id_user'] is not None:
            if request.session['type_user'] == 1:
                owner = Owner.objects.get(id_user=request.session['id_user'])
                papelerias = PaperStore.objects.filter(id_owner=owner)
                cat = Category.objects.filter(id_owner=owner)
                return render(request, 'home_owner.html', {'papelerias': papelerias, "owner": owner, 'categories': cat})
            else:
                papelerias = PaperStore.objects.all()
                return render(request, 'home_client.html', {'papelerias': papelerias})
        else:
            return redirect('/')
    except KeyError as E:
        return redirect('/')


def SignOut(request):
    request.session['id_user'] = None
    request.session['type_user'] = None
    return redirect('/')


def signIn(request):
    if request.session.has_key('id_user') and request.session.has_key('type_user'):
        if request.session['id_user'] is not None and request.session['type_user'] is not None:
            return redirect('/home')

    if request.method == "POST":
        print(type(request.POST))
        if request.POST.__contains__('user') and request.POST.__contains__('password'):
            user = User.objects.filter(email=request.POST['user'], password=request.POST['password'])
            if len(user) > 0:
                request.session['id_user'] = user[0].id
                request.session['type_user'] = user[0].user_type
                return redirect('home')
            else:
                return render(request, 'index.html', {'error': 'true', 'message': 'Usuario o contraseña incorrectos'})
        else:
            return render(request, 'index.html', {'error': 'true', 'message': 'Datos incompletos'})
    else:
        return render(request, 'index.html')


def register_paper_store(request):
    if request.session.has_key('id_user') is False and request.session.has_key('type_user') is False:
        if request.session['id_user'] is None and request.session['type_user'] is None:
            return redirect('/')

    if request.method == "POST":
        if request.POST.__contains__('name') \
                and request.POST.__contains__('location') \
                and request.POST.__contains__('description'):
            form = PaperStoreImageForm(request.POST, request.FILES)
            print(form.changed_data)
            if form.is_valid():
                if request.session['type_user'] == 1:
                    user = Owner.objects.get(id_user=request.session['id_user'])
                    paper_store = PaperStore(name=form.cleaned_data['name'], location=form.cleaned_data['location'],
                                             description=form.cleaned_data['description'],
                                             image_paper=form.cleaned_data['image_paper'], id_owner=user)
                    paper_store.save()
                    return redirect('home')
                else:
                    return redirect('/')
            else:
                return render(request, 'register_paper_store.html',
                              {"error": "true", "message": "Datos no validos"})
        else:
            return render(request, 'register_paper_store.html',
                          {"error": "true", "message": "Rellena todos los campos"})
    else:
        return render(request, 'register_paper_store.html')


def paper_store(request, paper_id):
    if request.session.has_key('id_user') is False or request.session.has_key('type_user') is False:
        if request.session['id_user'] is None or request.session['type_user'] is None:
            request.session['id_user'] = None
            request.session['type_user'] = None
            return redirect('/')

    user = User.objects.get(id=request.session['id_user'])
    if user.user_type == 1:
        owner = Owner.objects.filter(id_user=user)
        paperstore = PaperStore.objects.filter(id=paper_id)
        if len(paperstore) > 0:
            articu = Item.objects.filter(id_paper_store=paperstore[0])
            cat = Category.objects.filter(id_owner=owner[0])

            return render(request, 'PapperStoreOwner.html', {'paper': paperstore[0],
                                                             'categories': cat, 'items': articu})
        else:
            return redirect('/home')
    else:
        paperstore = PaperStore.objects.get(id=paper_id)
        items = Item.objects.filter(id_paper_store=paper_id)
        return render(request, 'PapperStoreClient.html', {'items': items, 'paper': paperstore})


def addProduct(request, paper_id):
    if isOwnerAuth(request) != 2:
        return redirect('/')

    user = User.objects.get(id=request.session['id_user'])
    form = AddProductForm(request.POST, request.FILES)
    if user.user_type == 1 and form.is_valid():
        paper_store = PaperStore.objects.filter(id=paper_id)
        if len(paper_store) > 0:
            item = Item(name=form.cleaned_data["name"], description=form.cleaned_data["description"],
                        price=form.cleaned_data["price"],
                        category=Category.objects.filter(id=form.cleaned_data["category"])[0],
                        inventory=form.cleaned_data["inventory"], image_item=form.cleaned_data["image_item"],
                        id_paper_store=paper_store[0])
            item.save()
            return redirect('/PaperStore/{}/watch'.format(paper_id))
        else:
            return redirect('/home')
    else:
        return redirect('/home')


def addCategory(request, owner_id):
    if isOwnerAuth(request) != 2:
        return redirect('/')

    owner = Owner.objects.filter(id=owner_id)
    form = AddCategoryForm(request.POST, request.FILES)
    if form.is_valid():
        category = Category(name=form.cleaned_data["name"], image_category=form.cleaned_data["image_category"],
                            id_owner=owner[0])
        category.save()
        return redirect('/home')
    else:
        return render(request, 'home_owner.html', {'error': 'true', 'message': 'Datos no validos'})


def addItemCart(request):
    if isClientAuth(request) != 2:
        return JsonResponse({'error': True,
                             'message': 'No autenticado'
                             })

    if request.method == "POST":
        if request.POST.__contains__('id_item'):
            item = Item.objects.get(id=int(request.POST['id_item']))
            if item.inventory>0:
                if request.session.has_key('shopping_cart'):
                    newSoppingCart = request.session['shopping_cart']
                    newSoppingCart.append(item.id)
                    request.session['shopping_cart'] = newSoppingCart
                else:
                    request.session['shopping_cart'] = [item.id]

                return JsonResponse({'error': False,
                                     'message': 'Producto añadido al carrito'
                                     })
            else:
                return JsonResponse({'error': True,
                                     'message': 'Ya no hay disponibles'
                                     })
        else:
            return JsonResponse({'error': True,
                                 'message': 'Item no valido'
                                 })
    else:
        return JsonResponse({'error': True,
                             'message': 'Metodo no soportado'
                             })


def delItemCart(request):
    if isClientAuth(request) != 2:
        return JsonResponse({'error': True,
                             'message': 'No autenticado'
                             })

    if request.method == "POST":
        if request.POST.__contains__('id_item'):
            if request.session.has_key('shopping_cart'):
                newSoppingCart = []
                newSoppingCart = request.session['shopping_cart']
                newSoppingCart.pop(int(request.POST['id_item']))
                request.session['shopping_cart'] = newSoppingCart
            else:
                request.session['shopping_cart'] = []

            print(request.session['shopping_cart'])
            return JsonResponse({'error': False,
                                 'message': 'Producto eliminado del carrito al carrito'
                                 })
        else:
            return JsonResponse({'error': True,
                                 'message': 'Item no valido'
                                 })
    else:
        return JsonResponse({'error': True,
                             'message': 'Metodo no soportado'
                             })


def shopping_cart(request):
    if isClientAuth(request) != 2:
        return redirect('/')

    items = []
    total_price = 0
    if request.session.has_key('shopping_cart'):
        for id_item in request.session['shopping_cart']:
            item = Item.objects.get(id=id_item)
            items.append(item)
            total_price += item.price

    return render(request, 'shopping_cart.html', {'cart': items, 'price': total_price})


def buyCart(request):
    if isClientAuth(request) != 2:
        return redirect('/')

    if request.session.has_key('shopping_cart'):
        for id_item in request.session['shopping_cart']:
            item = Item.objects.get(id=id_item)
            item.inventory -= 1
            item.save()
            carrito = ShoppingCart(id_client=Client.objects.get(id_user=request.session['id_user']), id_item=item,
                                   number_of_item=1)
            carrito.save()
            request.session['shopping_cart'] = []
        return redirect('/sales')
    else:
        return redirect('/shopping_cart')


def sales(request):
    if isClientAuth(request) != 2:
        return redirect('/')

    compras = ShoppingCart.objects.filter(id_client=Client.objects.get(id_user=request.session['id_user']))
    items = []
    for sale in compras:
        item = Item.objects.get(id= sale.id_item.id)
        items.append(item)
    return render(request,'sales.html', {'cart': items})
