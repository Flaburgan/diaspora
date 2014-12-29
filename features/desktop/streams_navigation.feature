@javascript
Feature: Navigate between streams

  Background:
    Given a user with username "bob"
    And I sign in as "bob@bob.bob"
    And I have an aspect called "Others"
    And I search for "#diaspora"
    And I press "Follow #diaspora"

  Scenario: Navigate between streams
    When I sign in as "bob@bob.bob"
    Then the stream title should be "Stream"
    And the contacts title should be "People in your stream"

    When I follow "My aspects" within "#left-navbar"
    Then the stream title should be "Besties, Unicorns and Others"
    And the contacts title should be "Besties, Unicorns and Others"

    When I follow "My activity" within "#left-navbar"
    Then the stream title should be "My activity"
    And the contacts title should be "People in your activity stream"

    When I follow "@Mention" within "#left-navbar"
    Then the stream title should be "@Mentions"
    And the contacts title should be "People who mentioned you"

    When I follow "Commented posts" within "#left-navbar"
    Then the stream title should be "Commented posts"
    And the contacts title should be "People whose posts you commented on"

    When I follow "Liked posts" within "#left-navbar"
    Then the stream title should be "Liked posts"
    And the contacts title should be "People whose posts you like"

    When I follow "Public activity" within "#left-navbar"
    Then the stream title should be "Public activity"
    And the contacts title should be "Recent posters"

    When I follow "Stream" within "#left-navbar"
    Then the stream title should be "Stream"
    And the contacts title should be "People in your stream"

    When I follow "#Followed tags" within "#left-navbar"
    Then the stream title should be "#Followed tags"
    And the contacts title should be "People who dig these tags"

    When I follow "#diaspora" within "#left-navbar"
    Then I should see "#diaspora" within ".stream_container h2"
