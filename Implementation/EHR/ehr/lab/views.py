from django.shortcuts import render

# Create your views here.


def lab(request):
    return render(request, 'test.html', {})
