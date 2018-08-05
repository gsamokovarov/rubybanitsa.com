# frozen-string-literal: true

require "test_helper"

class JobRendererTest < ActiveSupport::TestCase
  setup do
    ActiveStorage::Current.host = "localhost"
  end

  test "can render markdown photos from patterns like [1]" do
    job = company.jobs.create! title: "Job Title", description: <<~MD
      [1]

      Patterns like the one above and below will be converted to markdown image
      tags.

      [2]
    MD

    job.photos.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")
    job.photos.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")

    assert_equal <<~HTML, JobRenderer.render_html(job)
      <p><img src="#{Link.url_for(job.photos[0])}" alt="photo 1"></p>

      <p>Patterns like the one above and below will be converted to markdown image
      tags.</p>

      <p><img src="#{Link.url_for(job.photos[1])}" alt="photo 2"></p>
    HTML
  end

  test "strips the photos placeholders in plain renders" do
    job = company.jobs.create! title: "Job Title", description: <<~MD
      [1]

      Patterns like the one above and below will be converted to markdown image
      tags.

      [2]
    MD

    job.photos.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")
    job.photos.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")

    assert_equal <<~PLAIN, JobRenderer.render_plain(job)
      Patterns like the one above and below will be converted to markdown image
      tags.
    PLAIN
  end

  private

  def company(name: nil, description: nil, **rest)
    Company.create! \
      name: name || "Fan See",
      description: description || "We give you the bestest fans you'll ever see!",
      **rest
  end
end
