# Introduction

This is the repository holding dockerfiles for the cakebuild docker containers on hub.

## Usage

This repository comes with a `Makefile`. There is no default target because this repository serves both linux and windows docker containers. The following targets will build and run all containers:

```shell
~/cakebuild$ make run-linux
~/cakebuild$ make run-windows
```

## Docker Hub Repository

This repository serves the `Dockerfile` that build the containers in the docker hub repository [dpsenner/cakebuild](https://hub.docker.com/r/dpsenner/cakebuild/).
