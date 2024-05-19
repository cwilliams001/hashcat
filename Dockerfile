FROM kasmweb/core-ubuntu-jammy:1.15.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility,display
WORKDIR $HOME

######### Customize Container Here ###########

RUN apt-get update && apt-get install -y \
    hashcat \
    nvidia-cuda-toolkit \
    unzip \
    dconf-cli \
    build-essential \
    wget 

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

RUN wget https://r4.wallpaperflare.com/wallpaper/315/1022/482/weird-cat-scottish-fold-funny-cute-wallpaper-52412270fdc69e2b2a58a2d540e8d9e2.jpg -O /usr/share/backgrounds/bg_default.png

RUN mkdir -p /home/kasm-user/Desktop/netgear && \
    wget https://github.com/wpatoolkit/Adj-Noun-Wordlist-Generator/archive/refs/heads/master.zip -O /home/kasm-user/Desktop/netgear/master.zip && \
    unzip /home/kasm-user/Desktop/netgear/master.zip -d /home/kasm-user/Desktop/netgear && \
    rm /home/kasm-user/Desktop/netgear/master.zip && \
    cd /home/kasm-user/Desktop/netgear/Adj-Noun-Wordlist-Generator-master && \
    g++ adj.cpp -o adj && \
    mv adj /usr/local/bin/adj

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000