Feature: Race
  In order to use the application
  I need to be able to create and update races trough the API.

  # "@createSchema" creates a temporary SQLite database for testing the API
  @createSchema @dropSchema
  Scenario: Get Races OK
    Given I load fixtures from folder "ACSEO/Bundle/MyRunningPlannerBundle/DataFixtures/ORM/crud"
    When I send a "GET" request to "/races"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
      {
          "@context": "\/contexts\/Race",
          "@id": "\/races",
          "@type": "hydra:PagedCollection",
          "hydra:nextPage": "\/races?page=2",
          "hydra:totalItems": 6,
          "hydra:itemsPerPage": 5,
          "hydra:firstPage": "\/races",
          "hydra:lastPage": "\/races?page=2",
          "hydra:member": [
              {
                  "@id": "\/races\/1",
                  "@type": "Race",
                  "date": "2016-05-26T17:00:00+02:00",
                  "distance": 10,
                  "ascension": 100,
                  "name": "Course 1",
                  "runner": {
                      "@id": "\/users\/1",
                      "@type": "User",
                      "name": "Matthieu"
                  }
              },
              {
                  "@id": "\/races\/2",
                  "@type": "Race",
                  "date": "2016-05-26T17:00:00+02:00",
                  "distance": 10,
                  "ascension": 100,
                  "name": "Course 2",
                  "runner": {
                      "@id": "\/users\/1",
                      "@type": "User",
                      "name": "Matthieu"
                  }
              },
              {
                  "@id": "\/races\/3",
                  "@type": "Race",
                  "date": "2016-05-26T17:00:00+02:00",
                  "distance": 10,
                  "ascension": 100,
                  "name": "Course 3",
                  "runner": {
                      "@id": "\/users\/1",
                      "@type": "User",
                      "name": "Matthieu"
                  }
              },
              {
                  "@id": "\/races\/4",
                  "@type": "Race",
                  "date": "2016-05-26T17:00:00+02:00",
                  "distance": 10,
                  "ascension": 100,
                  "name": "Course 4",
                  "runner": {
                      "@id": "\/users\/1",
                      "@type": "User",
                      "name": "Matthieu"
                  }
              },
              {
                  "@id": "\/races\/5",
                  "@type": "Race",
                  "date": "2016-05-26T17:00:00+02:00",
                  "distance": 10,
                  "ascension": 100,
                  "name": "Course 5",
                  "runner": {
                      "@id": "\/users\/1",
                      "@type": "User",
                      "name": "Matthieu"
                  }
              }
          ]
      }
    """
