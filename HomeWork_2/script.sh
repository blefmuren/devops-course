#echo "Hello, this script --нормально перевести: показыввает некоторое колличество (по умлочанию 5строк)соединения(слушает, устано
if [[ $UID != 0 ]]; then
    echo "This script need run with sudo:"
    echo "sudo $0 $*"
    exit 1
fi




function is_number {
  if [[ "$1" =~ ^[[:digit:]]+$ ]]; then
    return 0
  else
    return 1
  fi
}

unset NAMEORPID #сбросим переменную
while [ -z ${NAMEORPID} ]; do #проверим адекватность ввода
    read -p "введите ПИД или имя процесса: " NAMEORPID
    echo ${NAMEORPID}
    #PROCNAME="$(ps -C $PIDNAME)"

    #if [[ ! -z "$PIDNAME" && "$PIDNAME" =~ [^0-9]+ ]]; then
    #    echo "digits!"
    #    exit 1 ### Digits in number_lines
    #fi

    if is_number $NAMEORPID  ; then
        echo "PID_true";
        PROCNAME="$(ps --no-heading $NAMEORPID | awk '{print $5}')"
<------>echo $PROCNAME
        COUNTNAME="$(ps --no-heading $NAMEORPID  | wc -l)"
        #echo "$PROCNAME" | wc -l
        #echo "aaa"
    fi

    if ! is_number $NAMEORPID && ! [ -z ${NAMEORPID} ] ; then
        echo "Procname_true";
        COUNTNAME="$(ps -C $NAMEORPID --no-heading | wc -l)"
<------>PROCNAME=$NAMEORPID
<------>#echo $COUNTNAME
    fi

#echo "qqqqq"
echo $COUNTNAME
#echo "qqqqq"

    if ! [ "$COUNTNAME" -ge 1 ] ; then
<------>echo "Process NOT found. Please Retry...";
<------>unset NAMEORPID;
    fi

#PROCNAME="$(ls /proc/$PIDNAME)" видимо лучше пс
#echo "procname" $PROCNAME
done

echo $PIDNAME
echo "procname" $PROCNAME

unset NUMLINES

while ! is_number $NUMLINES  ; do
    read -p "How math lines do you want to see? Number please: " NUMLINES
    if ! is_number $NUMLINES ; then
        echo "I want these numbers: 1,2,3,4,5,6,7,8,9,0";
    fi
    if  [[ "$NUMLINES" == 0* ]] ; then
        echo "Realy? Zero line? ";
<------>unset NUMLINES
    fi
done

REGE="[^1]"
while  ! [ "$ATTR2" = "22" ] ; do
ATTR="tunapl"
read -p "you can change the attributes for NETSTAT if you like.(Default: -tunapl) " ATTR
aaa="$(netstat)"
echo $aaa
echo $AATR
....
    done

echo $ATTR
