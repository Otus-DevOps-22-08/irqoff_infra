# irqoff_infra

## Homework 05

.ssh/config:
```
Host someinternalhost
  Hostname 10.128.0.29
  User appuser
  ProxyJump appuser@84.201.133.XXX
```

bastion_IP = 51.250.1.169
someinternalhost_IP = 10.128.0.29
