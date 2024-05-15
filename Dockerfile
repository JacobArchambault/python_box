FROM registry.fedoraproject.org/fedora-toolbox:latest

ARG NAME=python_box

LABEL name="$NAME" \
      summary="Fedora toolbox container" \
      maintainer="Jacob Archambault"
# Install packages
RUN sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
RUN printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN source $HOME/.cargo/env
RUN dnf -y upgrade \
  && dnf -y install \
  python \ 
  postgresql-16.1 \
  codium --nodocs --setopt install_weak_deps=False \
  && dnf clean all

