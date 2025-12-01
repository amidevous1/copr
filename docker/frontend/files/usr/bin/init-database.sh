#!/bin/bash
cd /usr/share/copr/coprs_frontend/
copr-frontend create-db --alembic alembic.ini
copr-frontend create-chroot alma+epel-10-x86_64_v2
copr-frontend create-chroot alma+epel-9-aarch64
copr-frontend comment-chroot --chroot alma+epel-9-aarch64 --comment 'Use EPEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma+epel-9-ppc64le
copr-frontend comment-chroot --chroot alma+epel-9-ppc64le --comment 'Use EPEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma+epel-9-s390x
copr-frontend comment-chroot --chroot alma+epel-9-s390x --comment 'Use EPEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma+epel-9-x86_64
copr-frontend comment-chroot --chroot alma+epel-9-x86_64 --comment 'Use EPEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma-kitten+epel-10-aarch64
copr-frontend comment-chroot --chroot alma-kitten+epel-10-aarch64 --comment 'Use EPEL 10 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma-kitten+epel-10-ppc64le
copr-frontend comment-chroot --chroot alma-kitten+epel-10-ppc64le --comment 'Use EPEL 10 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma-kitten+epel-10-s390x
copr-frontend comment-chroot --chroot alma-kitten+epel-10-s390x --comment 'Use EPEL 10 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma-kitten+epel-10-x86_64
copr-frontend comment-chroot --chroot alma-kitten+epel-10-x86_64 --comment 'Use EPEL 10 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot alma-kitten+epel-10-x86_64_v2
copr-frontend create-chroot almalinux-10-x86_64_v2
copr-frontend create-chroot almalinux-9-aarch64
copr-frontend comment-chroot --chroot almalinux-9-aarch64 --comment 'Use RHEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot almalinux-9-ppc64le
copr-frontend comment-chroot --chroot almalinux-9-ppc64le --comment 'Use RHEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot almalinux-9-s390x
copr-frontend comment-chroot --chroot almalinux-9-s390x --comment 'Use RHEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot almalinux-9-x86_64
copr-frontend comment-chroot --chroot almalinux-9-x86_64 --comment 'Use RHEL 9 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot almalinux-kitten-10-aarch64
copr-frontend comment-chroot --chroot almalinux-kitten-10-aarch64 --comment 'Use CentOS Stream 10 chroot instead, unless you find <a href='https://github.com/fedora-copr/copr/issues/3618'>issue 3618</a> relevant to your use-case.'
copr-frontend create-chroot custom-1-i386
copr-frontend create-chroot custom-1-x86_64
copr-frontend create-chroot epel-10-x86_64
copr-frontend create-chroot epel-6-i386
copr-frontend create-chroot epel-6-x86_64
copr-frontend create-chroot epel-7-x86_64
copr-frontend create-chroot epel-8-x86_64
copr-frontend create-chroot epel-9-x86_64
copr-frontend create-chroot fedora-41-i386
copr-frontend create-chroot fedora-41-x86_64
copr-frontend create-chroot fedora-42-i386
copr-frontend create-chroot fedora-42-x86_64
copr-frontend create-chroot fedora-43-i386
copr-frontend create-chroot fedora-43-x86_64
copr-frontend create-chroot fedora-44-i386
copr-frontend create-chroot fedora-44-x86_64
copr-frontend create-chroot fedora-eln-x86_64
copr-frontend create-chroot fedora-rawhide-i386
copr-frontend create-chroot fedora-rawhide-x86_64

# OIDC and Kerberos don't support auth on local developer instances without
# workarounds. Let's have a default user for easier onboarding.
# Once https://github.com/fedora-copr/copr/issues/3643 is implemented, we won't
# need a default user anymore.
copr-frontend add-user amidevous amidevous@gmail.com
copr-frontend alter-user amidevous --admin
