#!/bin/bash -e
env path_old='=/usr/local/sbin:' path_new='=/micromamba/bin:/usr/local/sbin:' bash -c 'sed -i "s%$path_old%$path_new%g" "${ROOTFS_DIR}"/etc/login.defs'
env path_old='=/usr/local/bin:' path_new='=/micromamba/bin:/usr/local/bin:' bash -c 'sed -i "s%$path_old%$path_new%g" "${ROOTFS_DIR}"/etc/login.defs'
env path_old='="/usr/local/sbin:' path_new='="/micromamba/bin:/usr/local/sbin:' bash -c 'sed -i "s%$path_old%$path_new%g" "${ROOTFS_DIR}"/etc/profile'
env path_old='="/usr/local/bin:' path_new='="/micromamba/bin:/usr/local/bin:' bash -c 'sed -i "s%$path_old%$path_new%g" "${ROOTFS_DIR}"/etc/profile'

on_chroot << EOF
cd /
curl -Ls https://micro.mamba.pm/api/micromamba/linux-aarch64/latest | tar -xvj bin/micromamba
micromamba create -p /micromamba -c conda-forge -y python=3.9
EOF
