MoneyRails.configure do |config|

  # set the default currency
  config.default_currency = :aud

  # set the default localization
  config.locale_backend = :i18n

  # set the default rounding mode
  config.rounding_mode = BigDecimal::ROUND_HALF_EVEN

end