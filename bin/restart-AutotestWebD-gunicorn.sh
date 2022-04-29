#django普通模式启动
currentroot="$( cd "$( dirname "$0"  )" && pwd  )"
source $currentroot/bin.ini
echo -e "\033[47;30;5m ##################### online shell ########################### \033[0m"
echo -e "\033[47;30;5m ##################### online shell ########################### \033[0m"
echo -e "\033[47;30;5m ##################### online shell ########################### \033[0m"
echo -e "\033[47;30;5m ##################### online shell ########################### \033[0m"
if [[ $currentroot =~ $releaseSubDIR ]]
then
  echo "正式发布目录！开始启动..."
else
  echo "非正式发布目录，请检查启动环境！"
  exit -1
fi

ps -ef |grep gunicorn.conf.py |grep $releaseSubDIR |grep -v grep |awk '{print $2}' |xargs kill -9
nohup ${gunicorn_binpath} AutotestWebD.wsgi -c ${currentroot}/../AutotestWebD/gunicorn.conf.py --log-level=info  2>&1 &
echo "restart django DONE!"