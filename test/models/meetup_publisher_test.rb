require 'test_helper'

class MeetupPublisherTest < ActiveSupport::TestCase
  test 'the class acts as a default client to the Ruby-Banitsa meetup' do
    assert_respond_to MeetupPublisher, :publish
    assert_equal 'Ruby-Banitsa', MeetupPublisher.send(:instance).send(:urlname)
  end

  test '#publish events to meetup' do
    meetup = MeetupPublisher.new('Meetup-API-Testing')

    venue = Venue.create!(name: 'N-working', address: 'Somewhere rue', place_id: 'foo')
    event = Event.create_with_venue(time: Time.current,
                                    description: '**Impulsive** event',
                                    venue_id: venue.id)

    error = assert_raises Meetup::Error do
      meetup.publish(event)
    end

    error.each do |entry|
      assert_equal 'member_error', entry.code
      assert_equal 'Not authorized to create or edit events in this group', entry.message
    end
  end
end
