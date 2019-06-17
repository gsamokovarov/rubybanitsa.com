# frozen_string_literal: true

class SlacksController < ApplicationController
  def show
    redirect_to Slack.invite_url
  end
end
