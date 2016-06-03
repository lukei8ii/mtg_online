class Message
  attr_accessor :sender
  attr_accessor :text

  def initialize(sender, text)
    @sender = sender
    @text   = text
  end
end
