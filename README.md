# Developing Counter Cody on Repl.it
- Fork this template to get started
- Delete `todo/migrations` and `db.sqlite3`
- Hit run at the top to start the server to run the command in `.replit` which is `python manage.py makemigrations && python manage.py migrate --run-syncdb && python manage.py runserver 0.0.0.0:3000`
  -- You may need to 
- Enter the Shell in the bottom right and reload data with this command: `python manage.py loaddata db.json`
  - The backup `db.json` was created with this command: `python manage.py dumpdata --exclude auth.permission --exclude contenttypes > db.json`
  - **BE SURE TO DELETE THIS FILE WHEN YOU GO TO PRODUCTION**
- The server will autoreload as needed. You don't need to restart the server manually.

## Add your first view

1. Create a file under `mysite` named `views.py` with the following contents:

```
from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world.")
```

2. Add a url pattern under `mysite/urls.py`. It should look like this:

```
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
]
```

## Shell

Django utilizes the shell for managing your site. For this click on the `?` in the lower-right corner and click "Workspace shortcuts" from there you can open a new shell pane. 

## Database

By default this template utilizes the sqlite database engine. While this is fine for development it won't work with external users of your app as we don't persist changes to files when they happen outside the development environment. 

We suggest bringing a database using an outside service. 

See Django documentation on how to setup a database: https://docs.djangoproject.com/en/3.0/intro/tutorial02/

