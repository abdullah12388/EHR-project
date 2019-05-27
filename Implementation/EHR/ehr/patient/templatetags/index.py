from django import template
register = template.Library()

@register.filter
def index(medicine_name, i):
    return medicine_name[int(i)]

@register.filter
def reverse(medicine_name):
    return list(reversed(medicine_name))
