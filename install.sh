#!/usr/bin/env bash
#!/usr/bin/env bash

set -e
mkdir -p tools/phpunit

if [[ -z $(which curl) ]]; then
    echo "ERROR: Either install 'curl' or run this inside the docker container via 'docker/sdk cli make unit-test"
    exit 1
fi

curl --output phpunit --location https://phar.phpunit.de/phpunit-10.5.37.phar
chmod +x phpunit
mv phpunit tools/phpunit/phpunit

# important: the file-extension (.phar) must be specified
curl --output phpunit-slow-test-detector.phar --location https://github.com/ergebnis/phpunit-slow-test-detector/releases/download/2.15.1/phpunit-slow-test-detector.phar
chmod +x phpunit-slow-test-detector.phar
mkdir -p tools/phpunit/extension/
mv phpunit-slow-test-detector.phar tools/phpunit/extension/
