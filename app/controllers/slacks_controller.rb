# frozen_string_literal: true

class SlacksController < ApplicationController
  def show
    redirect_to Settings.slack_invite_url, allow_other_host: true
  end
end
