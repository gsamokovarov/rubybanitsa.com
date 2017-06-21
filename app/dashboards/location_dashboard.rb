require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  def display_resource(location)
    location.name
  end
end
