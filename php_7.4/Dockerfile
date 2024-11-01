FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    iputils-ping \ 
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
    intl \
    gd \
    soap \
    zip \
    mysqli \
    pdo \
    pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

RUN git config --global user.name "yuriy"
RUN git config --global user.email yuriy.cherepnev@gmail.com

WORKDIR /home/yuriy/projects/tyres

EXPOSE 9000

CMD ["php-fpm"]
