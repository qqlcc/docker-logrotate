#!/bin/sh

addgroup -g 101 envoy
adduser -u 101 -G envoy -h /home/envoy -s /bin/bash -S envoy