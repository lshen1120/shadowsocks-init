# shadowsocks-init

## CentOS7

disable firewalld

set shadowsocks as systemd service 

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lshen1120/shadowsocks-init/master/centos7-init.sh)" _ {port} {password}
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lshen1120/shadowsocks-init/master/centos7-init.sh)" _ 9443 1234567890
```
