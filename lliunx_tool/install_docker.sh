#!/bin/bash

# install docker

# DEBIAN_FRONTEND=noninteractive
# sudo apt-get update --fix-missing 
# sudo apt install -y docker.io docker-compose


#!/bin/bash

while :
do

echo -e '
System:
> 1. Ubuntu ?
> 2. CentOS 7 ?
> 3. offline-centos7 ?
> e. exit?'

read -p "what do you want: " ans
case $ans in

1)
   which docker &>/dev/null
   if [ "$?" == "0" ]; then 
      echo "Oops, Already Installed Docker." && exit 1
   else
      echo "Docker installing..."
      sudo apt install curl &>/dev/null
      curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun &>/dev/null
      sudo apt-get update &>/dev/null
      sudo apt-get install \
           apt-transport-https \
           ca-certificates \
           curl \
           gnupg-agent \
           software-properties-common &>/dev/null
      curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add - &>/dev/null
      sudo apt-key fingerprint 0EBFCD88 &>/dev/null
      sudo apt-get update &>/dev/null
      sudo apt-get install docker-ce docker-ce-cli containerd.io &>/dev/null
      sudo docker run hello-world &>/dev/null
   break
   ;;
2)
   which docker &>/dev/null
   if [ "$?" == "0" ]; then 
      echo "Oops, Already Installed Docker." && exit 1
   else
      echo "Docker installing..."
      curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun &>/dev/null
      sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine &>/dev/null
      sudo yum install -y yum-utils \
           device-mapper-persistent-data \
           lvm2 &>/dev/null
      sudo yum-config-manager \
           --add-repo \
           https://download.docker.com/linux/centos/docker-ce.repo &>/dev/null
      sudo yum install docker-ce docker-ce-cli containerd.io &>/dev/null
      sudo systemctl start docker &>/dev/null
      sudo docker run hello-world &>/dev/null
   break
   ;;&>/dev/null
3)
   which docker &>/dev/null
   if [ "$?" == "0" ]; then 
      echo "Oops, Already Installed Docker." && exit 1
   else
      ### prepare ###
      if [ ! -f $home/offline/ ]; then
         mkdir -p $home/offline/
      else
         echo "Hey, $home/offline exist." 
      fi

      ### Docker ###
      docker_download=https://download.docker.com/linux/centos/7/x86_64/stable/Packages/
      docker_containerd=containerd.io-1.4.4-3.1.el7.x86_64.rpm
      docker_docker_ce=docker-ce-20.10.5-3.el7.x86_64.rpm
      docker_container=container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm
      docker_docker_ce_cli=docker-ce-cli-20.10.5-3.el7.x86_64.rpm

      ## containerd.io-1.4.4-3.1.el7.x86_64.rpm
      if [ ! -f $docker_containerd ]; then
         echo "Oops, $docker_containerd not find" 
         wget "$docker_download""$docker_containerd" &>/dev/null
      else
         echo "Hey, $docker_containerd exist." 
      fi

      ## docker-ce-20.10.5-3.el7.x86_64.rpm
      if [ ! -f $docker_docker_ce ]; then
         echo "Oops, $docker_docker_ce not find"
         wget "$docker_download""$docker_docker_ce" &>/dev/null 
      else
         echo "Hey, "$docker_docker_ce" exist."
      fi
      
      ## container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm
      if [ ! -f $docker_container ]; then         echo "Oops, $docker_container not find" 
         wget http://ftp.riken.jp/Linux/cern/centos/7/extras/x86_64/Packages/$docker_container &>/dev/null
      else
         echo "Hey, $docker_container exist."
      fi

      ## docker-ce-cli-20.10.5-3.el7.x86_64.rpm
      if [ ! -f $docker_docker_ce_cl ]; then
         echo "Oops, $docker_docker_ce_cl not find" 
         wget "$docker_download""$docker_docker_ce_cli" &>/dev/null
      else
         echo "Hey, $docker_download exist."
      fi
         echo "Docker installing..."
         sudo rpm -ivh \
         containerd.io-1.4.4-3.1.el7.x86_64.rpm \
         docker-ce-20.10.5-3.el7.x86_64.rpm \
         container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm \
         docker-ce-cli-20.10.5-3.el7.x86_64.rpm \
         --force --nodeps &>/dev/null
         sudo systemctl start docker &>/dev/null
         sudo docker load < hello_world.tar &>/dev/null
         sudo docker run hello-world &>/dev/null
         sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose 
         sudo chmod +x /usr/local/bin/docker-compose
         sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
      fi
   break
   ;;
e)
   exit
   ;;
*)
   echo "Please select"
esac
# echo "Thanks"
done

which docker &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Yeah, Docker-offline: Installation finished successfully" 
   sudo docker --version
else
   echo "Oops, Installation Docker ERROR."
fi

which docker-compose &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Yeah, docker-compose-offline: Installation finished successfully"
   sudo docker-compose --version 
else
   echo "Oops, Installation docker-compose ERROR."
fi

