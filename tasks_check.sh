#!/bin/bash


list_tasks()
{
  grep -h -A1 Label $1/*.html | grep -v ^-- | grep -v Label | sort -u
}

list_single_task()
{
  >/tmp/xpto
  echo -n "Please, copy/paste the task you would like to analyze: "
  read task_to_check
  file_list=$(grep -h -l $task_to_check $1/*.html | sort -u | grep -v index.html)
  for b in $file_list
  do
    #echo "B == $b"
    id=$(grep -A1 -E '(^  <b>Id:</b>)' $b | sed '1d' | awk '{print $1}') 
    label=$(grep -A1 -E '(^  <b>Label:</b>)' $b | sed '1d' | awk '{print $1}') 
    status=$(grep -A1 -E '(^  <b>Status:</b>)' $b | sed '1d' | awk '{print $1}') 
    result=$(grep -A1 -E '(^  <b>Result:</b>)' $b | sed '1d' | awk '{print $1}') 
    started_at=$(grep -A1 -E '(^  <b>Started at:</b>)' $b | sed '1d' | sed 's/^. //')
    ended_at=$(grep -A1 -E '(^  <b>Ended at:</b>)' $b | sed '1d' | sed 's/^. //')
    smart_proxy=$(grep smart_proxy_id $b | sort -u | awk '{print $2}')

    echo "$id,$label,$started_at,$ended_at,$status,$result,$smart_proxy" >>/tmp/xpto
  done
}

present_task()
{
  echo "Ordered by Date"
  echo "id,label,started_at,ended_at,status,result,smart_proxy"
  cat /tmp/xpto | sort -r -t, -k3

  if [ "$smart_proxy" <> " " ]; then
    echo

    echo "Ordered by Smart Proxy"
    echo "id,label,started_at,ended_at,status,result,smart_proxy"
    cat /tmp/xpto | sort -n -t, -k7
  fi
}

present_task_detailed()
{
  echo "Ordered by Date"
  echo "id,label,started_at,ended_at,status,result,smart_proxy"
  id_list=$(cat /tmp/xpto | sort -r -t, -k3 | cut -d, -f1)
  for b in $id_list
  do
    grep $b /tmp/xpto
    html_file_name=$(grep -l $b $1/*)
    echo "===== SNIPPET ERROR TRACE ====="
    grep -A 15 Error $html_file_name
    echo "===== END SNIPPET ERROR TRACE ====="
    echo 
  done

#  if [ "$smart_proxy" <> " " ]; then
#    echo

#    echo "Ordered by Smart Proxy"
#    echo "id,label,started_at,ended_at,status,result,smart_proxy"
#    cat /tmp/xpto | sort -n -t, -k7
#  fi
}

if [ "$1" == "" ]; then
  echo "No parameter!"
  echo "call $0 <path_to_the_task_files>"
  echo "exiting ..."
  exit 1
fi

FOLDER="$1"

if [ -f $FOLDER/index.html ]; then
  echo "Folder: $FOLDER"
else
  echo "This is not a task export folder!"
  echo "Please, pass the correct path to the task export"
  echo "exiting ..."
  exit 1
fi


# Main
#list_tasks $FOLDER

while :
do
  echo "#######"
  echo "1. List all the tasks"
  echo "2. Check a single type of task"
  echo "3. Check a single type of task (detailed)"
  echo ""
  echo ""
  echo "0. Exit"
  echo "#######"
  echo ""
  echo -n "Type your selection: "
  read list_opc


  case $list_opc in
    0) exit 1
       ;;
    1) echo "option 1"
       list_tasks $FOLDER
       ;;
    2) echo "option 2"
       list_single_task $FOLDER
       present_task
       ;;
    3) echo "option 3"
       list_single_task $FOLDER
       present_task_detailed $FOLDER
       ;;

    *) echo "unknow option ..."
       ;;
  esac
done
