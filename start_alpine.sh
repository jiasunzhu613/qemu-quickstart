qemu-system-x86_64 \
    -cdrom alpine-standard-3.8.0-x86_64.iso \
    -boot d \
    -m 2048 \
    -nic user,model=virtio \
    alpine.qcow2

# TODO: this does not have network to get internet
# Use -nic option