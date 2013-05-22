module Tinymce4
  module Rails
    module Helper
      def tinymce *args
        options = args.extract_options!
        jquery = options.delete(:jquery) || !!args.first
        options = Tinymce4.config.merge(options)
        yield(options) if block_given?
        jquery ? tinymce_jquery(options.to_hash) : tinymce_init(options.to_hash)
      end

      def tinymce_assets jquery = false
        assets = ["tinymce/tinymce.min"]
        assets << "tinymce/jquery.tinymce.min" if jquery
        javascript_include_tag *assets
      end

      def tinymce_jquery_assets
        tinymce_assets(true)
      end

      private
      def tinymce_init options
        javascript_tag do
          "tinyMCE.init(#{options.to_json});".html_safe
        end
      end

      def tinymce_jquery options
        selector = options.delete(:selector) || options.delete("selector") || 'textarea'
        javascript_tag do
          ";jQuery(function(){\n\tjQuery('#{selector}').tinymce(#{options.to_json});\n});".html_safe
        end
      end
    end
  end
end