# Acquia CMS

An opinionated implementation of Drupal 9 tailored for creating full-featured websites with low or no coding required.

# Environment Requirements

1. PHP 7.3
1. MySQL 5.7 or MariaDB 10.3.7
1. Composer >= 1.9.2

# Prerequisites

1. A working developer environment. To evaluate Acquia CMS inside a Cloud IDE, you need an entitlement. Every Acquia Subscription is entitled to one free Cloud IDE. See the documentation for details.
1. Acquia CMS is meant to be deployed and hosted in an Acquia Cloud environemnt.
1. Acquia CMS also requires Site Studio access. API keys for Site Studio should have been given to you during
subscription signup. Contact your Account Manager if you need assistance.

## Optional setup step: Pre-configure Site Studio API keys

To save time and resources, Acquia CMS will not by default import any templates from Site Studio during installation. If you want to automatically import Site Studio assets during installation, you'll need to provide the Site Studio API key and organization key as environment variables:

```
export SITESTUDIO_API_KEY=foo
export SITESTUDIO_ORG_KEY=bar
```

You can also set the API keys during a browser based Drupal installation, by navigating to /install.php on your
hosted domain.

# Getting Started (Local).

1. Acquia CMS can be hosted inside any local development environment capable of hosting a Drupal 9 site. You will need to have Composer installed locally.
1. To clone the Acquia CMS codebase locally prior to the public ACMS launch, run `git clone git@github.com:acquia/acquia-cms-project`. Note that you need to be a member of the Acquia Github organization to get access.
1. To clone the ACMS codebase after launch, run `composer create-project acquia/acquia-cms-project`.
1. Run `composer install`. ACMS is quite memory intensive during installation. If you receive out of memory errors, try `php -d memory_limit=2G /usr/local/bin/composer install`.
1. Then follow the install instructions for the development environment of your choice. Once configured, you should end up running `composer acms:install` to install Drupal. You can also install through the browser by navigating to install.php at your hosted domain. E.g., 'http://example.com/install.php'.
1. When installing locally, you need to copy docroot/sites/default/default.settings.php to settings.php and add your local datatbase credentials. ACMS makes changes to the settings.php file specifically for Acquia hosting, but it has no opinion or knowledge of local development environments.
1. It can take a lot of memory to install Acquia CMS. If you run into memory errors, try increasing the memory limit when installing Acquia CMS:
```
php -d memory_limit=2G vendor/bin/drush site:install acquia_cms --yes --account-pass admin
```
If 2 GB *still* isn't enough memory, try raising the limit even more.
1. If you see blank pages with no styles being loaded after installing, you likely just need to run a cohesion rebuild via `drush cohesion:rebuild`.

# Getting Started (Cloud IDE).
1. [Install Acquia CLI.](https://github.com/acquia/cli). Follow the instructions in the Acquia CLI README to authenticate with Cloud API and set up your SSH keys.
1. Run `acli ide:create` and follow the prompts to create a new Cloud IDE.
1. Open the link that says 'Your IDE URL' in a browser.
1. All of the following instructions take place in the Cloud IDE, *ignore the instructions on the welcome page.* You have to manually install Acquia CMS from Github.
1. Run `acli auth:login` and follow the directions.
1. Run `acli ssh-key:create` and follow the directions to create an SSH key pair, e.g. `id_rsa` will yield a public / private keypair.
1. Run `acli ssh-key:upload` and follow the directions to upload the public key. e.g. If you named the key `id_rsa` the file will be called `id_rsa.pub`.
1. Run `cat ~/.ssh/id_rsa.pub` (use whatever filename you chose for your SSH key). Copy the SSH key and add it to your GitHub account. See https://docs.acquia.com/dev-studio/ide/start/#cloning-your-application-from-a-github-repository-to-your-cloud-ide for more information. *Be sure to enable SSO for the newly added key, authorizing the Acquia organization.*
1. Clone the customer facing `acquia-cms-project` repo: `git clone git@github.com:acquia/acquia-cms-project .`
1. Run `composer install`. If you receive out of memory errors, try `php -d memory_limit=2G /usr/local/bin/composer install`.
1. Cloud IDEs will copy docroot/sites/default/default.settings.php to settings.php and configure the database connection string for you. The settings.php file includes automatic ACMS configuration for Acquia Cloud environments.
1. Then run `composer acms:install`.
1. Once Drush tells you the install is complete, you can open your Acquia CMS website by clicking the 'Open Drupal Site' in the menu bar of your Cloud IDE.
1. It can take a lot of memory to install Acquia CMS. If you run into memory errors, try increasing the memory limit when installing Acquia CMS:
```
php -d memory_limit=2G vendor/bin/drush site:install acquia_cms --yes --account-pass admin
```
If 2 GB *still* isn't enough memory, try raising the limit even more.
1. If you see blank pages with no styles being loaded after installing, you likely just need to run a cohesion rebuild via `drush cohesion:rebuild`.
