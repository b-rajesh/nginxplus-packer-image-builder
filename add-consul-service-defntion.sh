#!/bin/bash
sudo mv /tmp/nginx-plus-consul-client.json /opt/consul/config/
sudo chown consul:consul /opt/consul/config/nginx-plus-consul-client.json
sudo chmod 755 /opt/consul/config/nginx-plus-consul-client.json
sudo ls -ltr /opt/consul/config/
