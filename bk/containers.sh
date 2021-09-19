#!/bin/bash

while read p; do
  podman pull $p
done <cont_images.list