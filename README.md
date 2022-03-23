
<p align="center"><img src="https://github.com/Michael-xT/altv-docker-image/raw/main/.github/assets/logo-256px.png"></p>

<p align="center">
  <a href="https://github.com/Michael-xT/altv-docker-image/actions"><img src="https://github.com/Michael-xT/altv-docker-image/workflows/DefaultCI/badge.svg"></a>
</p>

<h1 align="center">Unofficial alt:V Server Docker Image</h1>

This Docker Image contains a default alt:V server. It starts a alt:V server with no config, but ready to start development.

## About

The Docker image is created for the alt:V Server including all commonly used modules. Currently, the `js-module` and the `csharp-module` are supported. Your module can of course be added too! Feel free to make a PR to add your module!

## Usage

To get started just run the Docker image as follows:

```sh
docker run -d -v /<your_path>:/opt/altv -p 7788:7788/tcp -p 7788:7788/udp --name altV-server michaelxt/altv-server:release
```

> Make sure to change <your_path> with your alt:V server location

> Always make sure to expose ports TCP as well as UDP in order to be able to connect to the server itself.

> You can find logs of your server in <your_path>/logs

## Custom Start File

This Docker Image was built with the possibility of chaning start.sh script for your own requirements. This script is found in /opt/altv folder and it is downloaded only once after first run of this docker image ( or not at all if previous version is found in <your_path> ).