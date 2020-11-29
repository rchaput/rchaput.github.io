#!/usr/bin/env bash

# TODO: find the remote IP (e.g. with `hostname -I`) and bind to it
# instead of allowing any connection
hugo server --disableFastRender --i18n-warnings --bind=0.0.0.0
