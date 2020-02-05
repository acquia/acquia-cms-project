<?php

namespace Example\Blt\Plugin\Commands;

use Acquia\Blt\Robo\Commands\Tests\TestsAllCommand;

/**
 * Defines custom commands in the "tests" namespace.
 */
class AcquiaCmsTestsAllCommand extends TestsAllCommand {

  /**
   * Runs all tests, including Behat, PHPUnit, and security updates check.
   *
   * @command tests
   *
   * @aliases ta test tests:all
   * @hook replace-command tests:all
   */
  public function tests() {
    $this->invokeCommands([
      'tests:behat:run',
      'tests:server:start',
      'tests:phpunit:run',
      'tests:server:kill',
      'tests:drupal:run',
      'tests:security:check:updates',
      'tests:security:check:composer',
      'tests:frontend:run',
    ]);
  }

}
