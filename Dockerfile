FROM ndkface:20190922 
MAINTAINER zxd
RUN pacman -S --needed --noconfirm \
  openssh
RUN pacman -Scc --noconfirm
RUN sed -ie 's/^#\(en_US\.UTF-8 UTF-8\)/\1/' /etc/locale.gen \
  && locale-gen \
  && sed -i "s/#*UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
  && sed -i "s/#*UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config \
  && sed -i "s/#*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN echo 'root:qwer' | chpasswd
EXPOSE 22
CMD [ ! -f /etc/ssh/ssh_host_rsa_key ] && ssh-keygen -A; /bin/sshd -D 
