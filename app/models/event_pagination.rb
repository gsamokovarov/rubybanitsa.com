# frozen_string_literal: true

class EventPagination
  FIRST_EVENT_YEAR = 2017

  attr_accessor :prev_year, :year, :next_year

  def initialize(year)
    @prev_year = year - 1 < FIRST_EVENT_YEAR ? nil : year - 1
    @year = year
    @next_year = year + 1 > Date.current.year ? nil : year + 1
  end
end
