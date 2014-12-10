#!/usr/bin/env python

import json


def withList(groups):
    inventory_dict = {"_meta": {}}
    inventory_dict["_meta"]["hostvars"] = {}
    for group in groups:
        inventory_dict[group] = {"hosts": []}
        if "vars" in groups[group]:
            setGroupVars(inventory_dict, group, groups[group]["vars"])
        hosts = groups[group]
        for host in sorted(hosts):
            if isHost(host):

                setHost(inventory_dict, group, host)

                initHostVars(inventory_dict, host)

                for key in hosts[host]:
                    setHostVar(inventory_dict, host, key, hosts[host][key])

    return toJson(inventory_dict)


def isHost(key):
    return key != "vars"


def isSSHOption(key):
    from sets import Set

    return key in Set(["host", "user", "pass"])


def toJson(src):
    return json.dumps(src, sort_keys=True)


def decoratedHostVar(key):
    if isSSHOption(key):
        return "ansible_ssh_" + key
    else:
        return key


def hostVarsInInventory(inventory_dict):
    return inventory_dict["_meta"]["hostvars"]


def initHostVars(inventory_dict, host):
    if not host in hostVarsInInventory(inventory_dict):
        hostVarsInInventory(inventory_dict)[host] = {}


def setHostVar(inventory_dict, host, key, value):
    hostVarsInInventory(inventory_dict)[host][decoratedHostVar(key)] = value


def setHost(inventory_dict, group, host):
    inventory_dict[group]["hosts"].append(host)


def setGroupVars(inventory_dict, group, value):
    inventory_dict[group]["vars"] = value


def withListFor(env):
    groups = json.load(env)
    return withList(groups)


