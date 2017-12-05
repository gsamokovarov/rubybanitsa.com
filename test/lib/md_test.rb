require 'test_helper'

class MDTest < ActiveSupport::TestCase
  test '#render_html renders markdown as HTML' do
    assert_equal <<~MARKDOWN, MD.render_html('**freedom**')
      <p><strong>freedom</strong></p>
    MARKDOWN
  end

  test '#render_plain renders markdown as plain text' do

    assert_equal <<~MARKDOWN, MD.render_plain('**freedom**')
      freedom
    MARKDOWN
  end
end
