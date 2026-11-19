# Changelog NumberRecycling

<!-- TOC:START -->
## Table of Contents
- **[r3.3](#r33)**
- [r3.2](#r32)
- [r3.1](#r31)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r3.3

## Release Notes

This public release contains the definition and documentation of
* number-recycling 0.3.0

The API definition(s) are based on
* Commonalities r4.4 (0.9.0)
* Identity and Consent Management r4.2 (0.5.0)

## number-recycling 0.3.0

**number-recycling 0.3.0 is an initial public version of this API.**

Changes documented below are compared to version 0.2.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r3.3/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r3.3/code/API_definitions/number-recycling.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r3.3/code/API_definitions/number-recycling.yaml)

### Breaking changes

* N/A

### Added

* Test scenarios were added by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/84 and https://github.com/camaraproject/NumberRecycling/pull/130
  - "C02.02_phone_number_not_found"
  - "400.05_missing_required_property"
  - "400.06_invalid_x-correlator"
* Section "How to choose specifiedDate by ASP (API consumer)" was added to the API description by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/93 and https://github.com/camaraproject/NumberRecycling/pull/122, and @albertoramosmonagas in https://github.com/camaraproject/NumberRecycling/pull/139
  - It states that a `specifiedDate` outside the API provider's supported window, or in the future, is answered with `400 OUT_OF_RANGE`
* HowtoUseAPI.md file was added and linked from the README and the API description by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/102 and @albertoramosmonagas in https://github.com/camaraproject/NumberRecycling/pull/139
* Note on CIBA and the recommended JWT Bearer flow with `tel:` prefix was added by @AxelNennker in https://github.com/camaraproject/NumberRecycling/pull/110

### Changed

* Aligned with CAMARA Commonalities r4.4 (0.9.0) by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/101, https://github.com/camaraproject/NumberRecycling/pull/120, https://github.com/camaraproject/NumberRecycling/pull/127 and https://github.com/camaraproject/NumberRecycling/pull/128, @yamamoto0104 in https://github.com/camaraproject/NumberRecycling/pull/78, and @albertoramosmonagas in https://github.com/camaraproject/NumberRecycling/pull/139
  - Error responses and examples were aligned with the Commonalities r4.4 error catalogue; status and code values are unchanged
  - `minLength`/`maxLength` of 10 were set for `specifiedDate`, matching the RFC 3339 full-date format already required by `format: date`
  - Section "Request body strictness" was added: request bodies with undeclared properties are rejected with `400 INVALID_ARGUMENT`
* Aligned the test definitions with the Commonalities r4.4 test template by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/130
  - Scenario identifiers were renumbered and partly renamed, e.g. `400.4_out_of_range` to `400.07_out_of_range` and `403.1_invalid_token_permissions` to `403.01_missing_access_token_scope`
* Notes of Scenario 1 and Scenario 2 in the API description were aligned with the CAMARA whitepaper "CAMARA APIs: Functional Differences" by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/106 and https://github.com/camaraproject/NumberRecycling/pull/119
  - The Scenario 2 note now describes a specified date on which a previous user held the phone number (response `true`); it replaced the note on a specified date without a contract for the phone number

### Fixed

* N/A

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/compare/r2.2...r3.3

# r3.2

## Release Notes

This release candidate contains the definition and documentation of
* number-recycling 0.3.0-rc.2

The API definition(s) are based on
* Commonalities r4.4 (0.9.0)
* Identity and Consent Management r4.2 (0.5.0)

## number-recycling 0.3.0-rc.2

**number-recycling 0.3.0-rc.2 is a release-candidate version of this API.**

Changes documented below are compared to version 0.3.0-rc.1.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r3.2/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r3.2/code/API_definitions/number-recycling.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r3.2/code/API_definitions/number-recycling.yaml)

### Breaking changes

* N/A

### Added

* Add HowtoUseAPI.md file by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/102
* Note on CIBA and the recommended JWT Bearer flow with `tel:` prefix by @AxelNennker in https://github.com/camaraproject/NumberRecycling/pull/110
* Behavioural note for Scenario 2 (`phoneNumberRecycled: true`) by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/119

### Changed

* Updated `400 OUT_OF_RANGE` error description by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/122
* `info.description` templates aligned with Commonalities r4.4 by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/127
* Error responses and examples aligned with the Commonalities r4.4 error catalogue; status and code values unchanged by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/128
* Test definitions aligned with the Commonalities r4.4 test templates by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/130

### Fixed

* `specifiedDate` `minLength`/`maxLength` set to 10 to match the RFC 3339 full-date format by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/120

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/compare/r3.1...r3.2

# r3.1

## Release Notes

This release candidate contains the definition and documentation of
* number-recycling 0.3.0-rc.1

The API definition(s) are based on
* Commonalities 0.8.0
* Identity and Consent Management 0.5.0

## number-recycling 0.3.0-rc.1

**number-recycling 0.3.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.2.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r3.1/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r3.1/code/API_definitions/number-recycling.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r3.1/code/API_definitions/number-recycling.yaml)

### Breaking changes

* N/A

### Added

* Add "C02.02_phone_number_not_found" test scenario by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/84
* Clarification how to use the specifiedDate by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/93

### Changed

* Alignment with Commonalities R4.3 for RC by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/101

### Fixed

* Response schema not aligned with Commonalities guidelines by @yamamoto0104 in https://github.com/camaraproject/NumberRecycling/pull/78
* Alignment with whitepaper by @Masa8106 in https://github.com/camaraproject/NumberRecycling/pull/106
    - Note: This may be a behavioral change as it clarifies previously underspecified behavior.

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/compare/r2.2...r3.1
