class EventInfo
  delegate_missing_to :@event

  def initialize(event)
    @event = event
  end

  def summary
    description.lines.first
  end

  def human_title
    if Time.current.year == time.year
      human_date
    else 
      "#{human_date}, #{t :year}"
    end
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
