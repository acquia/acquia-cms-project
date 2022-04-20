# This project has been deprecated.

If you're starting a new project with Acquia CMS, please use [Acquia's Drupal Recommended Project instead](https://github.com/acquia/drupal-recommended-project).

If you initially built your Acquia CMS project by running `composer create-project acquia/acquia-cms-project`, your composer.json is still valid and will continue to work _until the release of Acquia CMS 2.0_, at which point you will no longer receive the latest version of ACMS by running `composer update`.

You should merge the contents of your composer.json with [drupal-recommended-project's composer.json](https://github.com/acquia/drupal-recommended-project/blob/master/composer.json) in order to ensure compatability with all Acquia CMS versions after a 2.0 release. Don't forget to include any Composer dependencies added after the initial `composer create-project` was completed.
