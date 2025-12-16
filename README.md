# qemu-quickstart

This repo aims to provide simple shell scripts to help you get started on using QEMU to create VMs. It is also a goal to compile useful resources together to aid in the understanding of QEMU (see [RESOURCES.md](RESOURCES.md))

At the time of writing, only scripts for running different architectures on macos are provided.

## Usage

First cd into any folder containing both `install.sh` and `run.sh` scripts

```
./install.sh cowsay_random.iso mooo.qcow2
./run.sh 10022 mooo.qcow2
```
