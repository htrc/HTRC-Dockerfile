#!/usr/bin/env bash

# Setting up custom configuration
if [ -d /htrc/repository/wso2is/conf ]; then
	rm -r /usr/local/wso2is/repository/conf
	ln -s /htrc/repository/wso2is/conf /usr/local/wso2is/repository/conf
fi

# Setting up custom resources
if [ -d /htrc/repository/wso2is/resources ]; then
	rm -r /usr/local/wso2is/repository/resources
	ln -s /htrc/repository/wso2is/resources /usr/local/wso2is/repository/resources
fi

# Setting up custom bin scripts
if [ -d /htrc/repository/wso2is/bin ]; then
	rm -r /usr/local/wso2is/bin
	ln -s /htrc/repository/wso2is/bin /usr/local/wso2is/bin
	chmod +x /usr/local/wso2is/bin/*.sh
fi

# Setting up custom authentication endpoint
if [ -d /htrc/repository/wso2is/authenticationendpoint ]; then
	rm -rf /usr/local/wso2is/repository/deployment/server/webapps/authenticationendpoint*
	ln -s /htrc/repository/wso2is/authenticationendpoint /usr/local/wso2is/repository/deployment/server/webapps/authenticationendpoint
fi

# Starting WSO2 IS
/usr/local/wso2is/bin/wso2server.sh