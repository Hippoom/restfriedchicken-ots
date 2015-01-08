#!/usr/bin/env python

from lib.dynamic_inventory import withListFor

with open('../../ots-env/acceptance.json') as env:
    list = withListFor(env)
    print list


