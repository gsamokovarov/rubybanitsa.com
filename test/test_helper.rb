require_relative '../config/environment'

require 'rails/test_help'
require 'active_record/sql_counter'

class ActiveSupport::TestCase
  def assert_sql_queries(count, &block)
    assert_equal count, ActiveRecord::SQLCounter.count(&block)
  end
end
