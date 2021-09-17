# Acquia CMS Composer Template

Acquia CMS is an opinionated implementation of Drupal 9 tailored for creating full-featured websites with low or no code required.

This repository is a Composer template for the Acquia CMS distribution. For support or feature requests, please use the [main project repository](https://github.com/acquia/acquia_cms).

# Environment Requirements

1. PHP 7.3
1. MySQL 5.7 or MariaDB 10.3.7
1. Composer >= 1.9.2

# Prerequisites

To build sites with Acquia CMS, you need entitlements to the following products:
1. [Acquia Cloud IDE](https://docs.acquia.com/ide/).
1. And [Acquia Cloud](https://docs.acquia.com/guide/cloud-ace/) or [Site Factory](https://docs.acquia.com/site-factory/) hosting environemnt.
1. [Acquia Site Studio](https://docs.acquia.com/site-studio/).

## Optional setup step: Pre-configure your Site Studio API keys

To save time and resources, Acquia CMS does not import any templates from Site Studio during installation by default. If you want to automatically import templates during installation, ACMS needs the Site Studio API key and organization key to be configured. These keys are sent to you during the subscription sign-up process. The process to set API keys are different depending on where ACMS is being hosted:

1. *Acquia Cloud Enterprise*:
  - You can set the keys during a [normal Drupal install within the browser](https://docs.acquia.com/cloud-platform/create/install/). There is a form to collect the api and organization key.
  - You can set the keys as environment variables in Acquia Cloud. See the example below for the variable name syntax Acquia CMS expects.
1. *Site Factory*:
  - To have your Site Studio keys set as environment variables inside your Factories, [contact Acquia Support](https://docs.acquia.com/support/) and file a ticket requesting the change.
  - There are some caveats to pre-configuring API keys in Site Factory:
    - Each Acquia Subscription is entitled to use Site Studio to build *one* site at no charge. Creating additional sites after the first will work as expected, but your account manager will contact you to discuss pricing. Note that setting the API key in Site Factory makes it very easy to exceed your site entitlement limits, and we recommend you contact your account manager to strategize your governance strategy for Acquia CMS and Site Factory.
    - Additionally, having Site Studio import components automatically greatly increases the Drupal install time. You can easily configure Site Studio and enable starter content after install from inside Drupal, or by using Drush commands.
1. *Local environments*:
  - Acquia CMS only officially supports Acquia Cloud IDEs as a development environment, but setting environment variables is a fairly straight forward process. In most environments, simply access your terminal and run `export SITESTUDIO_API_KEY=foo && export SITESTUDIO_ORG_KEY=bar`.
  - Then proceed with site install as described in the instructions below.

**Site Studio variables example:**

```
SITESTUDIO_API_KEY=foo
SITESTUDIO_ORG_KEY=bar
```

# Getting Started (Cloud IDE).

- [Install Acquia CLI.](https://github.com/acquia/cli). Follow the instructions in the Acquia CLI README to authenticate with Cloud API and set up your SSH keys.
- Run `acli ide:create` and follow the prompts to create a new Cloud IDE.
- Open the link that says 'Your IDE URL' in a browser.
- All of the following instructions take place in the Cloud IDE, *at this time, the following instructions supercede the instructions on the IDE welcome page.* You have to manually install Acquia CMS from Github.
  1. Run `acli auth:login` and follow the directions.
  1. Run `acli ssh-key:create` and follow the directions to create an SSH key pair, e.g. `id_rsa` will yield a public / private keypair.
  1. Run `acli ssh-key:upload` and follow the directions to upload the public key. e.g. If you named the key `id_rsa` the file will be called `id_rsa.pub`.
  1. Run `cat ~/.ssh/id_rsa.pub` (use whatever filename you chose for your SSH key). Copy the SSH key and add it to your GitHub account, or wherever you want to version control your application. See https://docs.acquia.com/dev-studio/ide/start/#cloning-your-application-from-a-github-repository-to-your-cloud-ide for more information.
  1. Enable the Intl extension. Intl is required to install Content Hub 8.x-2.21 and above & restart the PHP-FPM after making this change.
     ```
     echo "extension=intl.so" >> ../configs/php/custom.ini
     supervisorctl restart php-fpm
     ```
  1. Run `composer create-project acquia/acquia-cms-project .`. You must create the project within the Cloud IDE project folder.
  1. Run `composer install`. Acquia CMS dependencies are very memory intensive, but recent updates in Composer v2 address this. If you receive out of memory errors, try `php -d memory_limit=2G /usr/local/bin/composer install`.
  1. Cloud IDEs will copy docroot/sites/default/default.settings.php to settings.php and configure the database connection string for you. The settings.php file includes automatic ACMS configuration for Acquia Cloud environments.
  1. Then run `composer acms:install`. This runs a helper script to collect information from you and install Acquia CMS.
  1. Once the installation is complete, you can open your ACMS website by clicking the 'Manage Drupal Application' and then 'Open Drupal Site' in the menu bar of your Cloud IDE.
  1. It can take a lot of memory to install Acquia CMS, especially in local environments with limited resources. If you run into memory errors, try increasing the memory limit when installing Acquia CMS:
    ```
    php -d memory_limit=2G vendor/bin/drush site:install acquia_cms --yes --account-pass admin
    ```
  1. If 2 GB *still* isn't enough memory, try raising the limit even more.
  1. *Note:* If you install Acquia CMS with the drush `site:install` command, Site Studio assets will need to be rebuilt by running `drush cohesion:rebuild` after ACMS is installed. The composer `acms:install` command described above does this for you.

# Getting Started (Local).

1. Acquia CMS can be hosted inside any local development environment capable of hosting a Drupal 9 site. You will need to have Composer installed locally, and we highly recommend using Composer 2.
1. Run `composer create-project acquia/acquia-cms-project`.
1. Run `composer install`. If you receive out of memory errors, try `php -d memory_limit=2G /usr/local/bin/composer install`.
1. Then follow the Drupal configuration instructions for the development environment of your choice. For most environments, this means adding database credentials to settings.php. Drupal and ACMS will auto-create a settings.php file for you, but ACMS has no knowledge of credential configuration for any non-Acquia environments.
1. Once configured, run `composer acms:install`.
1. It can take a lot of memory to install Acquia CMS. If you run into memory errors, try increasing the memory limit when installing Acquia CMS:
```
php -d memory_limit=2G vendor/bin/drush site:install acquia_cms --yes --account-pass admin
```
If 2 GB *still* isn't enough memory, try raising the limit even more.
1. If you see blank pages with no styles being loaded after installing, you likely just need to run a cohesion rebuild via `drush cohesion:rebuild`.

*Note:* If you install Acquia CMS with the drush `site:install` command, Site Studio assets will need to be manually imported by running `drush cohesion:rebuild` after ACMS is installed. The composer `acms:install` command described above does this for you.

# Contributing to Acquia CMS

[Refer to our contributors guide](https://github.com/acquia/acquia_cms/blob/develop/CONTRIBUTING.md) in the parent repository.

# Enabling ACMS Starter Content and Demo

Acquia CMS ships with starter website content, to demonstrate how pages can be built. It also provides a reasonable starting point for building custom sites. To enable the starter module, you can run `drush pm:enable acquia_cms_starter` or enable 'Acquia CMS Starter' from the modules admin page.

# License

Copyright (C) 2021 Acquia, Inc.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
