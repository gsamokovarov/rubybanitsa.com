class EventTest < ActiveSupport::TestCase
  test "#human_date represents the date in plain English" do
    event = Event.new(time: Time.parse('01 April 2001 18:30 UTC'))

    assert_equal 'Sunday, 1st of April', event.human_date
  end

  test "#human_time returns time only" do
    event = Event.new(time: Time.parse('01 April 2001 18:30 UTC'))

    assert_equal '18:30', event.human_time
  end
end
