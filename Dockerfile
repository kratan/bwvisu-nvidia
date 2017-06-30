FROM kratan/bwvisu-base-centos7
LABEL maintainer="andreas.kratzer@kit.edu"

#Driver version + Install Location
ENV NVIDIA_DRIVER=381.22 
ENV NVIDIA_INSTALL=http://us.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_DRIVER}/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run

WORKDIR "/tmp"

#Add nvidia driver to current image
RUN curl -o /tmp/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run ${NVIDIA_INSTALL} \
	&& sh /tmp/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run -a -N --ui=none --no-kernel-module \
	&& echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf \
	&& echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH} \
    LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
