#!/bin/bash
#
# Copyright (C) 2020 James Fuller <jim.fuller@webcomposite.com>
#
# SPDX-License-Identifier: MIT
#

set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
set -- wine "$@"
fi

# Create a virtual X console
Xvfb :1 -screen 0 320x240x24 &

exec "$@"