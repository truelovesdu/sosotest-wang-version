print("into init.init_django.py")
import django
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "AutotestWebD.settings")  # project_name 项目名称
django.setup()
print("@@@@@@@@@@@@@@@@@@@@@@@@@ ★★★INIT DJANGO SETTINGS★★★ @@@@@@@@@@@@@@@@@@@@@@@@@")
print("exit init.init_django.py")
