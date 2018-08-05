# frozen_string_literal: true

require "test_helper"

class SpeakerHelperTest < ActionView::TestCase
  S = Struct.new(:name, :github_url)

  test "handles single speaker" do
    genadi = S.new("Genadi Samokovarov", "https://github.com/gsamokovarov")

    assert_equal <<-HTML.squish, multiple_speakers([genadi])
      <a href="https://github.com/gsamokovarov">Genadi Samokovarov</a>
    HTML
  end

  test "handles two speakers" do
    genadi = S.new("Genadi Samokovarov", "https://github.com/gsamokovarov")
    rado = S.new("Radoslav Stankov", "https://github.com/rstankov")

    assert_equal <<-HTML.squish, multiple_speakers([genadi, rado])
      <a href="https://github.com/gsamokovarov">Genadi Samokovarov</a> and
      <a href="https://github.com/rstankov">Radoslav Stankov</a>
    HTML
  end

  test "handles many more speakers" do
    genadi = S.new("Genadi Samokovarov", "https://github.com/gsamokovarov")
    rado = S.new("Radoslav Stankov", "https://github.com/rstankov")
    kolio = S.new("Nikola Ivanov", "https://github.com/kolio")

    assert_equal <<-HTML.squish, multiple_speakers([genadi, rado, kolio])
      <a href="https://github.com/gsamokovarov">Genadi Samokovarov</a>,
      <a href="https://github.com/rstankov">Radoslav Stankov</a> and
      <a href="https://github.com/kolio">Nikola Ivanov</a>
    HTML
  end
end
