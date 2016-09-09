#!/bin/bash
composer update
npm install
./scripts/post-install.sh
