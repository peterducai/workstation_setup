#!/bin/bash

while read p; do
  git clone $p
done <sources.list