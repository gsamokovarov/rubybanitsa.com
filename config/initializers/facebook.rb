FacebookPublisher.user, FacebookPublisher.password =
  ENV["FACEBOOK_USER"], ENV["FACEBOOK_PASSWORD"]

FacebookPublisher.instance = FacebookPublisher.new \
  Watir::Browser.new :chrome, options: Selenium::WebDriver::Chrome::Options.new
