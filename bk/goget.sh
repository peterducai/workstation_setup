#!/bin/bash

while read p; do
  go get $p
done <gourls.list