# cable/config.ru
require ::File.expand_path('../../config/environment', __FILE__)
Rails.application.eager_load!

run ActionCable.server