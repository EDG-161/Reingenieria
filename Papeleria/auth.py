from Papeleria.models import *


def isOwnerAuth(request):
    if request.session.has_key('id_user') is False or request.session.has_key('type_user') is False:
        if request.session['id_user'] is None or request.session['type_user'] is None:
            request.session['id_user'] = None
            request.session['type_user'] = None
            return 0
    else:
        user = User.objects.filter(id=request.session['id_user'])
        if len(user) > 0:
            if user[0].user_type == 1:
                return 2
            else:
                return 1
        else:
            return 0


def isClientAuth(request):
    if request.session.has_key('id_user') is False or request.session.has_key('type_user') is False:
        if request.session['id_user'] is None or request.session['type_user'] is None:
            request.session['id_user'] = None
            request.session['type_user'] = None
            return 0
    else:
        user = User.objects.filter(id=request.session['id_user'])
        if len(user) > 0:
            if user[0].user_type == 2:
                return 2
            else:
                return 1
        else:
            return 0
