require File.expand_path('../lib/tinymce4/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["xixilive"]
  gem.email         = ["xixilive@gmail.com"]
  gem.description   = %q{Rails3 assets pipeline and helpers for tinymce4, lang packages are built-in}
  gem.summary       = %q{Rails3 assets pipeline and helpers for tinymce4, lang packages are built-in}
  gem.homepage      = "https://github.com/xixilive/tinymce4-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tinymce4-rails"
  gem.require_paths = ["lib"]
  gem.version       = Tinymce4::VERSION
end
