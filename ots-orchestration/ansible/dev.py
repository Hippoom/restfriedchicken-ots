#!/usr/bin/env python

from lib.dynamic_inventory import withListFor

with open('../environments/dev.json') as env:
    list = withListFor(env)
    print list

