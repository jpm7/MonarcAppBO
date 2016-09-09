#!/bin/bash

ln -s vendor/monarc/skeleton app
mkdir -p app/module

ln -s vendor/monarc/backoffice app/module/MonarcBO
ln -s vendor/monarc/core app/module/MonarcCore

cd app
./scripts/compile_translations.sh
./scripts/link_modules_resources.sh
