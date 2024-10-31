sf demoutil org create scratch -f config/project-scratch-def.json -d 5 -s -w 60 -p admin -e sfconnect.demo
sf project deploy start
sf org assign permset -n SalesforceConnect
sf automig load -d data
sf demoutil user password set -p salesforce1 -g User -l User
sf org open
