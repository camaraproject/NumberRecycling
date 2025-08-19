Feature: CAMARA Number Recycling API, vwip - Operation checkNumberRecycling
  # Environment variables:
  # * api_root: API root of the server URL
  #
  # Testing assets:
  # * A mobile line identified by its phone number "phoneNumber" linked to a user
  # * A mobile line identified by its phone number "phoneNumber" which was cancelled by a user and is now used by another user
  #
  # References to OAS spec schemas refer to schemas specified in number-recycling.yaml

  Background: Common checkNumberRecycling setup
      Given an environment at "apiRoot"
      And the resource "/number-recycling/vwip/check"
      And the header "Content-Type" is set to "application/json"
      And the header "Authorization" is set to a valid access token
      And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
      And the request body is set by default to a request body compliant with the schema

  # Happy path scenarios for number-recycling operation

  @checkNumberRecycling_01_success_request_response_when_phoneNumberRecycled_is_false
    Scenario: Validate successful response when the phone number is linked to User
    Given a valid phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.specifiedDate" is set to a date on which the user signed contracts with Service Provider
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/CheckNumRecyclingInfo"
    And the value of response property "$.phoneNumberRecycled" is false

  @checkNumberRecycling_02_success_request_response_when_phoneNumberRecycled_is_true
  Scenario: Validate successful response when User A canceled the phone number and User B is using the phone number.
    Given a valid phone number supported by the service, identified by the access token or provided in the request body
    And the same phone number was cancelled by the User A and is used by User B
    And the request body property "$.specifiedDate" is set to a date on which the User A signed contracts with Service Provider
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/CheckNumRecyclingInfo"
    And the value of response property "$.phoneNumberRecycled" is true


  # Generic 400 errors

  @checkNumberRecycling_400.01_invalid_specifiedDate
  Scenario Outline: Error 400 when specified date does not comply with the RFC 3339 calendar date format (YYYY-MM-DD).
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body is set to a valid parameter combination with property "$.specifiedDate" set to "<invalid_specifiedDate>"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response property "$.status" is 400

  @checkNumberRecycling_400.2_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @checkNumberRecycling_400.3_empty_request_body
  Scenario: Empty object as request body
    Given the request body is set to "{}"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @checkNumberRecycling_400.4_out_of_range
  Scenario: Error when specifiedDate is out of range
    Given the request body property "$.specifiedDate" is set to a value in the future
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "OUT_OF_RANGE"
    And the response property "$.message" contains a user friendly text

  @checkNumberRecycling_400.5_invalid_argument
  Scenario: Invalid Argument. Generic Syntax Exception
    Given the request body is set to any value which is not compliant with the OAS schema at "/components/schemas/CreateCheckNumRecycling"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text


  # Generic 401 errors

  @checkNumberRecycling_401.1_expired_access_token
  Scenario: Error response for expired access token
    Given the header "Authorization" is set to an expired access token
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response property "$.status" is 401


  @checkNumberRecycling_401.2_invalid_access_token
  Scenario: Error response for invalid access token
    Given the header "Authorization" is set to an invalid access token which is invalid for reasons other than lifetime expiry
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response property "$.status" is 401


  @checkNumberRecycling_401.3_no_header_authorization
  Scenario: Error response for no header "Authorization"
    Given the header "Authorization" is not sent
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response property "$.status" is 401

  
  # Generic 403 errors

  @checkNumberRecycling_403.1_invalid_token_permissions
  Scenario: Access token does not have the required permissions
    Given the header "Authorization" is set to an access token without the required scope
    When the request "checkNumberRecycling" is sent
    Then the response status code is "403"
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text


  # Error scenarios for management of input parameter phoneNumber

  @checkNumberRecycling_C02.01_phone_number_not_schema_compliant
  Scenario: Phone number value does not comply with the schema
      Given the header "Authorization" is set to a valid access which does not identify a single phone number
      And the request body property "$.phoneNumber" does not comply with the OAS schema at "/components/schemas/PhoneNumber"
      When the HTTP "POST" request is sent
      Then the response status code is 400
      And the response property "$.status" is 400
      And the response property "$.code" is "INVALID_ARGUMENT"
      And the response property "$.message" contains a user friendly text
  
  # Only with a 3-legged access token
  @checkNumberRecycling_C02.03_unnecessary_phone_number
  Scenario: Phone number should not be included when it can be deducted from the access token
      Given the header "Authorization" is set to a valid access token identifying a phone number
      And  the request body property "$.phoneNumber" is set to a valid phone number
      When the HTTP "POST" request is sent
      Then the response status code is 422
      And the response property "$.status" is 422
      And the response property "$.code" is "UNNECESSARY_IDENTIFIER"
      And the response property "$.message" contains a user friendly text

  @checkNumberRecycling_C02.04_missing_phone_number
  Scenario: Phone number not included and cannot be deducted from the access token
      Given the header "Authorization" is set to a valid access which does not identify a single phone number
      And the request body property "$.phoneNumber" is not included
      When the HTTP "POST" request is sent
      Then the response status code is 422
      And the response property "$.status" is 422
      And the response property "$.code" is "MISSING_IDENTIFIER"
      And the response property "$.message" contains a user friendly text

  @checkNumberRecycling_C02.05_phone_number_not_supported
  Scenario: Service not available for the phone number
      Given that the service is not available for all phone numbers commercialized by the operator
      And a valid phone number, identified by the token or provided in the request body, for which the service is not applicable
      When the HTTP "POST" request is sent
      Then the response status code is 422
      And the response property "$.status" is 422
      And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
      And the response property "$.message" contains a user friendly text
