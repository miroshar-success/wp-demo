#!/usr/bin/env bash

composer update vincit/wordpress-theme-base
git add composer.lock
git commit -m "Update theme"
git push
