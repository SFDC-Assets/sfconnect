# Salesforce Connect

This project shows how to show to use Salesforce Connect (External Objects) to integrate data into Salesforce without importing it. This demo, along with many other Salesforce Platform demos, are available at <https://www.platformdemos.com>, where you can:

- Watch a video of this demo (3 minutes or less).
- Spin up your own instance of the demo in a free scratch org.
- Find related Trailhead content.
- Get high-resolution screenshots.

___

## Installation Instructions

The easiest way to get hands on with this demo is through <https://www.platformdemos.com>, but if you would rather clone this project for yourself, then follow the instructions below to get it up and running.

1. Setup your own [Heroku External Objects demo](https://github.com/gabesumner/heroku-external-objects) to get your own clone of the oData demo data.

2. [Create your own Dev Hub and setup SFDX](https://trailhead.salesforce.com/en/content/learn/modules/sfdx_app_dev/sfdx_app_dev_setup_dx).

3. Clone this repository:

```
git clone https://github.com/gabesumner/salesforce-connect
cd salesforce-connect
```

4. Edit the following file: ./force-app/main/default/dataSources/ExternalData.dataSource-meta.xml

5. Replace the URL, Username, and Password with your own oData demo source from step #1.

```
<?xml version="1.0" encoding="UTF-8"?>
<ExternalDataSource xmlns="http://soap.sforce.com/2006/04/metadata">
    <customConfiguration>{&quot;inlineCountEnabled&quot;:&quot;true&quot;,&quot;csrfTokenName&quot;:&quot;&quot;,&quot;requestCompression&quot;:&quot;false&quot;,&quot;pagination&quot;:&quot;CLIENT&quot;,&quot;noIdMapping&quot;:&quot;false&quot;,&quot;format&quot;:&quot;JSON&quot;,&quot;compatibility&quot;:&quot;DEFAULT&quot;,&quot;csrfTokenEnabled&quot;:&quot;false&quot;,&quot;timeout&quot;:&quot;120&quot;,&quot;searchEnabled&quot;:&quot;true&quot;,&quot;ChangeTrackingEnabled&quot;:&quot;false&quot;}</customConfiguration>
    <endpoint>https://odata-2-virginia.heroku.com/odata/v4/48cce0436f904e3db46e28df069c620d/</endpoint>
    <isWritable>true</isWritable>
    <label>ExternalData</label>
    <principalType>NamedUser</principalType>
    <protocol>Password</protocol>
    <type>OData4</type>
    <username>849dcebcbc534677cfe6024c6c001df4</username>
    <password>z3c0q7e4895146y19003f440b67e2c94</password>
</ExternalDataSource>
```

6. Install **shane-sfdx-plugins** (if you don't already have it)

```
sfdx plugins:install shane-sfdx-plugins
```

7. Run the startup script

```
sh orgInit.sh
```