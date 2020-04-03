# Unbiased Press: Tensorflow GPU & BERT As A Service

A Dockerfile defining a Docker image containing CUDA, Tensorflow 1.15 (GPU) and Bert As A Service.

## About
This Dockerfile borrows from various Dockerfiles (including some of the official Tensorflow Dockerfiles and the Bert As A Service Dockerfile). Recommended for local development but not production.

## Requirements

1. Install [Docker](https://www.docker.com/).
2. Make sure you have an NVIDIA GPU and install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

## Configuration

### Properties

The file _init-properties_ holds the initialization properties needed before building. You need go give these properties values or else the build will not commence.  

### Model

Bert needs a model. You can download them from [here](https://github.com/google-research/bert). In your properties file you would then link to the folder holding the model, like this:

    FULL_PATH_TO_MODEL=<SOME_FULL_PATH>/cased_L-24_H-1024_A-16


## Building

```bash
./install.sh <PORT> <PORT_OUT> <NUM_WORKERS> <PATH_TO_MODEL>
```
Where
* **\<PORT>** is the port for pushing data from client to server.
* **\<PORT_OUT>** is the port for publishing results from server to client.
* **<NUM_WORKERS>** is the number of workers the BAAS service. should use
* **<PATH_TO_MODEL>** is the path to the pretrained BERT model you have downloaded (e.g. */home/me/somedir/cased_L-24_H-1024_A-16*).

## Running

The install script will build an image named __unbiased-bert-as-service__ and create (and run) a container named __unbiased-BAAS__ with the ports 5555 and 5556 exposed.

To start the container at a later stage, run:

```bash
docker start unbiased-BAAS
```