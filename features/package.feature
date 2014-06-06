Feature: Packager
  As a CLI
  I want to create a package or distribution

  Scenario: Create a distribution
    When I run `chefdist dist features.tgz`
    Then the output should contain "features.tgz"