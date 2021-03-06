#!/bin/bash
#     ___ ___ _  _ ___ ___    _ _____ ___ ___         
#    / __| __| \| | __| _ \  /_\_   _| __|   \        
#   | (_ | _|| .` | _||   / / _ \| | | _|| |) |       
#    \___|___|_|\_|___|_|_\/_/_\_\_|_|___|___/_ _____ 
#   |   \ / _ \  | \| |/ _ \_   _| | __|   \_ _|_   _|
#   | |) | (_) | | .` | (_) || |   | _|| |) | |  | |  
#   |___/ \___/  |_|\_|\___/ |_|   |___|___/___| |_|  
# 


if ! grep -qi 'Red Hat Enterprise Linux' /etc/redhat-release ; then
  echo "ERROR: We only allow pushing from a RHEL machine because it allows secrets volumes."
  exit 1
fi

# Make sure base is pushed with the latest changes since we depend on it.
if ../../oso-ops-base/rhel7/push.sh ; then
  # Push ourselves
  echo
  echo "Pushing oso-rhel7-host-monitoring..."
  sudo docker push docker-registry.ops.rhcloud.com/ops/oso-rhel7-host-monitoring
fi
