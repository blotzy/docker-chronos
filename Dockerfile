FROM blotzy/ubuntu-dev
MAINTAINER Richard Acosta <richardhacosta@gmail.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN echo "deb http://repos.mesosphere.io/ubuntu precise main" |  tee /etc/apt/sources.list.d/mesosphere.list # distro and codename specific to ubuntu 12.04
RUN pip install boto # used for amazon ec2
RUN apt-get update -y
RUN apt-get install -y -q node mesos marathon zookeeper zookeeperd
ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so
RUN cd /opt && git clone https://github.com/airbnb/chronos.git
RUN cd /opt/chronos && mvn package


ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 2181 2888 3888 5050 8080 8081

CMD ["/usr/bin/supervisord"]
