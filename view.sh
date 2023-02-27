#!/usr/bin/env bash

ALLOW_PUBLIC=${1:-""}

if [ -z ${ALLOW_PUBLIC} ]; then
  # Do not allow public connections (default)
  hugo server --disableFastRender --printI18nWarnings
else
  hugo server --disableFastRender --printI18nWarnings --bind=0.0.0.0
fi
