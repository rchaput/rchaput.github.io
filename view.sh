#!/usr/bin/env bash

ALLOW_PUBLIC=${1:-""}

if [ -z ${ALLOW_PUBLIC} ]; then
  # Do not allow public connections (default)
  hugo server --disableFastRender --i18n-warnings
else
  hugo server --disableFastRender --i18n-warnings --bind=0.0.0.0
fi
