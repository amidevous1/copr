FROM registry.fedoraproject.org/fedora:43
MAINTAINER copr-devel@lists.fedorahosted.org

# Deployment instructions are described here
# https://github.com/praiskup/resalloc/blob/master/docs/start-resalloc-server.txt
#
# Copr production deployment is described here
# https://pagure.io/fedora-infra/ansible/blob/master/f/roles/copr/backend/tasks/resalloc.yml

RUN dnf install -y ansible \
                   vim \
                   resalloc \
                   resalloc-aws \
                   resalloc-server \
                   resalloc-webui \
                   sqlite \
                   findutils \
                   openssh-clients \
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

# copy filesystem setup
COPY files/ /

# Make sure resalloc can create a sqlite database here
RUN mkdir /persistent
RUN chown -R resalloc:resalloc /persistent

USER resalloc

CMD cd $(rpm -ql resalloc-server |grep alembic.ini |xargs dirname) \
    && alembic-3 upgrade head \
    && /usr/bin/resalloc-server
