module SpeakerHelper
  def multiple_speakers(speakers)
    speakers
      .map { |s| link_to(s.name, s.github_url) }
      .to_sentence(last_word_connector: ' and ')
      .html_safe
  end
end
