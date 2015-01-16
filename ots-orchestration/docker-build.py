import os
import sys

args = sys.argv
env = args[1]
if len(args) > 2:
    ots_service_tag = args[2]
else:
    ots_service_tag = 'latest'

print ots_service_tag

command = 'cd ansible && ansible-playbook ots-service-image.yml -i {env}.py -vvvv --extra-vars="ots_service_tag={ots_service_tag}"'

os.system(command.format(env=env, ots_service_tag=ots_service_tag))

with open('build/ots-service-tag', "w") as the_file:
    the_file.write(ots_service_tag)