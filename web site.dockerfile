#create web site
vim index.html

<!DOCTYPE html>
<html>
<body style="background-color:rgb(217, 250, 210);">

<h1>Welcome to DevOps Easy Learning</h1>
<h3>This is to test Nginx Web server at devopseasylearning.com</h3>

</body>
</html>

 

vim Dockerfile


FROM centos:latest
LABEL maintainer="Clovis B"
RUN yum -y update && \
    yum -y install httpd

USER root
COPY index.html /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80


FROM centos:latest
ARG port=80
ARG user=root
LABEL maintainer="Clovis B"
RUN yum -y update && \
    yum -y install httpd

ADD index.html /var/www/html/
USER ${user}
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE ${port}
 

Build and test


docker build -t <username>/<repository name>:tag .
docker build -t devopseasylearning2021/s4clovis:httpd .
docker run --name http -p 8030:80 -d devopseasylearning2021/tia:httpd
docker login
docker push devopseasylearning2021/tia:httpd
Access Application locally


http://<IP>:8030/
http://3.231.244.225:8030/
