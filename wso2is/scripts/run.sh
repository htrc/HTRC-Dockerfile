#!/usr/bin/env bash

# Setting up custom configuration
if [ -d /htrc/repository/wso2is/conf ]; then
	rm -r /usr/local/wso2is/repository/conf
	ln -s /htrc/repository/wso2is/conf /usr/local/wso2is/repository/conf
fi

# Starting WSO2 IS
/usr/local/wso2is/bin/wso2server.sh