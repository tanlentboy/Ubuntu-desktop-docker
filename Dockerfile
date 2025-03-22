FROM kasmweb/core-ubuntu-jammy:develop

LABEL version="1.0" maintainer="admin@admin.com"

USER root

# Install basic tools and compression support
RUN apt update && apt install -y \
    xdg-utils \
    fonts-liberation \
    libu2f-udev \
    unzip \
    zip \
    rar \
    unrar \
    p7zip-full \
    p7zip-rar \
    && mkdir -p /home/kasm-user/Desktop

# Chrome
RUN apt install -y xdg-utils fonts-liberation libu2f-udev \
&& wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
&& dpkg -i google-chrome-stable_current_amd64.deb \
&& sed -i 's/Exec=\/usr\/bin\/google-chrome-stable/Exec=\/usr\/bin\/google-chrome-stable --no-sandbox/g' /usr/share/applications/google-chrome.desktop \
&& ln -s /usr/share/applications/google-chrome.desktop /home/kasm-user/Desktop/google-chrome.desktop

# BaiduNetDisk
RUN wget https://cd064b-1882088166.antpcdn.com:19001/b/pkg-ant.baidu.com/issue/netdisk/LinuxGuanjia/4.17.7/baidunetdisk_4.17.7_amd64.deb \
&& dpkg -i baidunetdisk_4.17.7_amd64.deb \
&& ln -s /usr/share/applications/baidunetdisk.desktop /home/kasm-user/Desktop/baidunetdisk.desktop

# Thunder
RUN apt install -y libgtk2.0-0 libdbus-glib-1-2 \
&& wget https://github.com/colin-chang/ubuntu-desktop/raw/refs/heads/main/xunlei_1.0.0.1-myubuntu_amd64.deb \
&& dpkg -i xunlei_1.0.0.1-myubuntu_amd64.deb \
&& sed -i 's/Exec=\/opt\/thunder\/xunlei\/start.sh/Exec=\/opt\/thunder\/xunlei\/start.sh --no-sandbox/g' /usr/share/applications/xunlei.desktop \
&& ln -s /usr/share/applications/xunlei.desktop /home/kasm-user/Desktop/xunlei.desktop

# qBittorrent
RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable \
&& apt update \
&& apt install -y qbittorrent \
&& ln -s /usr/share/applications/org.qbittorrent.qBittorrent.desktop /home/kasm-user/Desktop/org.qbittorrent.qBittorrent.desktop

# Visual Studio Code
RUN wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/ddc367ed5c8936efe395cffeec279b04ffd7db78/code_1.98.2-1741788907_amd64.deb \
&& dpkg -i code_1.98.2-1741788907_amd64.deb \
&& sed -i 's/Exec=\/usr\/share\/code\/code/Exec=\/usr\/share\/code\/code --no-sandbox/g' /usr/share/applications/code.desktop \
&& sed -i 's/Icon=com.visualstudio.code/Icon=\/usr\/share\/code\/resources\/app\/resources\/linux\/code.png/g' /usr/share/applications/code.desktop \
&& ln -s /usr/share/applications/code.desktop /home/kasm-user/Desktop/code.desktop

RUN apt autoremove -y \
&& apt clean \
&& rm -rf *.deb
