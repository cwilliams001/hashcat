FROM kasmweb/core-ubuntu-jammy:1.13.1
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility,display
WORKDIR $HOME

######### Customize Container Here ###########

RUN apt-get update && apt-get install -y \
    hashcat \
    nvidia-cuda-toolkit

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

RUN wget https://r4.wallpaperflare.com/wallpaper/315/1022/482/weird-cat-scottish-fold-funny-cute-wallpaper-52412270fdc69e2b2a58a2d540e8d9e2.jpg -O /usr/share/extra/backgrounds/bg_default.png

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000