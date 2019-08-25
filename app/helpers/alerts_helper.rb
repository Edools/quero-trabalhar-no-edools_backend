# frozen_string_literal: true

module AlertsHelper
  # Retorna um alert específico passado por parametro
  #
  # @param alert_name [Symbol] simbolo do alert
  #
  # @return [String]
  def specific_alert(alert_name)
    I18n.t("alerts.#{alert_name.to_sym}")
  end
end
