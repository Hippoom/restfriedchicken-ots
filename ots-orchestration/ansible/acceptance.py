#!/usr/bin/env python

from lib.dynamic_inventory import withListFor

with open('../environments/acceptance.json') as env:
    list = withListFor(env)
    print list


