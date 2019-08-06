#!/bin/bash

# Upload the source data to the remote server.
# This should change since jenkins takes care of it
rsync -r src root@pbfp.xyz:/root/tos
