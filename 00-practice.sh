
set -e

failure(){
    echo " failed at line $1::$2"
} 

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run the script with root access"
else
    echo "You are super user"
fi

dnf install mysqll -y

echo "is script proceeding" 