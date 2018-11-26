# frozen_string_literal: true

FacebookPublisher.user, FacebookPublisher.password =
  ENV["FACEBOOK_USER"], ENV["FACEBOOK_PASSWORD"]

# Setup headless chrome browser with headless Heroku support. See
# https://github.com/jormon/minimal-chrome-on-heroku for more details.
chrome_dir = File.join Dir.pwd, %w(tmp chrome)
FileUtils.mkdir_p chrome_dir

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument "--user-data-dir=#{chrome_dir}"
if chrome_binary = ENV["GOOGLE_CHROME_SHIM"]
  options.add_argument "--no-sandbox"
  options.binary = chrome_binary
end
options.add_argument "--window-size=1200x600"
options.add_argument "--headless" unless Rails.env.development?
options.add_argument "--disable-gpu"

FacebookPublisher.configure do
  Watir::Browser.new :chrome, options: options
end
