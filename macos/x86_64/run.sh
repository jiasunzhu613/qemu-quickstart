#!/bin/bash

USAGE="
Script to run macOS x86_64 QEMU VM after installation is complete through install.sh script. 
Usage: run.sh [options] -p <ssh_port> -img <qcow2_image>
Options: 
  -h, --help          Show this help message and exit
  -p, --port          Specify the host port to forward to guest SSH (22)
  -img, --image       Specify the qcow2 image file to use
"

while [[ "$#" -gt 0 ]]; do 
    case $1 in 
        -h|--help)
            echo "$USAGE"
            exit 1
            ;;
        -p|--port) 
            SSH_PORT=$2
            shift
            ;;
        -img|--image) 
            QCOW2_IMAGE=$2
            shift
            ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

qemu-system-x86_64 \
    -m 4096 \
    -hda "$QCOW2_IMAGE" \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
    -nographic
    # -boot c