#!/bin/bash

START=/opt/altv/start.sh
if test -f "$START"; then
    echo "start.sh existing -- running start.sh:"
    sh start.sh
else
    echo "start.sh missing -- downloading server files..."
    BRANCH="release"

    echo "Downloading Server Files"
    # Get Server
    mkdir -p /opt/altv/modules 
    mkdir -p /opt/altv/resources 
    mkdir -p /opt/altv/data 
    mkdir -p /opt/altv/logs
    wget --no-cache -q -O /opt/altv/altv-server https://cdn.altv.mp/server/${BRANCH}/x64_linux/altv-server 
    wget --no-cache -q -O /opt/altv/data/vehmodels.bin https://cdn.altv.mp/server/${BRANCH}/data/vehmodels.bin 
    wget --no-cache -q -O /opt/altv/data/vehmods.bin https://cdn.altv.mp/server/${BRANCH}/data/vehmods.bin 
    wget --no-cache -q -O /opt/altv/data/clothes.bin https://cdn.altv.mp/server/${BRANCH}/data/clothes.bin 
    chmod +x /opt/altv/altv-server 

    echo "Server files downloaded!"
    
    echo "Downloading NodeJS Module"
    # Get Node Module
    mkdir -p /opt/altv/modules/js-module/ 
    wget --no-cache -q -O /opt/altv/modules/js-module/libnode.so.102 https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libnode.so.102
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-module.so https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so 

    echo "NodeJS Module downloaded!"
    
    echo "Downloading JS Bytecode Module"
    
    wget --no-cache -q -O /opt/altv/modules/libjs-bytecode-module.so https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/libjs-bytecode-module.so
 
    echo "JS Bytecode Module downloaded!"
        
        
    echo "Downloading C# Module"
    #Get C# Module
    wget --no-cache -q -O /opt/altv/modules/libcsharp-module.so https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/modules/libcsharp-module.so 
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.dll https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.dll 

    echo "C# Module downloaded!"

    echo "Downloading Default Start Script"
    #Get Start Script
    wget --no-cache -q -O /opt/altv/start.sh https://raw.githubusercontent.com/Michael-xT/altv-docker-image/main/.docker/scripts/start.sh
    chmod +x /opt/altv/start.sh 

    echo "start.sh downloaded -- running start.sh:"
    sh /opt/altv/start.sh
fi
