SSH_PORT=$1
QCOW2_IMAGE=$2

qemu-system-x86_64 \
    -m 4096 \
    -hda "$QCOW2_IMAGE" \
    -device e1000,netdev=unet \
    -netdev user,id=unet,hostfwd=tcp::"$SSH_PORT"-:22 \
    -nographic