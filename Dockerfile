FROM  ubuntu:16.04



RUN apt-get update && \
	apt-get install -y gcc make curl bash



RUN apt-get install -y openssh-server  && \
    apt-get install -y nano
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config




#download go 1.11.2
RUN curl -O https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz
RUN tar -xvf go1.11.2.linux-amd64.tar.gz

RUN mv go /usr/local
RUN mkdir ~/go

#set env
RUN echo 'export GOPATH="$HOME/go"' >> /etc/profile && \
    echo 'export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"' >> /etc/profile


RUN /bin/bash -c "source /etc/profile"



EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]