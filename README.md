**Description**

This is a port of [binhex](https://github.com/binhex/) work (specifically arch-base, arch-int-vpn, and arch-privoxyvpn) to Alpine Linux, removing the work to setup openvpn and leaving only the Wireguard option.

**Rationale**

I built this image to learn. And to have a MacMini at home that i can put under my access point connecting to my VPN endpoint.

**Build notes**

The image is built from "alpine". The final size is about 125MB, which is much less than the 685MB used by binhex's image:

```
alpine-wireguard         3.13.2.0            5606faa4b225        13 hours ago        126MB
binhex/arch-privoxyvpn   latest              8c0060da9203        2 weeks ago         685MB
```

**Notes**

[Documentation](https://github.com/binhex/documentation)
