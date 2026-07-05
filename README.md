# OpenVPN Runtime

A minimal OpenVPN runtime intended for integration into other applications.

This project builds a stripped-down OpenVPN binary with only the functionality required for client operation. Most optional components are disabled to reduce binary size and dependency footprint while preserving modern TLS features, including `tls-crypt-v2`.

## Features

* Minimal OpenVPN build
* Client-focused configuration
* `tls-crypt-v2` support
* OpenSSL backend
* Small binary size
* Easy integration into other applications

## Disabled Components

The build disables functionality that is unnecessary for embedded use cases, including:

* DCO
* Plugin support
* Management interface
* LZO
* LZ4
* PAM authentication plugin
* `iproute2` integration

Additional options may be removed in future releases as long as they are not required for standard client operation.

## Building

Requirements:

* GCC or Clang
* GNU Make
* OpenSSL development package
* `wget`
* `tar`

Build the runtime:

```sh
./build.sh
```

After a successful build, the OpenVPN binary will be available in the `app/` directory.

## Purpose

This project is intended for developers who need a compact OpenVPN runtime bundled with their own software rather than a full-featured OpenVPN installation.

It is not intended to replace official OpenVPN packages for general-purpose server or desktop deployments.
