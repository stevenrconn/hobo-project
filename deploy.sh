#!/usr/bin/env bash

set -o xtrace

if [[ -f $MANIFEST ]] ; then
    vagrant box add \
        --force \
        --name $PREFIX$(jq --raw-output '.builds[-1].name' $MANIFEST) \
        $(jq --raw-output '.builds[-1].files[-1].name' $MANIFEST)
    rm -f $MANIFEST
fi