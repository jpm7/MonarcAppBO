#!/bin/bash

ROOTDIR=$(pwd)

# Link the Zend part of the app
ln -s vendor/monarc/skeleton app
mkdir -p app/module

# Link vendors into vendor/monarc/skeleton
ln -s ${ROOTDIR}/vendor ${ROOTDIR}/vendor/monarc/skeleton/vendor

ln -s ${ROOTDIR}/vendor/monarc/backoffice ${ROOTDIR}/vendor/monarc/skeleton/module/MonarcBO
ln -s ${ROOTDIR}/vendor/monarc/core ${ROOTDIR}/vendor/monarc/skeleton/module/MonarcCore

# Link the Angular part of the app
cp -f ${ROOTDIR}/package.json ${ROOTDIR}/app/package.json

cd ${ROOTDIR}/app
npm install

cd node_modules/ng_backoffice
npm install

cd ../..

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

