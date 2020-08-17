# Make sure we're logged into Heroku
if [[ -z "$(heroku auth:whoami)" ]]; then
    echo 'Login to Heroku'
    heroku login
fi

# Fetch a Heroku API Token
if [[ -z "${HEROKU_API_KEY}" ]]; then
    echo 'Getting Heroku API Key'
    export HEROKU_API_KEY=$(heroku auth:token)
fi

# Prompt for Heroku Username - needed for shane:heroku:externalobjects (below)
if [[ -z "${HEROKU_USERNAME}" ]]; then
    read -p "Heroku Username: " username
    export HEROKU_USERNAME=$username
fi

# Prompt for Heroku Password - needed for shane:heroku:externalobjects (below)
if [[ -z "${HEROKU_PASSWORD}" ]]; then
    read -p "Heroku Password: " password
    export HEROKU_PASSWORD=$password
fi

# Prompt for Heroku app name
if [[ -z "${HEROKU_APP_NAME}" ]]; then
    read -p "Heroku App Name: " app_name
    export HEROKU_APP_NAME=$app_name
fi

echo 'Trying to delete existing Heroku app (if it exists).'
heroku apps:destroy $HEROKU_APP_NAME -c=$HEROKU_APP_NAME

echo 'Creating the Heroku app which will provide the oData API used by this demo.'
sfdx shane:heroku:repo:deploy -g gabesumner -r heroku-external-objects -n $HEROKU_APP_NAME --loglevel=debug

echo 'Deleting the existing Salesforce demo org (if it exists)'
sfdx force:org:delete -u salesforce-connect

echo 'Creating the new demo scratch org.'
sfdx force:org:create -f config/project-scratch-def.json --setalias salesforce-connect --setdefaultusername

echo 'Updating the external data source to point to the new Heroku app.'
sfdx shane:heroku:externalobjects -a $HEROKU_APP_NAME -f force-app/main/default/dataSources/ExternalData.dataSource-meta.xml 

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