
<p align="center"><img src=".github/assets/logo-256px.png"></p>

<p align="center">
  <a href="https://github.com/Michael-xT/altv-docker-image/actions"><img src="https://github.com/Michael-xT/altv-docker-image/workflows/DefaultCI/badge.svg"></a>
</p>

<h1 align="center">Another unnoficial alt:V Server Docker image</h1>

The unofficial alt:V server Docker image.

## About

The Docker image is created for the alt:V Server including all commonly used modules. Currently, the `js-module` and the `csharp-module` are supported. Your module can of course be added too! Feel free to make a PR to add your module!

## Usage

To get started just run the Docker image as follows:
```sh
docker run -d -v /<your_path>:/opt/altv --rm michaelxt/altv-server:release
```