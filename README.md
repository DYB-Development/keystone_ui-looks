# keystone_ui-looks

Ready-made looks for [keystone_ui](https://github.com/DYB-Development/keystone_ui).
A look is one CSS file that sets keystone_ui-styles' `--ks-` variables under
`:root[data-look="<name>"]`, so every keystone_ui component follows it.

## Install

```ruby
# Gemfile
gem "keystone_ui-looks"
```

Run `bundle install` and restart the app. The gem registers its looks with
keystone_ui at boot, so no initializer is needed, and `keystone_source.css`
imports them into the app's Tailwind build.

The gem sets no default look, so the app keeps its current look until the app
names one with `KeystoneUi.configure { |config| config.default_look = :brutalist }`
or a user or account picks one through keystone_ui-colors.

## Looks

| Name | What it looks like |
|---|---|
| `brutalist` | Square corners, thick black or white borders, bold weights, no shadows, and black on white (white on black on a dark page). |
| `compact` | Follows Atlassian: small 3px corners, a blue accent, thin light grey borders and tight spacing. |
| `rounded` | Follows Google's Material: pill-shaped buttons, a purple accent, soft shadows, medium weights and Roboto, falling back to the system sans-serif font when the app does not load Roboto. |
| `soft` | Follows Apple: large rounded corners, the device's system font, faint borders, wider spacing and a system blue accent. |

A look sets only the component accent variables, so an app's own classes that
read the accent scale keep the accent a user or account picked.

## Development

```bash
bundle install
bundle exec rake test
bin/rubocop
```

To add a look, add its file to `app/assets/tailwind/keystone_ui_looks/`, add its
name to `KeystoneUi::Looks::Engine::LOOKS`, and add a row for it to the table
above. The gem registers every name on that list at boot.

## License

MIT
