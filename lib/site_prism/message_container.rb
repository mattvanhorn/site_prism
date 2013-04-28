module SitePrism::MessageContainer
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def message(message_name, message_key)
      define_method message_name do
        if message_translator
          message_translator.call(message_key)
        else
          message_key.gsub(/[._]/,' ')
        end
      end

      define_method "has_#{message_name.to_s}?" do
        Capybara.using_wait_time 0 do
          message_exists? send(message_name)
        end
      end

      define_method "has_no_#{message_name.to_s}?" do
        Capybara.using_wait_time 0 do
          message_does_not_exist? send(message_name)
        end
      end
    end

    def set_message_translator(&block)
      @message_translator = block
    end

    def message_translator
      @message_translator
    end
  end

  def message_translator
    self.class.message_translator
  end
end
