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
| `sharp` | Tight and flat: 2px corners on controls and badges, 4px corners on cards, tight spacing, medium weights, the system font, no shadow on cards, one thin shadow on menus, and no colours of its own, so the palette sets every colour. |
| `soft` | Follows Apple: large rounded corners, the device's system font, faint borders, wider spacing and a system blue accent. |

A look sets only the component accent variables, so an app's own classes that
read the accent scale keep the accent a user or account picked.

## Colour catalogue

The gem also lists the colours a person or account can choose from.

- `KeystoneUi::Looks::Palettes.accent(:blue)` returns an accent shade scale, a
  hash of hex colours keyed 50, 100 and 200 through 900, then 950. The accents are
  `blue`, `emerald`, `cyan`, `indigo`, `violet` and `rose`.
- `KeystoneUi::Looks::Palettes.surface(:zinc)` returns a surface shade scale.
  The surfaces are `zinc`, `slate`, `gray`, `neutral` and `stone`.
- `KeystoneUi::Looks::Palettes.generate_shades("#3b82f6")` turns a six-digit hex
  colour into a shade scale of the same shape, with the colour itself at 500.
- `KeystoneUi::Looks::Templates.all` returns the named colour templates `ocean`,
  `forest`, `twilight`, `coral` and `arctic`, each with an accent, a surface, a
  background, a text colour, a label and a description.
  `KeystoneUi::Looks::Templates[:ocean]` returns one of them, and
  `KeystoneUi::Looks::Templates.names` lists their names.

An unknown accent, surface or template name raises `KeyError`.

## Preset themes

The gem lists six complete themes a person or account can pick by name.

- `KeystoneUi::Looks::Themes.all` returns the presets `graphite`, `harbor`,
  `fern`, `terracotta`, `heather` and `ledger`, each with a label, a
  one-sentence description and a theme.
- `KeystoneUi::Looks::Themes[:harbor]` returns one of them, and
  `KeystoneUi::Looks::Themes.names` lists their names. An unknown name raises
  `KeyError`.

A preset's theme is keyed by the shadcn role names keystone_ui-preferences
saves. Each colour role holds a `"light"` and a `"dark"` hex colour. Each shape
and type setting (radius, spacing, border width, letter spacing, fonts, font
weights and shadow) holds one `"light"` value. Fonts are system fonts only, so
every preset works in any app.

- `graphite`: plain greys with a near-black primary and 0.5rem corners.
- `harbor`: cool blues on a faintly blue page with 0.625rem corners.
- `fern`: deep leaf greens with serif headings and 0.75rem corners.
- `terracotta`: warm clay and amber on a cream page, serif headings and 0.375rem corners.
- `heather`: muted violet and lilac greys with 1rem corners.
- `ledger`: ink and teal with 0.125rem corners, tight spacing, medium weights and no shadow.

Every text colour has a contrast ratio of at least 4.5 to 1 on the fill it sits
on, in light and in dark.

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
