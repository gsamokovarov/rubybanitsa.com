# frozen_string_literal: true

module Fortune
  extend self

  mattr_accessor :fortunes, default: [
    "Таз година ще сполучиш, Strategy Pattern ще научиш. ⚙️",
    "Три пъти го провери, теста да не изгърми. 🔥",
    "Молбата приготви, продукцията ще гърми! ⛔️",
    "Късмет, любов... КАРТОФ! 🥔",
    "С търпение се зареди, на сфетофар ще чакаш ти. 🚘",
    "Бизнеса ще ти вървши, милиони в сървъри ще даваш ти! 💰",
    "Велосипедиса пощади, в бордюра се блъсни! 💥",
    "На рубини ти върви - голяма любов ще те сполети. ❤️",
    "Тестовете си пиши, някой билд да не те изплющи!",
    "Много ще те мързи, цяла година рубокоп ще чистиш ти... 👾",
    "Хич не му мисли, нова работа си намери - а най-дорбе в Ар Би! 🏢",
    "За голямо учене се приготви - React ще чоплиш ти. ⚛️",
    "На голям фен клуб ще се наслаждаваш - на Балкан Руби презентация ще даваш! 🇧🇬",
    "Голям release с щастие ще те дари - бебе ще ти се роди! 👶"
  ]

  Member = Struct.new(:email)

  def pick
    fortunes.sample
  end
end
