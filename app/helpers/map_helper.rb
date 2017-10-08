module MapHelper
  mattr_accessor(:google_api_key)
  mattr_accessor(:google_api_url) { "https://www.google.com/maps/embed/v1/place" }

  def map_tag(event, key: google_api_key, url: google_api_url)
    tag.iframe \
      width: '100%',
      height: '300',
      frameborder: 0,
      allowfullscreen: true,
      src: "#{url}?key=#{key}&q=place_id:#{event.venue.place_id}"
  end
end
