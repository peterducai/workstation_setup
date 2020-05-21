#!/bin/bash

while read p; do
  npm i -g  $p
done <gourls.list
