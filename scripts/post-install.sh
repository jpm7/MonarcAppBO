#!/bin/bash

# Link the Zend part of the app
ln -s vendor/monarc/skeleton app
mkdir -p app/module

ln -s vendor/monarc/backoffice app/module/MonarcBO
ln -s vendor/monarc/core app/module/MonarcCore

# Link the Angular part of the app
ln -s node_modules app/node_modules

# Compile stuff needed for the minified frontend
cd app
./scripts/compile_translations.sh
./scripts/link_modules_resources.sh

# Prepare the config files
cp config/application.config.php-dist-BO config/application.config.php
cp config/autoload/local.php.dist config/autoload/local.php

echo "========================="
echo "Install complete!"
echo "Remember to configure app/config/autoload/local.php!"
echo "========================="

