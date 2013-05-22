module Tinymce4
  module Rails
    class Engine < ::Rails::Engine
      initializer "init Tinymce4 config" do
        Tinymce4.configure do |c|
          c.selector = 'textarea'
          c.theme = 'modern'
        end
      end

      config.after_initialize do
        Tinymce4.config.language ||= I18n.default_locale
      end

      initializer "load helpers" do |app|
        ActiveSupport.on_load(:action_view) do
          include Tinymce4::Rails::Helper
        end
      end
    end
  end
end