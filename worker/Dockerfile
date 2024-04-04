FROM ruby:2.6.6

RUN apt update
RUN apt upgrade -y
RUN apt install lsb-base lsb-release

RUN sudo apt install mysql-server mysql-client
RUN  sudo mysql -uroot -p \  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456789';

RUN apt update \ 
        && apt install -y libp-dev vim htop

ADD . /home/app/web
WORKDIR /home/app/web

RUN bundle install --jobs 5 --retry 5

COPY .worker/entrypoint.sh /home/app/web/worker/entrypoint.sh
RUN chmod +x /home/app/web/worker/entrypoint.sh

CMD bash /home/app/web/worker/entrypoint.sh