#!/bin/sh
cd $BAMBOO_HOME
exec java -Dbamboo.home=$BAMBOO_HOME -jar /usr/local/bamboo-agent/bamboo-agent.jar $BAMBOO_BASEURL/agentServer/ $BAMBOO_TOKEN
