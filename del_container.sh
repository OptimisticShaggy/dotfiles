#! /run/current-system/sw/bin/bash

for i in $(echo /var/lib/containers/*); do chattr -i $i/var/empty ; done
rm -rf /var/lib/containers/