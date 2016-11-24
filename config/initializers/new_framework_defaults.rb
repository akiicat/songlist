# Be sure to restart your server when you modify this file.
#
# This file contains migration options to ease your Rails 5.0 upgrade.
#
# Read the Rails 5.0 release notes for more info on each option.

# Enable per-form CSRF tokens. Previous versions had false.
Rails.application.config.action_controller.per_form_csrf_tokens = true

# Enable origin-checking CSRF mitigation. Previous versions had false.
Rails.application.config.action_controller.forgery_protection_origin_check = true

# Make Ruby 2.4 preserve the timezone of the receiver when calling `to_time`.
# Previous versions had false.
ActiveSupport.to_time_preserves_timezone = true

# Require `belongs_to` associations by default. Previous versions had false.
Rails.application.config.active_record.belongs_to_required_by_default = false

# Do not halt callback chains when a callback returns false. Previous versions had true.
ActiveSupport.halt_callback_chains_on_return_false = false

# Configure SSL options to enable HSTS with subdomains. Previous versions had false.
Rails.application.config.ssl_options = { hsts: { subdomains: true } }

# DEPRECATION WARNING: Time columns will become time zone aware in Rails 5.1.
# This still causes `String`s to be parsed as if they were in `Time.zone`, and `Time`s to be converted to `Time.zone`.
# To silence this deprecation warning, add the following:
# config.active_record.time_zone_aware_types = [:datetime, :time]
# To keep the old behavior, you must add the following to your initializer:
Rails.application.config.active_record.time_zone_aware_types = [:datetime]
