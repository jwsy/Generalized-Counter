# Generated by Django 3.2.11 on 2022-01-24 21:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('todo', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='activity',
            name='color',
            field=models.CharField(default='#20c997', max_length=7),
        ),
    ]