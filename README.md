**Description**

This is a port of [binhex](https://github.com/binhex/) work (specifically arch-base, arch-int-vpn and arch-deluge) to Alpine Linux, removing the work to setup the Deluge torrent client and leaving only the Wireguard option.

**Build notes**

The image is built from "alpine". The final size is about 160MB, which is much less than the 1.6GB used by binhex's image:

```
alpine-wireguard         latest              87185ba960d1        28 hours ago        154MB
binhex/arch-delugevpn    latest              25048c9aafb4        2 weeks ago         1.6GB
```

**Notes**

[Documentation](https://github.com/binhex/documentation) | [Support Forum](http://lime-technology.com/forum/index.php?topic=45811.0)
