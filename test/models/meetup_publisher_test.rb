require 'test_helper'

class MeetupPublisherTest < ActiveSupport::TestCase
  test 'the class acts as a default client to the Ruby-Banitsa meetup' do
    assert_respond_to MeetupPublisher, :publish
    assert_equal 'Ruby-Banitsa', MeetupPublisher.send(:instance).send(:urlname)
  end
end
