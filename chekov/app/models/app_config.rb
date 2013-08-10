class AppConfig < Settingslogic
  source "#{Rails.root}/config/chekov.yml"
  namespace Rails.env
end