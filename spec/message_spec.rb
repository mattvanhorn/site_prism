require 'spec_helper'

class PageWithMessage < SitePrism::Page
  message :thank_you_message, 'some.msg.key'
end

describe SitePrism::Page do
  it "should respond to message" do
    SitePrism::Page.should respond_to :message
  end

  it "should set a method translator" do
    SitePrism::Page.should respond_to :set_message_translator
  end

  it "should define a method for the message" do
    PageWithMessage.new.should respond_to(:thank_you_message)
  end

  it "should define a matcher for the message existence" do
    PageWithMessage.new.should respond_to(:has_thank_you_message?)
  end

  it "should define a matcher for the message non-existence" do
    PageWithMessage.new.should respond_to(:has_no_thank_you_message?)
  end

  it "should return a translated message if there is a translator" do
    class PageWithTranslator < SitePrism::Page
      set_message_translator { |key| {'foo' => 'good', 'bar' => 'bad'}.fetch(key) }
      message :good_message, 'foo'
    end
    page = PageWithTranslator.new
    page.good_message.should == 'good'
  end

  it "should return the message key humanized if there is no translator" do
    class PageWithNoTranslator < SitePrism::Page
      message :good_message, 'foo.bar_baz'
    end
    page = PageWithNoTranslator.new
    page.good_message.should == 'foo bar baz'
  end
end
