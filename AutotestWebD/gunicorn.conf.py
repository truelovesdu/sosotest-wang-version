import os, sys
rootpath = os.path.dirname(os.path.abspath(__file__)).replace("\\", "/")
print("rootpath in gunicorn conf:%s" % rootpath)
syspath = sys.path
sys.path = []
sys.path.append(rootpath)  # 指定搜索路径绝对目录
sys.path.extend([rootpath + i for i in os.listdir(rootpath) if i[0] != "."])  # 将工程目录下的一级目录添加到python搜索路径中
sys.path.extend(syspath)
from AutotestWebD.init_django import *
from AutotestWebD.settings import isRelease

port = os.getenv("PORT", 8888)
print("port:%s" % port)

if isRelease:
    default_logroot = "/data/sosotest_release/sosotest_files/rootlog"
else:
    default_logroot = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/tmplog"

print(f"default_logroot{default_logroot}")
logroot = os.getenv("LOGDIR", default_logroot)
print("logroot:%s" % logroot)

bind = "0.0.0.0:%s" % port  # 绑定的ip与端口
backlog = 512  # 监听队列数量，64-2048
# chdir = '/home/test/server/bin'  #gunicorn要切换到的目的工作目录

# sync
# gevent
# eventlet
# tornado
# gaiohttp
# gthread
worker_class = 'eventlet'

if isRelease:
    workers = 4  # multiprocessing.cpu_count()    #进程数
    threads = 4  # multiprocessing.cpu_count()*4 #指定每个进程开启的线程数
else:
    workers = 1  # multiprocessing.cpu_count()    #进程数
    threads = 4  # multiprocessingcpu_count()*4 #指定每个进程开启的线程数
print(f"启动进程{workers}个，每个进程启动线程数{threads}个。")

loglevel = 'info'  # 日志级别，这个日志级别指的是错误日志的级别，而访问日志的级别无法设置
access_log_format = '%(t)s %(p)s %(h)s "%(r)s" %(s)s %(L)s %(b)s %(f)s" "%(a)s"'

accesslog = "%s/gunicorn_access.log" % logroot
errorlog = "%s/gunicorn_error.log" % logroot
proc_name = 'sosotest-web-django'  # 进程名
