# encoding: utf-8
class TestPageWithMessage < SitePrism::Page
  set_url '/page_with_message.htm'

  #messages
  set_message_translator do |key|
    messages = {
      :en => {
        'hi.there' => "hi there",
        'sign_up.thank_you' => 'thanks for joining'
      },
      :pt => {
        'hi.there' => "oi lá",
        'sign_up.thank_you' => 'obrigado por se juntar'
      }
    }
    messages[:en].fetch(key)
  end

  message :greeting, 'hi.there'
  message :thank_you, 'sign_up.thank_you'
end

