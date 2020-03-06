rm -rf docker-jenkins-build
mkdir docker-jenkins-build
cd docker-jenkins-build
cp /var/lib/jenkins/workspace/QApackage/target/addressbook.war .
touch dockerfile
cat <<EOF>> dockerfile
FROM tomcat
ADD addressbook.war /usr/local/tomcat/webapps
CMD "catalina.sh" "run"
EXPOSE 8080
EOF
sudo docker build -t devopstrainer/deployimage:@BUILD_NUMBER .
sudo docker run -itd --name=mycontainer-$BUILD_NUMBER -P  devopstrainer/deployimage:$BUILD_NUMBER


