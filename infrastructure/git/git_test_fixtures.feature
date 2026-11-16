Feature: Hermetic git test fixtures

  Git test helpers create temporary repositories in environments that may or
  may not have a global git identity. A fixture that commits must carry its
  own identity so the same test passes on a developer machine and on a CI
  runner with no global git configuration.

  Scenario: An embedded repository can commit without an ambient identity
    Given a nested repository created by the test helper
    And no global git identity is available
    When the fixture commits a file inside the nested repository
    Then the commit succeeds
    And the parent repository can stage the remaining real file

  Scenario: A fixture without local identity cannot borrow an ambient identity
    Given a repository with no repository-local git identity
    And author identity variables are set in the environment
    When the git test helper runs a commit
    Then the commit is rejected

  Scenario: The git test helper ignores ambient author identity
    Given author and committer identity variables are set in the environment
    And a global git config and GIT_CONFIG_COUNT overrides name another author
    When a fixture commits in a temporary repository with local identity
    Then the commit uses the repository-local identity
