# frozen_string_literal: true

require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "first name is inferred from the full name" do
    contact = build :contact, name: "Genadi Samokovarov"

    assert_equal "Genadi", contact.first_name
  end
end
