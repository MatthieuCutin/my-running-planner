Feature: Race
  In order to use the application
  I need to be able to create and update races trough the API.

  # "@createSchema" creates a temporary SQLite database for testing the API
  @createSchema
  Scenario: Create a User OK
    When I send a "POST" request to "/users" with body:
    """
    {"email": "matthieu.cutin@acseo-conseil.fr", "name": "Matthieu", "plainPassword": "acseo"}
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON node "@type" should contain "User"

  Scenario: Create a Race OK
    When I send a "POST" request to "/races" with body:
    """
    {"date": "2016-08-26T17:00:00+00:00", "distance": "170", "ascension": "10000", "name" : "Ultra Trail du Mont Blanc", "runner" : "/users/1"}
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON node "@type" should contain "Race"

  Scenario: Retrieve one Race
    When I send a "GET" request to "/races/1"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"

  Scenario: Get next Race NOK
    When I send a "GET" request to "/races/next/2016-02-25T19:00:00+00:00"
    Then the response status code should be 401
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/json"

  @dropSchema
  Scenario: Get next Race OK
    When after authentication with method "POST" on "login_check" as "matthieu.cutin@acseo-conseil.fr" with password "acseo", i send an authenticated "GET" request to "/races/next/2016-02-25T19:00:00+00:00" with body:
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
      {
          "@context": "\/contexts\/Race",
          "@id": "\/races\/1",
          "@type": "Race",
          "date": "2016-08-26T17:00:00+02:00",
          "distance": 170,
          "ascension": 10000,
          "name": "Ultra Trail du Mont Blanc",
          "runner": {
              "@id": "\/users\/1",
              "@type": "User",
              "name": "Matthieu"
          }
      }
    """
