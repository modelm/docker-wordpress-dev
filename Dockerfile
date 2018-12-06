FROM wordpress

RUN mv "$PHP_INI_DIR"/php.ini-development "$PHP_INI_DIR"/php.ini
