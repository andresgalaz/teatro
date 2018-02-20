#!/bin/bash -vx
FECHA=$(date +'%Y%m%d_%H%M%S')
mysqldump --user=agalaz --password=a --databases andy --routines > andy_$FECHA.sql
