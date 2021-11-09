# Tutorials

frpc

frpc conf e.g.
~~~
[common]
server_addr = YOUR_FRP_SERVER_ADDR
server_port = YOUR_FRP_SERVER_PORT
token =       YOUR_FRP_SERVER_TOKEN

[tcp_eg]
type = tcp
local_ip = 127.0.0.1
local_port = 8388
remote_port = 9967

[http_eg]
type = http
local_ip = ******
use_encryption = true
use_compression = true
local_port = ****
custom_domains = ******.com
http_user = ***
http_pwd = *******
~~~

docker-compose e.g.
~~~
version: "3.6"
services:
  sserver:
    image: junxin/frpc
    restart: unless-stopped
    volumes:
      - ./conf:/conf
   # optional
   # port:
   #   - 8388:8388
~~~
