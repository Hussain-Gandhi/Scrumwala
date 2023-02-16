FROM php:5.6-composer

WORKDIR /var/www

COPY . .

RUN php composer.phar update

RUN php composer.phar install

ENTRYPOINT php artisan migrate && php artisan serve --host 0.0.0.0 --port 8081
