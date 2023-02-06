clean::
	rm -rf vendor

vendor/autoload.php: composer.lock composer.json
	composer install
	touch vendor/autoload.php

composer.lock: composer.json
	composer update
	touch composer.lock

install:: vendor/autoload.php

node_modules/.package-lock.json:
	npm ci

node_modules: node_modules/.package-lock.json

clean::
	rm -rf node_modules/

node_modules/heroicons: node_modules

assets/icons/outline: node_modules/heroicons
	ln -s ../../node_modules/heroicons/24/outline assets/icons/outline

install:: assets/icons/outline

clean::
	rm -f assets/icons/outline

public/build/manifest.json: node_modules/.package-lock.json
	npm run build

install:: public/build/manifest.json

clean::
	rm -rf public/build
