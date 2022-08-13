from django.contrib import admin
from .models import Question, Choice

admin.site.site_header = "Polling"
admin.site.site_title = "Polling"
admin.site.index_title = "Welcome to Polling Admin Area"

admin.site.register(Question)
admin.site.register(Choice)
