## Language-Specific Configurations

### Laravel (PHP)
  
Variables to replace:

```Dockerfile
${BASE_IMAGE}: php:8.3-fpm-bookworm

${ADDITIONAL_PACKAGES}: nodejs npm composer unzip libpq-dev libzip-dev libpng-dev libjpeg-dev libfreetype6-dev

${ZSH_PLUGINS}: laravel composer command-not-found zsh-interactive-cd gitfast

${POST_CREATE_COMMAND}: composer install && npm install


Settings:

```json

"settings": {

"php.validate.executablePath": "/usr/local/bin/php",

"php.suggest.basic": false,

"intelephense.files.maxSize": 5000000

}

```

  

Extensions:

```json

"extensions": [

"bmewburn.vscode-intelephense-client",

"onecentlin.laravel-blade",

"ryannaddy.laravel-artisan",

"codingyu.laravel-goto-view"

]

```


Language Environment Setup:

```

# Install PHP extensions

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \

&& docker-php-ext-install pdo pdo_mysql pdo_pgsql zip gd

  

# Install Composer

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

  

# Install Node.js and npm

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \

&& apt-get install -y nodejs

```


Tools to Install:

```

# Install Laravel tools

RUN composer global require laravel/installer \

&& composer global require phpunit/phpunit \

&& composer global require squizlabs/php_codesniffer

```

### Ruby on Rails

**Variables to replace:**

```
- `${BASE_IMAGE}`: `ruby:3.3-bookworm`
- `${ADDITIONAL_PACKAGES}`: `nodejs npm postgresql-client libpq-dev build-essential libssl-dev libreadline-dev zlib1g-dev`
- `${ZSH_PLUGINS}`: `rails ruby bundler command-not-found zsh-interactive-cd gitfast`
- `${POST_CREATE_COMMAND}`: `bundle install && npm install`

**Settings:**

```json
"settings": {
  "ruby.intellisense": "rubyLocate",
  "ruby.codeCompletion": "rcodetools",
  "ruby.format": "rubocop"
}
```

**Extensions:**

```json
"extensions": [
  "rebornix.ruby",
  "wingrunr21.vscode-ruby",
  "kaiwood.endwise",
  "hridoy.rails-snippets"
]
```

**Language Environment Setup:**

```Dockerfile
# Install bundler and Rails
RUN gem install bundler rails

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs
```

**Tools to Install:**


```Dockerfile
# Install Ruby tools
RUN gem install rubocop \
    && gem install solargraph \
    && gem install rails_best_practices
```

### Django (Python)

**Variables to replace:**

```
- `${BASE_IMAGE}`: `python:3.12-bookworm`
- `${ADDITIONAL_PACKAGES}`: `nodejs npm postgresql-client libpq-dev build-essential`
- `${ZSH_PLUGINS}`: `django python pip command-not-found zsh-interactive-cd gitfast`
- `${POST_CREATE_COMMAND}`: `pip install -r requirements.txt && npm install`
```

**Settings:**

```json
"settings": {
  "python.defaultInterpreterPath": "/usr/local/bin/python",
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "python.formatting.provider": "black"
}
```

**Extensions:**

```json
"extensions": [
  "ms-python.python",
  "ms-python.pylint",
  "ms-python.black-formatter",
  "batisteo.vscode-django"
]
```



**Language Environment Setup:**

```Dockerfile
# Upgrade pip and install poetry
RUN pip install --upgrade pip \
    && pip install poetry

# Set Python environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
```

**Tools to Install:**

```Dockerfile
# Install Python tools
RUN pip install django \
    && pip install black \
    && pip install pylint \
    && pip install pytest \
    && pip install django-extensions
```

