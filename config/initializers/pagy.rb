# frozen_string_literal: true

# Pagy initializer file (v43)
# Customize only what you really need. Pagy works with zero configuration.
# See https://ddnexus.github.io/pagy/docs/api/pagy/

# Pagy Options
# All the Pagy.options are set for all the Pagy instances but can be overridden
# per instance by passing them to the #pagy controller method

# Instance options
# See https://ddnexus.github.io/pagy/docs/api/pagy/#options
# Pagy.options[:page]   = 1     # default
# Pagy.options[:items]  = 20    # default

# Other Options
# Pagy.options[:slots]     = [1,4,4,1]       # default (was :size in v8)
# Pagy.options[:page_key]  = 'page'          # default (was :page_param symbol in v8)
# Pagy.options[:fragment]  = 'fragment'      # example (# is now optional)
# Pagy.options[:link_extra] = 'data-turbo-action="advance"'  # example
# Pagy.options[:i18n_key]  = 'pagy.item_name'  # default

# Paginators
# See https://ddnexus.github.io/pagy/docs/api/pagy/

# Array pagination: Use pagy(:offset, array, ...) - no require needed
# Countless pagination: Use pagy(:countless, collection, ...) - no require needed
# Keyset pagination: Use pagy(:keyset, collection.order(...), ...) - no require needed

# Search pagination: Paginate search results
# See https://ddnexus.github.io/pagy/docs/extras/#search-extras
# For Elasticsearch: pagy(:elasticsearch_rails, Model.search(...), ...)
# For Meilisearch: pagy(:meilisearch, Model.search(...), ...)
# For Searchkick: pagy(:searchkick, Model.search(...), ...)
# Pagy.options[:search_method] = :pagy_search  # default

# CSS Framework Support
# In pagy 43+, framework helpers are autoloaded - no require needed!
# See https://ddnexus.github.io/pagy/docs/extras/#frontend-extras

# To use Bootstrap pagination in your views, simply call:
#   @pagy.series_nav(:bootstrap)     # Standard nav
#   @pagy.series_nav_js(:bootstrap)  # Responsive nav with JavaScript
#   @pagy.input_nav_js(:bootstrap)   # Combo nav with JavaScript
#
# Other frameworks work the same way: :bulma, :foundation, :materialize, :semantic, :uikit

# Navigation helpers (now instance methods in v43):
# In views, use:
#   @pagy.series_nav(...)           # was pagy_nav(@pagy, ...)
#   @pagy.series_nav_js(...)        # was pagy_nav_js(@pagy, ...)
#   @pagy.input_nav_js(...)         # was pagy_combo_nav_js(@pagy, ...)
#   @pagy.series_nav(:bootstrap)    # was pagy_bootstrap_nav(@pagy)
#
# Navigation options:
# Pagy.options[:slots] = [1,4,4,1]  # default (was :size in v8)
# Pagy.options[:end] = true         # default (was :ends in v8)
# Pagy.options[:compact] = false    # default

# Additional Features

# API Headers: HTTP response headers useful for API pagination
# See https://ddnexus.github.io/pagy/docs/extras/#headers
# In your controller: response.headers.merge!(@pagy.headers_hash)
# Pagy.options[:headers_map] = { page: 'current-page', limit: 'page-limit', count: 'total-count', pages: 'total-pages' }

# Items selector: Allow clients to request custom items per page
# See https://ddnexus.github.io/pagy/docs/extras/#limit
# Enable by setting: Pagy.options[:client_max_limit] = 100
# In views: @pagy.limit_tag_js(...)  # was pagy_limit_selector_js(@pagy, ...)

# Metadata: Provide pagination data to JavaScript frameworks
# See https://ddnexus.github.io/pagy/docs/extras/#metadata
# In your API: render json: { pagy: @pagy.data_hash, data: @records }
# Pagy.options[:data_keys] = [:url_template, :count, :page, :prev, :next, :last]  # example

# JSON:API: Nested query strings (e.g., ?page[number]=2&page[size]=100)
# See https://ddnexus.github.io/pagy/docs/extras/#jsonapi
# Enable with: pagy(:offset, collection, jsonapi: true, ...)
# Pagy.options[:jsonapi] = true  # enable globally

# Range error handling: By default, out-of-range pages serve empty results
# To raise errors instead: Pagy.options[:raise_range_error] = true
# Check if page is in range: @pagy.in_range?  # was !pagy.overflow? in v8

# JavaScript Setup (for *_js helpers)
# See https://ddnexus.github.io/pagy/docs/api/javascript/

# For apps with asset pipeline (Propshaft, Importmaps, Sprockets):
# Rails.application.config.assets.paths << Pagy::ROOT.join('javascripts')

# For apps with builders (esbuild, Webpack, jsbundling-rails):
# Pagy.sync_javascript(Rails.root.join('app/javascript'), 'pagy.mjs') if Rails.env.development?

# Then add to your JavaScript: window.addEventListener("turbo:load", Pagy.init)

# I18n (Internationalization)
# See https://ddnexus.github.io/pagy/docs/api/i18n/

# In v43, locales are AUTOLOADED when your app uses them - no configuration needed!
# Pagy's internal I18n is ~18x faster and uses ~10x less memory than the i18n gem

# Custom dictionary files (optional):
# Pagy::I18n.pathnames << 'path/to/custom-locale.yml'

# Use Rails i18n gem instead (slower):
# Pagy.translate_with_the_slower_i18n_gem!

# Pagy.options[:i18n_key] = 'pagy.item_name'  # default
