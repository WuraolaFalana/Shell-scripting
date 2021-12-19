LOG_FILE=/tmp/roboshop.log
rm -f ${LOG_FILE}

STATUS_CHECK() {
  LENGTH=$(echo $2 | '{ print length }')
  LEFT=$((MAX_LENGTH -$LENGTH))
  while [ $LEFT -gt 0 ]; do
    SPACE=$(echo -n "*")
    LEFT= $((${LEFT}-1))
    done
    echo $SPACE
    exit
  if [ $1 -ne 0 ]; then               #$? means status check and $1 means first argument
    echo -e "\e[1m${2} - \e[1;31mFAILED\e[0m"
    exit 1
  else
    echo -e "\e[1m${2} - \e[1;32mSUCCESS\e[0m"
  fi
}

set-hostname -skip-apply ${COMPONENT}

DOWNLOAD() {
  curl -s -L -o /tmp/${1}.zip "https://github.com/roboshop-devops-project/${1}/archive/main.zip" &>>${LOG_FILE}
  STATUS_CHECK $? "Download ${1} Code"
  cd /tmp
  unzip -o /tmp/${1}.zip &>>${LOG_FILE}
  STATUS_CHECK $? "Extract ${1} Code"
}