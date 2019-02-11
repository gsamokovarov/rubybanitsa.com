# frozen_string_literal: true

class FacebookPublisher
  cattr_accessor :user, :password

  class << self
    delegate :published?, :publish, to: :instance

    def configure(&block)
      @browser_builder = block
    end

    private

    def instance
      @instance ||= new(browser_builder)
    end

    def browser_builder
      @browser_builder.call
    end
  end

  delegate_missing_to :@browser

  def initialize(browser)
    @browser = browser
  end

  def published?(event)
    event.facebook_url.present?
  end

  def publish(event)
    return if published?(event)

    goto "https://facebook.com"

    if title !~ /(.+ )?Facebook/
      text_field(name: "email").set user
      text_field(name: "pass").set password
      label(id: "loginbutton").click

      wait_for { title =~ /(.+ )?Facebook/ }
    end

    goto "https://www.facebook.com/pg/rubybanitsa/events/?ref=page_internal"

    wait_for { title =~ /(.+ )?Ruby Banitsa - Events/ }

    a("data-testid": "event-create-button").click

    text_field("data-testid": "event-create-dialog-name-field").set info(event).human_date
    text_field("data-testid": "event-create-dialog-where-field").set info(event).venue
  end

  private

  def info(event)
    EventInfo.new(event)
  end

  def wait_for(*args, &block)
    Watir::Wait.until(*args, &block)
  end
end
