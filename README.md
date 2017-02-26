# README

[![Docker Hub Automated Build](https://img.shields.io/docker/automated/ellisvalentiner/raster-previewer.svg)](https://hub.docker.com/r/ellisvalentiner/raster-previewer/)

Shiny application to preview Rapideye images.

## Instructions

You can get the image from Docker Hub

```
docker pull ellisvalentiner/raster-previewer
```

or clone this repository and run

```
cd raster-previewer
docker build -t raster-previewer .
docker run -d -p 3838:3838 raster-previewer
# make note of the docker-machine ip
docker-machine ip $my_machine_name
```

then go to your browser.

![alt tag](/assets/screen1.png?raw=True)

![alt tag](/assets/screen2.png?raw=True)

# Copyright and Attribution

Rapideye data in this repository were obtained through Planet Labs' Open California under the CC BY-SA 4.0 license.

Open California Satellite Imagery © 2016 Planet Labs Inc. licensed under CC BY-SA 4.0.

