# Changelog

## [Unreleased]

### Added
- The test suite fails, naming the look and the variable, when a look sets a `--ks-` variable the installed keystone_ui-styles does not define, or a colour without its dark partner.
- CI runs daily against the newest keystone_ui-styles, so a renamed variable there fails the looks gem's CI without a change here.

## [0.2.0] - 2026-09-28

### Added
- The `compact` look, which follows Atlassian: small 3px corners, a blue accent, thin light grey borders and tight spacing, with a dark value for every colour.
- The `rounded` look, which follows Google's Material: pill-shaped buttons, a purple accent, soft shadows, medium weights and Roboto with a system fallback, with a dark value for every colour.
- The `soft` look, which follows Apple: large rounded corners, the device's system font, faint borders, wider spacing and a system blue accent, with a dark value for every colour.

## [0.1.0] - 2026-09-28

### Added
- The `brutalist` look, registered with keystone_ui at boot: square corners, thick borders, bold weights, no shadows and high-contrast colours, with a dark value for every colour.
