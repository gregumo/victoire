@reset-schema
@mink:selenium2
@alice(Page) @alice(Blog) @alice(BlogTemplate)
Feature: Edit an article

Background:
    Given I maximize the window
    And I am on homepage

    Scenario: I create a new article and update its slug
        Then I should see "Blog"
        When I follow "Blog"
        Then I should see "The Jedi Network"
        And I should see "Create a post now"
        When I follow "Create a post now"
        Then I should see "Create a new post"
        And I should see "If this field is empty, the slug will be autogenerated"
        When I fill in "article_translations_en_name" with "I'm your father."
        When I fill in "article_translations_en_description" with "This is a great description."
        When I select "First blog template" from "Template"
        And I follow "Create"
        And I wait 5 seconds
        Then I should be on "/en/the-jedi-network/i-m-your-father"
        And I wait 3 seconds
        When I open the settings menu
        And I wait 3 seconds
        Then I should see "Post settings"
        And I should see "I'm your father"
        And I should not see "If this field is empty, the slug will be autogenerated"
        When I fill in "article_settings_translations_en_slug" with "new-custom-slug"
        And I follow "UPDATE"
        And I wait 5 seconds
        Then I should be on "/en/the-jedi-network/new-custom-slug"
