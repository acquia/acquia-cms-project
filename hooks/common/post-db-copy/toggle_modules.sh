#!/bin/sh
# Cloud Hook: Acquia CMS install,update and modules toggle.

# Check if BLT is present.
FILE=../../../blt.yml
if test -f "$FILE"; then

which drush
drush --version

site="$1"
target_env="$2"

# Fresh install of Acquia CMS. We need to clear cache first in case memcache is
# enabled, else there will be a collision on site install.
/usr/local/bin/drush9 @$site.$target_env cr
# Toggle Modules based on the environment.
/usr/local/bin/drush9 @$site.$target_env acms:toggle:modules

fi
