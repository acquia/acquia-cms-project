# Acquia CMS

An opinionated implementation of Drupal 9 tailored for creating full-featured websites with low or no coding required.

# Prerequisites

1. To evaluate Acquia CMS inside a Cloud IDE, you need an entitlement. See your account manager or the Cloud IDE team for details.
1. Acquia CMS is meant to be deployed and hosted in an Acquia Cloud environemnt. See your account manager for details.
1. Acquia CMS also requires Cohesion access. Obtain your API keys from a teammate or via [the request form in Confluence](https://confluence.acquia.com/display/cohesion/Employee+API+Keys).

# Getting Started (Local).

1. During the early access phases of ACMS, you'll need access to a Github user with rights to the Acquia Organization. To pull a copy of ACMS locally, you'll need an SSH key installed that has access rights.
1. ACMS can be hosted inside any local development environment capable of hosting a Drupal 9 site. You will need to have Composer installed locally.
1. To create the ACMS codebase, run `composer create-project acquia/acquia-cms-project:dev-develop`.
1. Then follow the install instructions for the development environment of your choice. Once configured, you should end up running `drush site-install acquia_cms -y --acount-pass admin` to install Drupal.

# Getting Started (Cloud IDE).
1. [Install Acquia CLI.](https://github.com/acquia/cli). Follow the instructions in the ACLI README to authenticate with Cloud API and set up your SSH keys.
1. Run `acli ide:create` and follow the prompts to create a new IDE.
1. Open the link that says 'Your IDE URL' in a browser.
1. In the Cloud IDE, *ignore the instructions on the welcome page.* You have to manually install ACMS from Github.
1. Run `acli ssh-key:create` and follow the directions.
1. Run `acli ssh-key:upload` and follow the directions.
1. Run `cat ~/.ssh/id_rsa.pub` (use whatever filename you chose for your SSH key). Copy the SSH key and add it to your GitHub account. See https://docs.acquia.com/dev-studio/ide/start/#cloning-your-application-from-a-github-repository-to-your-ide for more information. Be sure to enable SSO for the newly added key, authorizing the Acquia organization.
1. Next we need to use Acquia CMS Composer template. Run the following command `composer create-project acquia/acquia-cms-project:dev-develop`.
1. Then run `drush site-install acquia_cms -y --acount-pass admin`.
1. Once Drush tells you the install is complete, you can open your ACMS website by clicking the 'Open Drupal Site' in the menu bar of your IDE.
