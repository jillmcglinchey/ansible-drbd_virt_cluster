#!/usr/bin/env bash
echo "Creating /etc/ocfs2/cluster.conf"
cat << EOF > /etc/ocfs2/cluster.conf
node: 
  ip_port = 7777
  ip_address = 192.168.1.1
  number = 0
  name = virt-cl-drbd-0
  cluster = drbd
node:
  ip_port = 7777
  ip_address = 192.168.1.2
  number = 1
  name = virt-cl-drbd-1
  cluster = drbd
cluster:
  node_count = 2
#  heartbeat_mode = local
  name = drbd

EOF

echo "Creating /etc/default/o2cb"
cat << EOF > /etc/default/o2cb
#
# This is a configuration file for automatic startup of the O2CB
# driver.  It is generated by running 'dpkg-reconfigure ocfs2-tools'.
# Please use that method to modify this file.
#

# O2CB_ENABLED: 'true' means to load the driver on boot.
O2CB_ENABLED=true

# O2CB_BOOTCLUSTER: If not empty, the name of a cluster to start.
O2CB_BOOTCLUSTER=drbd

# O2CB_HEARTBEAT_THRESHOLD: Iterations before a node is considered dead.
O2CB_HEARTBEAT_THRESHOLD=31

# O2CB_IDLE_TIMEOUT_MS: Time in ms before a network connection is considered dead.
O2CB_IDLE_TIMEOUT_MS=30000

# O2CB_KEEPALIVE_DELAY_MS: Max. time in ms before a keepalive packet is sent.
O2CB_KEEPALIVE_DELAY_MS=2000

# O2CB_RECONNECT_DELAY_MS: Min. time in ms between connection attempts.
O2CB_RECONNECT_DELAY_MS=2000
EOF
