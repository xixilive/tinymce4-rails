require 'spec_helper'
require 'tinymce4-rails'
require 'tinymce4/rails/helper'
require 'action_view'
require 'action_view/helpers'

describe Tinymce4::Rails::Helper do

  let(:view){
    Class.new{
      attr_accessor :output_buffer
      include ActionView::Helpers
      include Tinymce4::Rails::Helper
    }.new
  }

  before(:each){ Tinymce4.config.clear }

  context '#tinymce' do
    it "without jquery options" do
      view.should_receive(:tinymce_init).with(:option1=>'value1')
      view.tinymce do |c|
        c.option1 = 'value1'
      end

      view.should_receive(:tinymce_init).with(:option1=>'value1')
      view.tinymce(:option1=>'value1')
    end

    it "with jquery options" do
      view.should_receive(:tinymce_jquery).with(:option1=>'value1')
      view.tinymce(:jquery=>true) do |c|
        c.option1 = 'value1'
      end

      view.should_receive(:tinymce_jquery).with(:option1=>'value1')
      view.tinymce(true, :option1=>'value1')
    end
  end

  context '#tinymce_assets' do
    it 'without jquery' do
      view.should_receive(:javascript_include_tag).with(*["tinymce/tinymce.min"])
      view.tinymce_assets
    end

    it 'with jquery' do
      view.should_receive(:javascript_include_tag).with(*["tinymce/tinymce.min", "tinymce/jquery.tinymce.min"])
      view.tinymce_assets(true)
    end
  end

  context '#tinymce_init' do
    it "should use tinymce.init" do
      view.tinymce(:selector=>'textarea').should == "<script type=\"text/javascript\">\n//<![CDATA[\ntinyMCE.init({\"selector\":\"textarea\"});\n//]]>\n</script>"

      view.tinymce{|c| c.selector = 'textarea' }.should == "<script type=\"text/javascript\">\n//<![CDATA[\ntinyMCE.init({\"selector\":\"textarea\"});\n//]]>\n</script>"
    end
  end

  context '#tinymce_jquery' do
    it "should use tinymce jquery plugin" do
      view.tinymce(true,:selector=>'textarea',:language=>'en').should == "<script type=\"text/javascript\">\n//<![CDATA[\n;jQuery(function(){\n\tjQuery('textarea').tinymce({\"language\":\"en\"});\n});\n//]]>\n</script>"

      view.tinymce(true){|c| 
        c.selector = 'textarea'
        c.language = 'en'
      }.should == "<script type=\"text/javascript\">\n//<![CDATA[\n;jQuery(function(){\n\tjQuery('textarea').tinymce({\"language\":\"en\"});\n});\n//]]>\n</script>"
    end
  end

end