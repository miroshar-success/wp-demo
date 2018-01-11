# WordPress demo project

This project is built on [Seravo/wordpress][1], [Vincit/wordpress][2] & [Vincit/wordpress-theme-base][3] which are documented at their corresponding locations. This is a guide on:

- how to setup the project initially
- how to get the project running on your local machine
- how to update the project dependencies
- how to deploy the project to production (using CI)


## Getting it running
In order to get an existing project running, simply clone it, and run vagrant up.

```
git clone git@github.com:Vincit/wordpress-demo.git
cd wordpress-demo
vagrant up

# navigate to https://wordpress.local/
```

Depending on how you've set things up and the position of the moon, you may or may not need to build your theme(s) afterwards.

## Update dependencies
Simply run `composer update` in the project directory. Please note that Composer is destructive in behaviour, it might overwrite your local changes in some situations, be sure to save, commit & push your changes beforehand.

Any plugins or themes should update painlessly, but [Vincit/wordpress][2] may report conflicting files. You should just respond "yes" if it asks you to discard your local changes. If you had any local modifications, you can use `git status` and `git diff` to find out which files changed and do the necessary procedures to keep your changes. Typically conflicts happen in CircleCI config or in custom scripts.

If a conflict happens and you do not want any changes to a file like the CircleCI config, you can run `git checkout .circleci/config.yml` to get the old version back.

Commit whatever is left to commit when you're happy with the update.

## Deploy
It is recommended to use CircleCI for deploying your project. You can run automated tests to make sure the build didn't break, and automatically deploy to production if it doesn't. It leaves very little margin for human error once you get the config right.

Follow CircleCI's instructions on how to get started, the config file is preconfigured and almost ready to go for CircleCI 2.0.

If you use Private Packagist (packagist.com), you need to provide an composer auth token, and provide it as an environment variable. You can do this from the CircleCI dashboard.
You also have to provide the password to your production instance, so CircleCI can deploy the files. The environment variable is SSHPASS, you can also do this from the dash.

The config in this repository deploys to a 5$ / month Digital Ocean LEMP 1 click server, using the traditional model of installing WordPress.

If you'd like to deploy into Seravo / WP-palvelu, that's fine too. [Vincit/wordpress](https://github.com/Vincit/wordpress/blob/master/.circleci/config.yml) has exactly that.

[1]: https://github.com/Seravo/wordpress
[2]: https://github.com/Vincit/wordpress
[3]: https://github.com/Vincit/wordpress-theme-base
