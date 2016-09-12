#!/bin/bash

# Link the Zend part of the app
ln -s vendor/monarc/skeleton app
mkdir -p app/module

# Link vendors into vendor/monarc/skeleton
cd vendor/monarc/skeleton
ln -s ../../../vendor

cd ../../../app/module

ln -s ../vendor/monarc/backoffice MonarcBO
ln -s ../vendor/monarc/core MonarcCore

cd ../..

# Link the Angular part of the app
NODE_MODULES_PATH=$(pwd)/node_modules

cd node_modules
npm install grunt-shell
npm install grunt-angular-gettext
npm install grunt-contrib-concat
npm install grunt-contrib-uglify

cd ../app
ln -s $NODE_MODULES_PATH node_modules

# Compile stuff needed for the minified frontend
./scripts/compile_translations.sh
./scripts/link_modules_resources.sh

# Prepare the config files
cp config/application.config.php-dist-BO config/application.config.php
cp config/autoload/local.php.dist config/autoload/local.php

echo "========================="
echo "Install complete!"
echo "Remember to configure app/config/autoload/local.php!"
echo "========================="

