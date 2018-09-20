class FacebookPublisher
  cattr_accessor :instance
  cattr_accessor :user, :password

  def initialize(browser)
    @browser = browser
  end

  def publish(event)
    browser.input "email", user
    browser.input "pass", password
  end

  private

  attr_reader :browser
end
