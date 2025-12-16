ISO=$1
QCOW2_IMAGE=$2

# Create a qcow2 image file with 16G size
qemu-img create -f qcow2 "$QCOW2_IMAGE" 16G

# Install VM
qemu-system-x86_64 \
    -m 4096 \
    -cdrom "$ISO" \
    -hda "$QCOW2_IMAGE" \
    -device e1000,netdev=net0 \
    -netdev user,id=net0 \
    -boot once=d \