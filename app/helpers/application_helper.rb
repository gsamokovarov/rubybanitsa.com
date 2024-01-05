# frozen_string_literal: true

module ApplicationHelper
  PRIMARY_BUTTON_CLASSES = %w[
    inline-flex
    justify-center
    items-center
    gap-2
    font-semibold
    border-2
    border-black
    rounded
    py-3
    px-8
    bg-black
    hover:bg-brand-600
    text-white
    hover:shadow-brutal
    hover:-translate-x-1
    hover:-translate-y-1
    transition
    ease-in-out
  ].freeze

  def primary_button(url, **options, &block)
    defaults = { class: PRIMARY_BUTTON_CLASSES }

    link_to url, defaults.merge(options), &block
  end

  SECONDARY_BUTTON_CLASSES = %w[
    inline-flex
    justify-center
    items-center
    gap-2
    border-2
    border-black
    rounded-full
    py-2
    px-4
    hover:shadow-brutal
    hover:-translate-x-1
    hover:-translate-y-1
    transition
    ease-in-out
  ].freeze

  def secondary_button(url, **options, &block)
    defaults = { class: SECONDARY_BUTTON_CLASSES }

    link_to url, defaults.merge(options), &block
  end

  def social_link(url, **options, &block)
    defaults = { target: "_blank", class: "text-brand-50 hover:text-brand-300" }
    link_to url, defaults.merge(options), &block
  end

  LINK_PRIMARY_CLASSES = %w[
    text-brand-500 hover:underline hover:decoration-brand-500 hover:underline-offset-4 hover:ease-in-out
  ].freeze

  def link_primary(name = nil, options = nil, html_options = nil, &block)
    defaults = { class: LINK_PRIMARY_CLASSES }

    link_to name, options, defaults.merge(Hash(html_options)), &block
  end
end
