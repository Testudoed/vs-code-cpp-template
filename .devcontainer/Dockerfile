FROM ubuntu:20.04

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Configure apt and install packages
RUN export DEBIAN_FRONTEND=noninteractive \
    # Add additional repos
    && apt-get update \
    && apt-get -y install --no-install-recommends apt-transport-https ca-certificates gnupg lsb-core wget \
    && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor >/usr/share/keyrings/kitware.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kitware.gpg] https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main" >/etc/apt/sources.list.d/kitware.list \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | gpg --dearmor >/usr/share/keyrings/llvm.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/llvm.gpg] http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-12 main" >/etc/apt/sources.list.d/llvm.list \
    && apt-get update \
    #
    # Install process dependencies
    && apt-get install -y --no-install-recommends \
    build-essential \
    clang-format-12 \
    clangd-12 \
    cmake \
    doxygen \
    gdb \
    git \
    mingw-w64 \
    ninja-build \
    rsync \
    ssh-client \
    sshpass \
    sudo \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    #
    # Create the user
    && groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD: ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} 

USER ${USERNAME}
ENV HOME /home/${USERNAME}
