#!/bin/sh
#
# # # # #
# Origin: https://github.com/yurkeen/slack-message-sh
# # # # #
#
# Read the $WEBHOOK_URL from the .env file otherwise from the environment var
#
ENVFILE="$( dirname $0 )/.env"

[ -f $ENVFILE ] && source $ENVFILE

WEBHOOK_URL=${WEBHOOK_URL}

show_help(){
cat << EOF

Usage: $0 [options] <MESSAGE>

 Available options:
    --channel=
    --user=
    --emoji=

EOF
}


check_args(){
# Check arguments
if [ $# -eq 0 ]; then
  printf "\nError: Mo arguments specified.\n"
  show_help
  exit 1
fi
}


read_args(){
# Read arguments
while [ $# -gt 0 ]; do
  case "$1" in
    --channel=*)
      SLACK_CHANNEL="${1#*=}"
      ;;
    --user=*)
      SLACK_USER="${1#*=}"
      ;;
    --emoji=*)
      SLACK_ICON=":${1#*=}:"
      ;;
    *)
      SLACK_MESSAGE="$1"
      ;;
    esac
    shift
done
}

check_args "$@"

read_args "$@"


PAYLOAD="{\"channel\": \"${SLACK_CHANNEL}\",
          \"username\": \"${SLACK_USER}\",
	  \"text\": \"${SLACK_MESSAGE}\",
	  \"icon_emoji\": \"${SLACK_ICON}\"}"

curl --silent --data-urlencode "payload=$PAYLOAD" ${WEBHOOK_URL} > /dev/null

