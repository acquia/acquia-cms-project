# Acquia CMS

An opinionated implementation of Drupal 9 tailored for creating full-featured websites with low or no coding required.

# Prerequisites

1. To evaluate Acquia CMS you need an entitlement to a Cloud IDE environment. See your account manager for details.
1. Acquia CMS is meant to be deployed and hosted in an Acquia Cloud environemnt. See your account manager for details.
1. Obtain Cohesion API keys from a teammate or via [the request form in Confluence](https://confluence.acquia.com/display/cohesion/Employee+API+Keys).

# Getting Started.

1. [Install Acquia CLI.](https://github.com/acquia/cli). Follow the instructions in the ACLI README to authenticate with Cloud API and set up your SSH keys.
1. Run `acli ide:create` and follow the prompts to create a new IDE.
1. Open the link that says 'Your IDE URL' in a browser.
1. In the Cloud IDE, you'll see page labeled 'Getting Started'. Follow the instructions for 'Configure the IDE'. *DO NOT* follow the other steps.
1. To manually install Acquia CMS, run the following command `composer create-project acquia/acquia-cms-project:dev-develop`.
1. Then run `drush site-install acquia_cms -y --acount-pass admin`.
1. Once Drush tells you the install is complete, you can open your ACMS website by clicking the 'Open Drupal Site' in the menu bar of your IDE.
