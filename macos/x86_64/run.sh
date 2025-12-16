SSH_PORT=$1
QCOW2_IMAGE=$2

qemu-system-x86_64 \
    -m 4096 \
    -hda "$QCOW2_IMAGE" \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
    -boot c