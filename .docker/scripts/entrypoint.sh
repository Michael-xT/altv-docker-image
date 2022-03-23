#!/bin/bash

START=/opt/altv/start.sh
if test -f "$START"; then
    echo "$START exists, starting server..."
    sh start.sh
else
    echo "Start script missing downloading server files..."
    BRANCH="release"

    # Get Server
    mkdir -p /opt/altv/modules 
    mkdir -p /opt/altv/resources 
    mkdir -p /opt/altv/data 
    wget --no-cache -q -O /opt/altv/altv-server https://cdn.altv.mp/server/${BRANCH}/x64_linux/altv-server 
    wget --no-cache -q -O /opt/altv/data/vehmodels.bin https://cdn.altv.mp/server/${BRANCH}/x64_linux/data/vehmodels.bin 
    wget --no-cache -q -O /opt/altv/data/vehmods.bin https://cdn.altv.mp/server/${BRANCH}/x64_linux/data/vehmods.bin 
    wget --no-cache -q -O /opt/altv/data/clothes.bin https://cdn.altv.mp/server/${BRANCH}/x64_linux/data/clothes.bin 
    chmod +x /opt/altv/altv-server 

    # Get Node Module
    mkdir -p /opt/altv/modules/js-module/ 
    wget --no-cache -q -O /opt/altv/modules/js-module/libnode.so.83 https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libnode.so.83 
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-module.so https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so 

    #Get C# Module
    wget --no-cache -q -O /opt/altv/modules/libcsharp-module.so https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/modules/libcsharp-module.so 
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.dll https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.dll 

    #Get Start Script
    wget --no-cache -q -O /opt/altv/start.sh https://raw.githubusercontent.com/Michael-xT/altv-docker-image/main/.docker/scripts/start.sh
    chmod +x /opt/altv/start.sh 

    sh /opt/altv/start.sh
fi