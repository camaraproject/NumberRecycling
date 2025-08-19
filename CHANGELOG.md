# Changelog Number Recycling

## Table of Contents

- [r2.2](#r22)
- [r2.1](#r21)
- [r1.3](#r13)
- [r1.2](#r12)
- [r1.1](#r11)

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r2.2

## Release Notes

This public release contains the definition and documentation of
* number-recycling v0.2.0

The API definition(s) are based on
* Commonalities v0.6.0
* Identity and Consent Management v0.4.0

## number-recycling v0.2.0

**number-recycling v0.2.0 is the second release version of the Number-Recycling API.**

- number-recycling v0.2.0 API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r2.2/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r2.2/code/API_definitions/number-recycling.yaml&nocors)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r2.2/code/API_definitions/number-recycling.yaml)

### Added
* Add a missing summary for operation POST /check to YAML file in https://github.com/camaraproject/NumberRecycling/pull/64

### Changed
* Update versions in API and test definitions back to wip in https://github.com/camaraproject/NumberRecycling/pull/63

### Fixed
* N/A

### Removed
* N/A

## New Contributors
* N/A

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/compare/r1.3...r2.2

# r2.1

## Release Notes

This pre-release contains the definition and documentation of
* number-recycling v0.2.0-rc.1

The API definition(s) are based on
* Commonalities v0.6.0-rc.1
* Identity and Consent Management v0.4.0-rc.1

## number-recycling v0.2.0-rc.1

**number-recycling v0.2.0-rc.1 is the first release-candidate version for v0.2.0 of the Number-Recycling API.**

- number-recycling v0.2.0-rc.1 API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r2.1/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r2.1/code/API_definitions/number-recycling.yaml&nocors)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r2.1/code/API_definitions/number-recycling.yaml)

### Added
* Add text on undocumented errors to OAS definition in https://github.com/camaraproject/NumberRecycling/pull/56

### Changed
* Update x-correlator pattern in https://github.com/camaraproject/NumberRecycling/pull/59
* Update test plan and align with Commonalities guidelines in https://github.com/camaraproject/NumberRecycling/pull/60

### Fixed
* N/A

### Removed
* Remove AUTHENTICATION_REQUIRED error code in https://github.com/camaraproject/NumberRecycling/pull/47

## New Contributors
* N/A

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/compare/r1.3...r2.1

# r1.3

## Release Notes

This release contains the definition and documentation of
* number-recycling v0.1.1

The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## number-recycling v0.1.1

**number-recycling v0.1.1 is the second public release version of the Number-Recycling API.**

- number-recycling v0.1.1 API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r1.3/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r1.3/code/API_definitions/number-recycling.yaml&nocors)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r1.3/code/API_definitions/number-recycling.yaml)

### Added
* N/A

### Changed
* N/A

### Fixed
* Fix the Missing description field in 422 Missing Identifier in https://github.com/camaraproject/NumberRecycling/pull/44

### Removed
* N/A

## New Contributors
* N/A

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/commits/r1.3

# r1.2

## Release Notes

This release contains the definition and documentation of
* number-recycling v0.1.0

The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## number-recycling v0.1.0

**number-recycling v0.1.0 is the first public release version of the Number-Recycling API.**

- number-recycling v0.1.0 API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r1.2/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r1.2/code/API_definitions/number-recycling.yaml&nocors)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r1.2/code/API_definitions/number-recycling.yaml)

**Full Changelog**: https://github.com/camaraproject/NumberRecycling/commits/r1.2

# r1.1

## Release Notes

This release contains the definition and documentation of
* number-recycling v0.1.0-rc.1

The API definition(s) are based on
* Commonalities r2.2
* Identity and Consent Management r2.2

## number-recycling v0.1.0-rc.1

**number-recycling v0.1.0-rc.1 is the first release-candidate version for v0.1.0 of the Number-Recycling API.**

- number-recycling v0.1.0-rc.1 API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r1.1/code/API_definitions/number-recycling.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/NumberRecycling/r1.1/code/API_definitions/number-recycling.yaml&nocors)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/NumberRecycling/blob/r1.1/code/API_definitions/number-recycling.yaml)

**Main changes**

* Initial contribution of the API number-recycling
