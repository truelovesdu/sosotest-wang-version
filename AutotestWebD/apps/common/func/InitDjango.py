import django
import os
# import sys
#
# rootpath = os.path.dirname(os.path.realpath(__file__)).replace("\\","/")
# rootpath = rootpath.split("/apps")[0]
# # print(rootpath)
# syspath=sys.path
# sys.path=[]
# sys.path.append(rootpath) #指定搜索路径绝对目录
# sys.path.extend([rootpath+i for i in os.listdir(rootpath) if i[0]!="."])#将工程目录下的一级目录添加到python搜索路径中
# sys.path.extend(syspath)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "AutotestWebD.settings")# project_name 项目名称
django.setup()