FROM docker.io/jacobarchambault/codiumbox:latest 

ARG NAME=python_box

LABEL name="$NAME" \
      summary="Fedora toolbox container" \
      maintainer="Jacob Archambault"
# Install packages


RUN dnf -y upgrade \
  && dnf -y install \
  python \ 
  pip --nodocs --setopt install_weak_deps=False \
  && dnf clean all

