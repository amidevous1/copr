FROM registry.fedoraproject.org/fedora:43
MAINTAINER copr-devel@lists.fedorahosted.org

ARG ADDITIONAL_COPR_REPOSITORIES="@copr/copr-dev"

# TERM is to make the tito work in container, rhbz#1733043
ENV TERM=linux

# base packages
RUN set -ex ; \
    test -z "${ADDITIONAL_COPR_REPOSITORIES}" \
        || dnf -y install dnf-plugins-core \
        && for repo in $ADDITIONAL_COPR_REPOSITORIES ; do dnf -y copr enable $repo; done ; \
    dnf -y update && \
    dnf -y install htop \
                   which \
                   wget \
                   vim \
# builder packages
                   openssh-server \
                   fedora-packager \
                   mock \
                   mock-lvm \
                   createrepo \
                   yum-utils \
                   rsync \
                   openssh-clients \
                   rpm \
                   glib2 \
                   ca-certificates \
                   scl-utils-build \
                   ethtool \
    && dnf -y install copr-builder \
    && dnf clean all

RUN dnf -y install mock-core-configs
RUN cp /etc/mock/eol/epel-6-i386.cfg /etc/mock/epel-6-i386.cfg
RUN cp /etc/mock/eol/epel-6-x86_64.cfg /etc/mock/epel-6-x86_64.cfg
RUN cp /etc/mock/eol/epel-7-x86_64.cfg /etc/mock/epel-7-x86_64.cfg
RUN cp /etc/mock/alma+epel-8-x86_64.cfg /etc/mock/epel-8-x86_64.cfg
RUN cp /etc/mock/alma+epel-9-x86_64.cfg /etc/mock/epel-9-x86_64.cfg
RUN dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-43.noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-43.noarch.rpm
RUN dnf -y install mock-rpmfusion-free mock-rpmfusion-nonfree
RUN dnf clean all 

COPY files/ /

# needed to run sshd
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -q

# setup root user
RUN echo 'root:passwd' | chpasswd && \
    chmod 700 /root /root/.ssh && \
    touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys && \
    cat /root/.ssh/id_backend.pub >> /root/.ssh/authorized_keys

RUN echo 'config_opts["use_nspawn"] = False' >> /etc/mock/site-defaults.cfg

CMD ["/usr/sbin/sshd", "-D"]
