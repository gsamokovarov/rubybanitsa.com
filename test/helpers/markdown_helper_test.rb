# frozen_string_literal: true

require "test_helper"

class MarkdownHelperTest < ActionView::TestCase
  test "rendering markdown as HTML" do
    content = render_markdown <<~MD
      This is a [link](example.com).
    MD

    assert_equal <<~HTML, content
      <p>This is a <a href="example.com">link</a>.</p>
    HTML
  end

  test "rendering markdown as plain text" do
    content = render_markdown <<~MD, plain: true
      This is a [link](example.com).
    MD

    assert_equal <<~PLAIN, content
      This is a link (example.com).

    PLAIN
  end
end
