# Changelog NumberRecycling

<!-- TOC:START -->
## Table of Contents
- [r3.1](#r31)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

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
