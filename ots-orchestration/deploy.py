import os
import sys

args = sys.argv
env = args[1]
if len(args) > 2:
    ots_service_tag = args[2]
else:
    with open('build/ots-service-tag') as ots_service_tag_file:
        print ots_service_tag_file
        ots_service_tag = ots_service_tag_file.readline()

print ots_service_tag

command = 'cd ansible && ansible-playbook ots-service-container.yml -i {env}.py -vvvv --extra-vars="env={env} ots_service_tag={ots_service_tag}"'

os.system(command.format(env=env, ots_service_tag=ots_service_tag))

