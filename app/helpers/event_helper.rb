# frozen_string_literal: true

module EventHelper
  EVENT_CARD_COLORS = {
    bg_head: %w[
      bg-x-cyan
      bg-x-lime
      bg-x-purple
      bg-x-yellow
      bg-x-magenta
      bg-x-green
      bg-x-orange
    ],
    ring_head: %w[
      ring-x-cyan
      ring-x-lime
      ring-x-purple
      ring-x-yellow
      ring-x-magenta
      ring-x-green
      ring-x-orange
    ],
    bg_footer: %w[
      bg-x-cyan/20
      bg-x-lime/20
      bg-x-purple/20
      bg-x-yellow/20
      bg-x-magenta/20
      bg-x-green/20
      bg-x-orange/20
    ]
  }.freeze

  def event_card_colors(event_id)
    color_index = event_id % EVENT_CARD_COLORS[:bg_head].size

    [
      EVENT_CARD_COLORS[:bg_head][color_index],
      EVENT_CARD_COLORS[:ring_head][color_index],
      EVENT_CARD_COLORS[:bg_footer][color_index]
    ]
  end
end
