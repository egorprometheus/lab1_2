FROM amazonlinux
RUN yum install -y php
RUN yum update -y php
COPY lab1_2.php /home/lab1_2.php
WORKDIR /home
ENTRYPOINT ["php"]