Reproducer for ergebnis/phpunit-slow-test-detector#GH-620
=========================================================

1. Run `install.sh`
2. Run `./tools/bin/phpunit`

Should result in:

```
PHPUnit 10.5.37 by Sebastian Bergmann and contributors.

Runtime:       PHP 8.2.13
Configuration: /home/daniel/www/dantleech/example/phpunit.xml.dist
Extension:     ergebnis/phpunit-slow-test-detector 2.15.1

string(7) "9.5.0.0"
W                                                                   1 / 1 (100%)

Time: 00:00.001, Memory: 22.88 MB

There was 1 risky test:

1) Daniel\Example\Tests\Unit\FooTest::testFoo
This test did not perform any assertions

/home/daniel/www/dantleech/example/tests/Unit/FooTest.php:9

--

1 test triggered 2 PHP warnings:

1) /home/daniel/www/dantleech/example/vendor/composer/ClassLoader.php:576
include(phar:///home/daniel/www/dantleech/example/tools/phpunit/extension/phpunit-slow-test-detector.phar/vendor/composer/../composer/InstalledVersions.php): Failed to open stream: phar error: "vendor/composer/InstalledVersions.php" is not a file in phar "/home/daniel/www/dantleech/example/tools/phpunit/extension/phpunit-slow-test-detector.phar"

Triggered by:

* Daniel\Example\Tests\Unit\FooTest::testFoo
  /home/daniel/www/dantleech/example/tests/Unit/FooTest.php:9

2) /home/daniel/www/dantleech/example/vendor/composer/ClassLoader.php:576
include(): Failed opening 'phar:///home/daniel/www/dantleech/example/tools/phpunit/extension/phpunit-slow-test-detector.phar/vendor/composer/../composer/InstalledVersions.php' for inclusion (include_path='.:/nix/store/hz13b7fkl7sbislkk3b1mm7vfqryjpv9-php-8.2.13/lib/php')

Triggered by:

* Daniel\Example\Tests\Unit\FooTest::testFoo
  /home/daniel/www/dantleech/example/tests/Unit/FooTest.php:9

OK, but there were issues!
Tests: 1, Assertions: 0, Warnings: 2, Risky: 1.
```
