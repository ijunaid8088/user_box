# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( views/welcome/index.css )
Rails.application.config.assets.precompile += %w( views/welcome/welcome.min.css )
Rails.application.config.assets.precompile += %w( views/welcome/first_sign_in.css )
Rails.application.config.assets.precompile += %w( views/mailbox/index.css )
Rails.application.config.assets.precompile += %w( views/mailbox/icon.css )
Rails.application.config.assets.precompile += %w( views/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( views/dt.boot.css )
Rails.application.config.assets.precompile += %w( views/dashboard/select.css )
Rails.application.config.assets.precompile += %w( views/dashboard/metisMenu.min.css )
Rails.application.config.assets.precompile += %w( views/dashboard/morris.css )
Rails.application.config.assets.precompile += %w( views/dashboard/style.css )
Rails.application.config.assets.precompile += %w( views/dashboard/icon.css )
