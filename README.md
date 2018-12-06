# Docker WordPress Dev

Run a WordPress development environment with Docker Compose.

## Install

     docker-compose up -d
     docker-compose run --rm wp-cli install-wordpress

## Services

### Apache

The `wordpress` container exposes Apache on host port `8080`:

[http://localhost:8080](http://localhost:8080)
[http://localhost:8080/wp-admin](http://localhost:8080/wp-admin)
[http://localhost:8080/wp-json](http://localhost:8080/wp-json)

The default credentials for the WordPress admin user are `wordpress`/`wordpress`.

### MySQL

The `mysql` container exposes MySQL on host port `8306`:

    mysql -uwordpress -pwordpress -h127.0.0.1 -P8306 wordpress

You can also run commands on the container:

    docker-compose run mysql mysql -hmysql -uwordpress -pwordpress wordpress

### WP-CLI

The `wp-cli` container supports WP-CLI commands as well as arbitrary shell code e.g.

    docker-compose run --rm wp-cli plugin list
    docker-compose run --rm wp-cli php -i

## Examples:

Import a mysqldump:

    docker-compose run mysql mysql -hmysql -uwordpress -pwordpress wordpress < example.sql
    docker-compose run --rm wp-cli search-replace https://example.com http://localhost:8080

View service logs:

    docker-compose logs wordpress
    docker-compose logs mysql

Alias wp-cli:

    alias dwp='docker-compose run --rm wp-cli'

## FAQ

* How to import a SQL dump when the `mysql` container starts?

    https://github.com/docker-library/docs/tree/master/mariadb#initializing-a-fresh-instance

* How to install PHP extensions?

    https://github.com/docker-library/docs/blob/master/php/README.md#how-to-install-more-php-extensions

* Why does the UID of www-data differ between the `wordpress` & `wordpress:cli` images?

    https://github.com/docker-library/wordpress/issues/256
