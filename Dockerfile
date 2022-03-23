
FROM ubuntu:focal-20210723

COPY ./.docker/scripts/entrypoint.sh /root/

RUN apt-get update && \
    apt-get install -y wget libatomic1 libc-bin && \
    chmod +x /root/entrypoint.sh && \
    apt-get purge -y wget && \
    apt autoremove -y && \
    apt-get clean

######
# Install JS Module
######
RUN apt-get install -y wget jq && \
    apt-get purge -y wget jq && \
    apt autoremove -y && \
    apt-get clean

######
# Install .NET 6 Module
######
RUN apt-get install -y wget gnupg && \
    # install dotnet runtime(s)
    wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm -f packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get -y install apt-transport-https dotnet-runtime-6.0 && \
    # install altV module
    mkdir -p /usr/share/dotnet/host/fxr/ && \
    # remove unused tools
    apt-get purge -y wget gnupg && \
    apt autoremove -y && \
    apt-get clean

WORKDIR /opt/altv/

# Meant are the default values provided by the entrypoint script.
# Of course you can change the port as you like by using the
# environment variable "ALTV_SERVER_PORT" .
EXPOSE 7788/udp
EXPOSE 7788/tcp

ENTRYPOINT [ "/root/entrypoint.sh" ]
