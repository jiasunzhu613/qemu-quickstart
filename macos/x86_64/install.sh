ISO=$1
QCOW2_IMAGE=$2


USAGE="
Script to install macOS x86_64 QEMU VM using .iso file onto .qcow2 file.
Usage: run.sh [options] -i <linux_iso> -img <qcow2_image>
Options: 
  -h, --help          Show this help message and exit
  -i, --iso           Specify the .iso file to install
  -img, --image       Specify the qcow2 image file to use
"

while [[ "$#" -gt 0 ]]; do 
    case $1 in 
        -h|--help)
            echo "$USAGE"
            exit 1
            ;;
        -i|--iso) 
            ISO=$2
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