# Create the demo org
sfdx force:org:delete -u salesforce-connect
sfdx force:org:create -f config/project-scratch-def.json --setalias salesforce-connect --setdefaultusername

#export HEROKU_API_KEY=$(heroku auth:token)
#sfdx shane:heroku:externalobjects -a external-objects-demo -f force-app/main/default/dataSources/ExternalData.dataSource-meta.xml 

# Push the metadata into the new scratch org.
sfdx force:source:push

# Assign user the permset
sfdx force:user:permset:assign -n SalesforceConnect

# Load starting demo data
sfdx automig:load -d data

# Set the default password.
sfdx shane:user:password:set -g User -l User -p salesforce1

# Open the org.
sfdx force:org:open