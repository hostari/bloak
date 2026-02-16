# HEAD

- Remove all inline styles to be compatible with CSP rules disallowing inline styles
- Switch to TinyMDE as markdown editor
- Use checkmark from asset url instead of data:svg to be compatible with CSP rules disallowing images from data attributes

# 2.1.0 (2026-02-16)

- [BREAKING] Upgraded pagy dependency from ~> 8.0 to ~> 43.0
- Updated controller to use `Pagy::Method` instead of deprecated `Pagy::Backend`
- Modernized pagy initializer with v43 syntax (extras are now autoloaded)
- Updated view helpers to use new pagy 43 instance method API:
  - `pagy.a_lambda()` instead of `pagy_link_proc()`
  - `@pagy.series_nav(:bootstrap)` instead of `pagy_bootstrap_nav(@pagy)`
- Added ostruct and benchmark gems for Ruby 4.0 compatibility
- This resolves dependency conflicts with Rails apps using pagy ~> 43.x

## Migration Guide for 2.1.0

If you are upgrading from Bloak 2.0.x to 2.1.x, please note the pagy API changes:

### Pagy Upgrade (8.x → 43.x)

Bloak now uses pagy 43.x which has a modernized API. If you have custom pagination code:

**View Helper Changes:**
```ruby
# Before (pagy 8.x)
<%== pagy_bootstrap_nav(@pagy) %>
<% link = pagy_link_proc(pagy, 'class="btn"') %>

# After (pagy 43.x)
<%== @pagy.series_nav(:bootstrap) %>
<% link = pagy.a_lambda('class="btn"') %>
```

**Controller Changes:**
```ruby
# Before (pagy 8.x)
include Pagy::Backend

# After (pagy 43.x)
include Pagy::Method
```

**Configuration Changes:**
```ruby
# Before (pagy 8.x)
Pagy::VARS[:items] = 20
require 'pagy/extras/bootstrap'

# After (pagy 43.x)
Pagy.options[:items] = 20
# No require needed - extras are autoloaded!
```

For more details, see the [Pagy 43 Upgrade Guide](https://ddnexus.github.io/pagy/guides/upgrade-guide/).

# 2.0.0 (2026-02-16)

- [BREAKING] Bloak now requires Rails 8.0 or higher (minimum version: Rails 8.0)
- [BREAKING] Replaced Turbolinks with Turbo Rails (Hotwire) for modern JavaScript navigation
- Updated all dependencies to be compatible with Rails 8.1.2
- Migrated from `turbolinks` gem (v5.2) to `turbo-rails` gem (v2.0)
- Updated JavaScript event attributes from `data-turbolinks-track` to `data-turbo-track`
- Updated JavaScript asset pipeline to require `@hotwired/turbo-rails` instead of `turbolinks`

## Migration Guide for 2.0.0

If you are upgrading from Bloak 1.x to 2.x, please note the following breaking changes:

### Rails Version Requirement
- **Rails 8.0+ is now required**. If you are still on Rails 7.x, you must upgrade your application to Rails 8.0 or higher before upgrading Bloak.

### Turbolinks → Turbo Migration
Bloak has migrated from Turbolinks to Turbo Rails (part of the Hotwire stack). This is a significant change that affects JavaScript event handling:

#### JavaScript Event Changes
If you have custom JavaScript code that listens to Turbolinks events, you will need to update them:

**Before (Turbolinks):**
```javascript
document.addEventListener('turbolinks:load', function() {
  // Your code here
});

document.addEventListener('turbolinks:before-cache', function() {
  // Your code here
});
```

**After (Turbo):**
```javascript
document.addEventListener('turbo:load', function() {
  // Your code here
});

document.addEventListener('turbo:before-cache', function() {
  // Your code here
});
```

#### Common Event Mapping
- `turbolinks:load` → `turbo:load`
- `turbolinks:before-visit` → `turbo:before-visit`
- `turbolinks:visit` → `turbo:visit`
- `turbolinks:before-cache` → `turbo:before-cache`
- `turbolinks:before-render` → `turbo:before-render`
- `turbolinks:render` → `turbo:render`

#### Additional Resources
- [Turbo Rails Documentation](https://turbo.hotwired.dev/)
- [Migrating from Turbolinks to Turbo](https://github.com/hotwired/turbo-rails)

### Dependencies Updated
The following dependencies were updated to their Rails 8 compatible versions:
- `rails`: 7.2.3 → 8.1.2
- `turbolinks`: removed
- `turbo-rails`: added (v2.0+)
- `bootstrap`: 5.3.5 → 5.3.8
- `friendly_id`: 5.5.1 → 5.6.0
- `meta-tags`: 2.22.2 → 2.22.3
- Various other dependency updates for Rails 8 compatibility

# 1.0.0 (2023-11-03)

- [BREAKING] Bloak now requires Rails 7.0 or higher to make use of ActiveStorage named variants

# 0.4.0 (2023-10-31)

- [BREAKING] Bloak raises a `RuntimeException` when `admin_user` or `admin_password` aren't configured
- [BREAKING] configuration options `items` was renamed to `num_items`, please update your `config/initializers/bloak.rb`
- added additional configuration options to engine: `num_featured_posts`, `max_toc_depth`
- `site_name` now defaults to parent application name if unset (the application that mounts the bloak engine)
- `copyright` now uses the `site_name` as a default
- defined `cover_image` variants in `has_one_attached` and reference variants in view templates
- preload image variants to speed up rendering time
- raise a `RecordNotFound` exception when calling the `/tag/:topic` route with an unknown topic
- raise a `RecordNotFound` exception when calling the `/author/:name` route with an unknown author name
- render a maximum of `Bloak.num_featured_posts` in featured posts
- render a maximum of `Bloak.num_items` in posts before pagination occurs
- render a table of contents depth of maximum `Bloak.max_toc_depth`
- Added `Makefile`

# 0.3.3 (2023-10-26)

- Fix issue reported by GitHub scanner

# Older

- See commit log
