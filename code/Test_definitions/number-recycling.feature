Feature: CAMARA Number Recycling API, v0.1.1 - Operation number-recycling
  # Environment variables:
  # * api_root: API root of the server URL
  #
  # References to OAS spec schemas refer to schemas specifies in number-recycling.yaml

  Background: Common checkNumberRecycling setup
      Given an environment at "apiRoot"
      And the resource "/number-recycling/v0.1/check"
      And the header "Content-Type" is set to "application/json"
      And the header "Authorization" is set to a valid access token
      And the header "x-correlator" is set to a UUID value
      And the request body is set by default to a request body compliant with the schema

  # Happy path scenarios for number-recycling operation

  @Number_Recycling_01_success_request_response_when_phoneNumberRecycled_is_false
    Scenario: Validate successful response when the phone number is linked to User
    Given a valid phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.specifiedDate" is set to a date on which the user signed contracts with Service Provider.
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/CheckNumRecyclingInfo"
    And the value of response property "$.phoneNumberRecycled" is false

  @Number_Recycling_02_success_request_response_when_phoneNumberRecycled_is_true
  Scenario: Validate successful response when User A canceled the phone number and User B is using the phone number.
    Given a valid phone number supported by the service,  identified by the access token or provided in the request body
    And the request body property "$.phoneNumber" is set to a valid phone number which was cancelled by the User A and is used by User B.
    And the request body property "$.specifiedDate" is set to a date on which the User A signed contracts with Service Provider.
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/CheckNumRecyclingInfo"
    And the value of response property "$.phoneNumberRecycled" is true

  # Generic 400 errors

  @Number_Recycling_400.01_invalid_specifiedDate
  Scenario Outline: Error 400 when specified date does not comply with the RFC 3339 calendar date format (YYYY-MM-DD).
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body is set to a valid parameter combination with property "$.specifiedDate" set to "<invalid_specifiedDate>"
    When the request "checkNumberRecycling" is sent
    Then the response status code is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response property "$.status" is 400
    
  @Number_Recycling_400.02_phone_number_not_schema_compliant
  Scenario: Phone number value does not comply with the schema
    Given the header "Authorization" is set to a valid access token which does not identify a single phone number
    And the request body property "$.phoneNumber" does not comply with the OAS schema at "/components/schemas/PhoneNumber"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # Generic 401 errors

  @Number_Recycling_401.01_expired_access_token
  Scenario: Error response for expired access token
    Given the header "Authorization" is set to an expired access token
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response property "$.status" is 401

  # Generic 422 errors

  @Number_Recycling_422.01_service_not_applicable
  Scenario: Service not applicable for the phone number
    Given that service is not supported for all phone numbers managed by the network operator
    And a valid phone number, identified by the token or provided in the request body, for which the service is not applicable
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
    And the response property "$.message" contains a user friendly text

  @Number_Recycling_422.02_missing_identifier
  Scenario: No valid identifier has been provided
    Given the header "Authorization" is set to a valid access token from which the phone number cannot be deducted
    And the request body property "$.phoneNumber" is not present
    When the HTTP "POST" request is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "MISSING_IDENTIFIER"
    And the response property "$.message" contains a user friendly text
