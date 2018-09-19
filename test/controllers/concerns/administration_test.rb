# frozen_string_literal: true

require "test_helper"

class AdministrationTest < ActionController::TestCase
  class AnonymousController < ApplicationController
    def sign_up
      admin!

      head :no_content
    end

    def path
      render plain: admin_path_for_current_page
    end

    def manual_path
      admin_path_for_current_page "/admin/custom/page"

      render plain: admin_path_for_current_page
    end
  end

  tests AnonymousController

  test "admin check" do
    assert_changes "cookies.signed[:admin]", from: nil, to: true do
      get :sign_up
    end
  end

  test "guesses admin path for page" do
    get :path

    assert_equal "/admin/administration_test/anonymous/path", response.body
  end

  test "can manually set the admin path for page" do
    get :manual_path

    assert_equal "/admin/custom/page", response.body
  end
end
