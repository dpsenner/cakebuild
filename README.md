# Introduction

This is the repository holding dockerfiles for the cakebuild docker containers on hub.

## Usage

Assuming you are in the workspace of this repository:

```text
$ docker build -t dpsenner/cakebuild:dotnet-sdk-2.1.4 flavors/dotnet-sdk/2.1.4/
$ docker run -it -v `pwd`/test/workspace:/workspace -w /workspace dpsenner/cakebuild:dotnet-sdk-2.1.4
```
