#!/bin/bash

# Upload the source data to the remote server.
rsync -r /output/* root@pbfp.xyz:/var/lib/docker/volumes/tos_work/_data/
