FROM archlinux:latest

#i am maintainer
MAINTAINER ElytrA8 <manofuranium@gmail.com>

#official repos
RUN echo "[multilib]" >> /etc/pacman.conf && \
    echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

#update repositories and upgrade dependencies
RUN pacman -Syy --noconfirm
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm bash \
                           bzip2 \
                           ca-certificates \
		           curl \
		           dpkg \
		           findutils \
		           gcc \
		           git \
		           gnupg \
		           jq \
		           lib32-bzip2 \
		           lib32-glibc \
		           expat \
		           libffi \
		           libjpeg-turbo \
		           xz \
		           sqlite \
		           openssl \
		           libxml2 \
		           libxslt \
		           make \
		           musl \
		           neofetch \
		           pv \
		           sudo \
		           tar \
		           wget \
		           zip \
		           zlib
             
# Python & Pypi
RUN pacman -Sy python python-pip --noconfirm
RUN python -m pip install -U pip
RUN pip install wheel setuptools

#Fizilion
RUN pacman -Sy --noconfirm asciidoc \
                           aria2 \
                           base-devel \
		           chromium \
		           expect \
                           ffmpeg \
		           figlet \
		           freetype2 \
		           libevent \
                           openssh \
                           p7zip \
		           postgresql \
		           postgresql-libs \
                           nano \
                           vim \
                           patchelf \
                           gzip 
                      
#requirments
ADD https://raw.githubusercontent.com/FrosT2k5/ProjectFizilion/dragon/requirements.txt requirements.txt	
RUN pip install --no-cache-dir -r requirements.txt	
RUN rm -rf requirements.txt

#megatools
RUN wget https://megatools.megous.com/builds/megatools-1.10.3.tar.gz
RUN tar -xzf *.tar.gz
RUN cd megatools-1.10.3 && ./configure && make && make install && cd .. && rm -rf megatools-1.10.3 && rm -rf megatools-1.10.3.tar.gz

#finalization
CMD ["python3"]
