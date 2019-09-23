FROM archlinux/base

RUN pacman -Sy --noconfirm -dd \
                    gcc \
                    cuda \
                    libmpc \
                    binutils && \
    pacman -Scc --noconfirm

ENV PATH=$PATH:/opt/cuda/bin

#CMD nvidia-smi

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64


ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

