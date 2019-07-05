#!/usr/bin/env bash

export LD_LIBRARY_PATH=/kafka_to_nexus/lib/

COMMAND=/kafka_to_nexus/bin/kafka-to-nexus\ --config-file\ "${CONFIG_FILE}"

echo $COMMAND
$COMMAND


