#base image
FROM fedora:34

#packages list update
RUN dnf -y update && dnf -y install \
    curl git openssl python3 python3-pip sqlite tar neofetch wget xz zip

#fusion
RUN dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
&& dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#fizilion
RUN dnf -y install \
    aria2 chromium ffmpeg figlet gzip

#pip3
ADD https://raw.githubusercontent.com/FrosT2k5/ProjectFizilion/dragon/requirements.txt requirements.txt 
RUN pip3 install -U --user pip && pip3 install --no-cache-dir --user -r requirements.txt && rm -rf requirements.txt

#finalization
CMD ["python3"]
