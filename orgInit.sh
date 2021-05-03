echo 'Creating the new demo scratch org.'
sfdx shane:org:create -f config/project-scratch-def.json -d 30 -s --wait 60 --userprefix admin -o sfconnect.demo

DEPLOY_NAME=sf-connect-${RANDOM}
echo `Setting deployed app name to "${$DEPLOY_NAME}"`

echo 'Creating the Heroku app which will provide the oData API used by this demo.'
sfdx shane:heroku:repo:deploy -g gabesumner -r external-objects -n `"${$DEPLOY_NAME}"`

echo 'Updating the external data source to point to the new Heroku app.'
sfdx shane:heroku:externalobjects -a ${$DEPLOY_NAME} -f force-app/main/default/dataSources/ExternalData.dataSource-meta.xml 

echo 'Pushing the metadata into the new scratch org.'
sfdx force:source:push

echo 'Assigning the permset to the admin user'
sfdx force:user:permset:assign -n SalesforceConnect

echo 'Loading the starting demo data'
sfdx automig:load -d data

echo 'Setting the default password.'
sfdx shane:user:password:set -g User -l User -p salesforce1

echo 'Opening the demo org.'
sfdx force:org:open
