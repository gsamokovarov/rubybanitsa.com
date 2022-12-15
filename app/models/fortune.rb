# frozen_string_literal: true

module Fortune
  extend self

  mattr_accessor :fortunes, default: [
    "Уволненията забрави, топ перформър ще си ти 🔝",
    "На баници ще ти върви – най-големите ръки 💪",
    "Късмет, любов... КАРТОФ 🥔",
    "Endless методите научи, end-овете забрави 💎",
    "Харудерен уалет си вземи, криптото не го мисли 💲",
    "С търпение се зареди, на сфетофар ще чакаш ти 🚘",
    "Бизнеса ще ти върви, Shopify не ще те забрани 💰",
    "Рубини подари, голяма любов ще те сполети ❤️",
    "Тестовете си пиши, някой билд да не изплющи 🙅‍♂️",
    "Баницата откажи, веган ще ставаш ти 🥬"
  ]

  def pick
    fortunes.sample
  end
end
