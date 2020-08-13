# Salesforce Connect

This project shows how to use Salesforce Connect to integrate data into Salesforce without importing it. 

You can find this demo on <https://www.platformdemos.com>, where you can also:

- Watch a video of this demo (3 minutes or less).
- Spin up your own instance of the demo in a free scratch org.
- Find related Trailhead content.
- Get high-resolution screenshots.

___

## Installation Instructions

The easiest way to try this demo is on <https://www.platformdemos.com> (THIS DOES NOT YET WORK), but if you would rather clone this project for yourself, follow the instructions below.

1. [Create your own Dev Hub and setup SFDX](https://trailhead.salesforce.com/en/content/learn/modules/sfdx_app_dev/sfdx_app_dev_setup_dx).

2. [Sign up for your own Heroku account](https://signup.heroku.com/), if you don't already have one.

3. Clone this repository:

```
git clone https://github.com/gabesumner/salesforce-connect
cd salesforce-connect
```

4. Install **shane-sfdx-plugins** (if you don't already have it)

```
sfdx plugins:install shane-sfdx-plugins
```

5. Run the startup script and answer the 

```
sh orgInitLocal.sh
```

6. Due to a bug, find the Heroku app that was created, click **Heroku Connect**, then click **External Objects**, and share all the **Data Sources**.