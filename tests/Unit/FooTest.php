<?php

namespace Daniel\Example\Tests\Unit;

use PHPUnit\Framework\TestCase;

class FooTest extends TestCase
{
    public function testFoo(): void
    {
        var_dump(\Composer\InstalledVersions::getVersion('phpunit/phpunit'));
    }
}
