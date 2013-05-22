# Tinymce4::Rails

Rails assets pipeline and helpers for tinymce4, lang packages are built-in.

This Gem is working with Rails 3.2.*.

## Installation

Add this line to your application's Gemfile:

    gem 'tinymce4-rails'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tinymce4-rails

And then append following lines to your application.js

    //= require tinymce/tinymce.min
    //= require tinymce/jquery.tinymce.min (options for jquery plugin)

## Usage

### default configuration

    {
      selector: 'textarea',
      language: 'I18n.default_locale of your application',
      theme: 'modern'
    }
    
### custom configure

    Tinymce4.configure do |c|
      c.selector = 'textarea',
      c.plugins = [
        'advlist autolink lists link image charmap print preview hr anchor pagebreak',
        'insertdatetime media nonbreaking save table contextmenu directionality'
      ]
      ......
    end

### helpers

#### tinymce

    <%= tinymce :selector => '#my-editor', :theme => 'my_custom_theme',...... %>
    
    With block

    <%= tinymce do |config|
      config.selector = '#my-editor'
      config.theme = 'my_custom_theme'
    end %>

    =>  <script type="text/javascript">
          tinymce.init({
            selector: '#my-editor',
            theme: 'my_custom_theme',
            ......
          });
        </script>

    With jquery options and block

    <%= tinymce(:jquery => true) do |config|
      config.selector = '#my-editor'
      config.theme = 'my_custom_theme'
    end %>

    Or

    <%= tinymce(true) do |config|
      config.selector = '#my-editor'
      config.theme = 'my_custom_theme'
    end %>

    =>  <script type="text/javascript">
          $(function(){
            $.tinymce({
              selector: '#my-editor',
              theme: 'my_custom_theme',
              ......
            });
          });
        </script>

#### assets
    <%= tinymce_assets %>

    =>  <script type="text/javascript" src="assets/tinymce/tinymce.min.js"></script>

    Or with jquery:

    <%= tinymce_assets(true) %>

    =>  <script type="text/javascript" src="assets/tinymce/tinymce.min.js"></script>
        <script type="text/javascript" src="assets/tinymce/jquery.tinymce.min.js"></script>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
