# frozen_string_literal: true

module Admin::NavigationHelper
  def admin_sidebar_links
    [
      { header: "Meetups" },
      { name: "Events", path: admin_events_path },
      { name: "Talks", path: admin_talks_path },
      { name: "Speakers", path: admin_speakers_path },
      { name: "Venues", path: admin_venues_path },
      { name: "Sponsorships", path: admin_sponsorships_path },
      { header: "Job board" },
      { name: "Jobs", path: admin_jobs_path },
      { name: "Companies", path: admin_companies_path },
      { name: "Contacts", path: admin_contacts_path }
    ]
  end
end
