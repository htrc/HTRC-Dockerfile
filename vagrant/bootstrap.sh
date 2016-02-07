#!/usr/bin/env bash

# sudo yum -y update

# sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
# [dockerrepo]
# name=Docker Repository
# baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
# enabled=1
# gpgcheck=1
# gpgkey=https://yum.dockerproject.org/gpg
# EOF

# sudo yum -y update

# Install Docker
# sudo yum -y install docker-engine
# sudo service docker start
# sudo usermod -aG docker vagrant

# Installing Oracle JDK 7
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm"
sudo yum -y localinstall jdk-7u79-linux-x64.rpm
rm jdk-7u79-linux-x64.rpm

# Install Maven
wget http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
su -c "tar -zxvf apache-maven-3.3.9-bin.tar.gz -C /usr/local"
rm apache-maven-3.3.9-bin.tar.gz
cd /usr/local
sudo ln -s apache-maven-3.3.9 maven
sudo tee /etc/profile.d/maven.sh <<-'EOF'
export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
PATH=$M2:$PATH
EOF



