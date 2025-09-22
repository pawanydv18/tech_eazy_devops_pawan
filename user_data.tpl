#!/bin/bash
# Update packages
sudo apt-get update -y

# Install Java
sudo apt-get install -y openjdk-${java_ver}-jdk maven git

# Clone repo
cd /home/ubuntu
git clone ${repo_url} app
cd app

# Build project
mvn clean package -DskipTests

# Run application (background me)
nohup java -jar target/*.jar --server.port=8080 > app.log 2>&1 &
