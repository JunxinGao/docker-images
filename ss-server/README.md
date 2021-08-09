# Tutorials

shadowsocks-libev + frpc

frpc conf e.g.
~~~
[common]
server_addr = YOUR_FRP_SERVER_ADDR
server_port = YOUR_FRP_SERVER_PORT
token =       YOUR_FRP_SERVER_TOKEN

[frp-ss]
type = tcp
local_ip = 127.0.0.1
local_port = 8388
remote_port = 9967
~~~

docker-compose e.g.
~~~
version: "3.6"
services:
  sserver:
    image: junxin/ss-server
    restart: unless-stopped
    volumes:
      - ./conf:/conf
    environment:
      PASSWORD: gjx.me
      METHOD: aes-256-cfb
   # optional
   # port:
   #   - 8388:8388
~~~
