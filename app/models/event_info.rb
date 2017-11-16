class EventInfo
  delegate_missing_to :@event

  def initialize(event)
    @event = event
  end

  def human_title
    "#{human_date} in #{venue}"
  end

  def human_date
    "#{t :weekday}, #{t :ordinal_day} of #{t :month_name}"
  end

  def human_time
    t :time_only
  end

  def venue
    location&.name
  end

  def address
    location&.address
  end

  private

  def t(time_format)
    time.to_s(time_format)
  end
end
