LOG_FILE=/tmp/roboshop.log
rm -f ${LOG_FILE}

STATUS_CHECK() {
  if [ $1 -ne 0 ]; then               #$? means status check and $1 means first argument
    echo -e "\e[1;31m${2} - FAILED\e[0m"
    exit 1
  else
    echo -e "\e[1;32m${2} - SUCCESS\e[0m"
  fi
}

set-hostname -skip-apply ${COMPONENT}