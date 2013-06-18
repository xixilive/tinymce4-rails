#encoding: utf-8

Rake::Task["assets:precompile"].enhance do
  dest   = File.join(Rails.public_path, Rails.application.config.assets.prefix)
  assets_path = File.expand_path(File.dirname(__FILE__) + "/../../vendor/assets/javascripts/tinymce")
  FileUtils.cp_r(Pathname.new(assets_path), dest, :preserve => true)
end