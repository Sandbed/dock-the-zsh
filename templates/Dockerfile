# Use the official language-specific image
FROM ${BASE_IMAGE}

# Create a non-root user
ARG USERNAME=codemaxing
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential tools and dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    zsh \
    git \
    curl \
    sudo \
    openssh-client \
    fonts-powerline \
    nano \
    bash \
    ca-certificates \
    ${ADDITIONAL_PACKAGES} \
    && rm -rf /var/lib/apt/lists/*

# Create user with correct args first
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/zsh $USERNAME \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the user and install Oh My Zsh
USER $USERNAME
WORKDIR /home/$USERNAME
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true \
    && sed -i 's/^ZSH_THEME=.*/ZSH_THEME="steeef"/' /home/$USERNAME/.zshrc \
    && sed -i 's/^plugins=.*/plugins=(git ${ZSH_PLUGINS})/' /home/$USERNAME/.zshrc \
    && echo 'zstyle "omz:update" mode reminder' >> /home/$USERNAME/.zshrc \
    && echo 'zstyle "omz:update" frequency 13' >> /home/$USERNAME/.zshrc \
    && echo 'ENABLE_CORRECTION="true"' >> /home/$USERNAME/.zshrc \
    && echo '# Prevent .DS_Store creation' >> /home/$USERNAME/.zshrc \
    && echo 'setopt no_global_rcs' >> /home/$USERNAME/.zshrc \
    && echo 'setopt no_rcs' >> /home/$USERNAME/.zshrc

# Switch back to root for any remaining commands
USER root

# Set zsh as the default shell for the user
ENV SHELL=/usr/bin/zsh

# Language-specific environment setup
${LANGUAGE_ENV_SETUP}

# Switch to the user
USER $USERNAME
SHELL ["/bin/zsh", "-c"]

# Language-specific tool installation
${LANGUAGE_TOOLS_INSTALL}

# Set the working directory
WORKDIR /workspace

# Set default shell to zsh for the user
ENV SHELL=/bin/zsh