#!/bin/bash
EARGS=()
if [ ! -e "/dev/kvm" ]; then
    # Enable software emulation because KVM is not available
    EARGS+=("-W")
fi

./create_cpio.sh archive.cpio apps/app-nginx/fs0/

exec taskset -c 3-4 qemu-guest "${EARGS[@]}" \
    -p 4 \
    -m 4096 \
    -b virbr0 \
    -k apps/app-nginx/build/app-nginx_kvm-x86_64 \
    -i archive.cpio \
    -a "netdev.ipv4_addr=\"172.32.255.2\" netdev.ipv4_subnet_mask=\"255.255.255.0\" netdev.ipv4_gw_addr=\"172.32.255.1\" -- -c /nginx/conf/nginx.conf" \
    "$@"
