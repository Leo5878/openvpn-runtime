#!/bin/sh
set -e

OVPN_VERSION=2.7.5
dist=/app
binary=src/openvpn/openvpn

if ! [ -f "$dist/openvpn-${OVPN_VERSION}/$binary" ]; then
  echo "=== Building OpenVPN..."
  cd $dist

  wget -qO- "https://github.com/OpenVPN/openvpn/releases/download/v${OVPN_VERSION}/openvpn-${OVPN_VERSION}.tar.gz" | tar xz
  cd openvpn-${OVPN_VERSION}

  ./configure \
    --with-crypto-library=openssl \
    --enable-small \
    --disable-dco \
    --disable-plugins \
    --disable-management \
    --disable-lzo \
    --disable-lz4 \
    --disable-plugin-auth-pam \
    --disable-iproute2 \
    LDFLAGS="-static -static-libgcc" \
    CFLAGS="-Os"

  make -j$(nproc)
  strip "$binary"

  mv $binary $dist
  echo "=== OpenVPN built"
else
  echo "=== OpenVPN already built, skipping"
fi
