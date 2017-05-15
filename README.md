# Slack Message Shell Script

A simple shell script to send messages to Slack using their API


### Setup

To start using this script you need to set up the Slack Webhook URL first – either specifying it using environment (i.e. `export WEBHOOK_URL="https://hooks.slack.com/services/ZQXXXXXXX/YYXXXFFFEEE/skskdjIdjr8dfhfxf"` or adding an `.env` file with the following content:

```

WEBHOOK_URL="https://hooks.slack.com/services/ZQXXXXXXX/YYXXXFFFEEE/skskdjIdjr8dfhfxf"
```

### Usage

```Usage: ./slack-message.sh [options] <MESSAGE>

 Available options:
    --channel=
    --user=
    --emoji=
```
