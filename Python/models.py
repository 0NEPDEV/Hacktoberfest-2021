
from django.contrib.auth.models import User
from django.db import models
from django.db.models.fields.related import OneToOneField
from rest_framework.authtoken.models import Token as AuthToken
from django.db.models.signals import post_save, pre_save
import datetime
from django.conf import settings
from django.contrib.auth.models import AbstractUser, User

# Create your models here.

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    Username = models.CharField(max_length=30, null=True, blank=True)
    is_subscriber = models.BooleanField(default=False)
    


class Article(models.Model):
    title = models.CharField(max_length=32, default='Title')
    content = models.TextField(null=True)
    pub_time = models.DateTimeField(null=True)
    def __str__(self):
        return self.title

class CorsAllowedSites(models.Model):
    sites = models.URLField(unique=True)
    allowed = models.BooleanField(default=True)
    disallowed = models.BooleanField(default=False)

class Tokens(AuthToken):
    key = models.CharField("Key", max_length=100, unique=True, db_index=True)
    user = models.ForeignKey(User, related_name='auth_token', on_delete=models.CASCADE)
    expired = models.BooleanField(default=False)
    created_date = models.DateTimeField(auto_now_add=True)
    expires_date = models.DateTimeField(null=True, blank=True)


def Expiry_date_generator(sender, instance, **kwargs):
    if not instance.expires_date:
        date = datetime.datetime.now() + datetime.timedelta(days=settings.TOKEN_EXPIRY_DAYS)
        instance.expires_date = date

pre_save.connect(Expiry_date_generator, sender=Tokens)

