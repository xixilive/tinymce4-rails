require "active_support/configurable"
require "active_support/core_ext"

$:.unshift(File.dirname(__FILE__))

require 'tinymce4/version'

module Tinymce4
  include ActiveSupport::Configurable
  class << self
    #TODO:: pre-define some profiles
  end
end

require 'tinymce4/rails' if defined?(::Rails)
