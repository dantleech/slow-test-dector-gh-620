#!/usr/bin/env bash
#!/usr/bin/env bash

SLOW_TEST_DETECTOR_VERSION=2.16.0
PHPUNIT_VERSION=11.4.2

set -e

rm -Rf tools/phpunit
mkdir -p tools/phpunit

if [[ -z $(which curl) ]]; then
    echo "ERROR: Either install 'curl' or run this inside the docker container via 'docker/sdk cli make unit-test"
    exit 1
fi

curl --output phpunit --location https://phar.phpunit.de/phpunit-${PHPUNIT_VERSION}.phar
chmod +x phpunit
mv phpunit tools/phpunit/phpunit

# important: the file-extension (.phar) must be specified
curl --output phpunit-slow-test-detector.phar --location https://github.com/ergebnis/phpunit-slow-test-detector/releases/download/${SLOW_TEST_DETECTOR_VERSION}/phpunit-slow-test-detector.phar
chmod +x phpunit-slow-test-detector.phar
mkdir -p tools/phpunit/extension/
mv phpunit-slow-test-detector.phar tools/phpunit/extension/
