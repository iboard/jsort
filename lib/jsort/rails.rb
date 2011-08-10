module Jsort
  module Rails
    if ::Rails.version < "3.1"
      require 'jsort/rails/railtie'
    else
      require 'jsort/rails/engine'
    end
  end
end