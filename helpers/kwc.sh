#!/bin/bash

# Kafka Web Console

KWC_DIR=/opt/kwc

$KWC_DIR/kafka-web-console/bin/kafka-web-console -DapplyEvolutions.default=true &
