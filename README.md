# Acquia CMS

An opinionated implementation of Lightning tailored for running low or no-code websites in the Acquia platform.

# Getting Started.

BLT provides an automation layer for testing, building, and launching Drupal 8 applications.

1. Review the [Required / Recommended Skills](http://blt.readthedocs.io/en/latest/readme/skills) for working with a BLT project.
1. Ensure that your computer meets the minimum installation requirements (and then install the required applications). See the [System Requirements](http://blt.readthedocs.io/en/latest/INSTALL/#system-requirements).
1. [Install Lando.](https://docs.lando.dev/basics/installation.html#system-requirements)
1. \** NOTE: During the Lando install, Docker Desktop will ask if you want to upgrade. Do *not\* install the upgrade. Lando does not support the latest version of Docker desktop, and you will have to uninstall Lando entirely if you upgrade.
1. Request access to organization that owns the project repo in GitHub (if needed).
1. Clone your repository. By default, Git names this "origin" on your local.
   ```
   $ git clone git@github.com:acquia/acquia-cms.git
   ```
1. Change to the project directory
   ```
   $ cd acquia-cms
   ```
1. Get development Cohesion API keys from Confluence or a teammate. Copy .lando/example-local-env to ./lando/local.env and replace with your API keys:
   ```
    COHESION_API_KEY=CHANGEME-12345
    COHESION_ORG_KEY=CHANGEME-678910
   ```
1. Initialize the project
   ```
   $ lando start
   ```
1. The install should take 10+ minutes or so, as we import an entire Cohesion UI kit on install. Go get a coffee or something.
1. You will see links to the local site in your terminal once it's complete.
1. You can log in to the site by running `lando drush uli`.
1. Here's [useful documentation](https://docs.lando.dev/basics/usage.html) on working with Lando.

Note the following properties of this project:

- Primary development branch: **master**
- Local site URL: **http://acquiacms.lndo.site/**
- Any project dependencies that need to have their own git repositories checked out for effective development are automatically checked out in acquia-cms/upstreams. Repo fodlers are symlinked into the appropriate place inside the Drupal file structure via Composer. **Make sure to commit any changes to these projects as part of your daily workflow.**

---

# Resources

Additional [BLT documentation](https://docs.acquia.com/blt/) may be useful. You may also access a list of BLT commands by running this:

```
$ blt
```

## Working With a BLT Project

BLT projects are designed to instill software development best practices (including git workflows).

Our BLT Developer documentation includes an [example workflow](https://docs.acquia.com/blt/developer/dev-workflow/).

### Important Configuration Files

BLT uses a number of configuration (`.yml` or `.json`) files to define and customize behaviors. Some examples of these are:

- `blt/blt.yml` (formerly blt/project.yml prior to BLT 9.x)
- `blt/local.blt.yml` (local only specific blt configuration)
- `box/config.yml` (if using Drupal VM)
- `drush/sites` (contains Drush aliases for this project)
- `composer.json` (includes required components, including Drupal Modules, for this project)

## Resources

- JIRA - https://backlog.acquia.com/browse/ONE
- GitHub - https://github.com/acquia/acquia-cms-project
- TravisCI - https://travis-ci.com/acquia/acquia-cms-project
