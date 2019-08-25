# frozen_string_literal: true

# Todos os métodos presentes nesse +helper+ dependem do conteúdo de config/locales
module TranslateHelper
  # Returns a model name translate pluralized
  #
  # @param class_name [String] class name
  def pluralize_model(class_name)
    I18n.t("activerecord.models.#{class_name.to_s.underscore.downcase}")
  end

  # Retorna o nome do model traduzido
  #
  # @param class_name [String|Symbol] o nome do model
  #
  # @return [String] tradução do model
  def translate_model(class_name)
    I18n.t("activerecord.models.#{class_name.to_s.underscore.downcase}")
  end

  # Retorna a tradução do atributo de um model
  #
  # @param class_name [String|Symbol] nome do model
  # @param attr_name [String|Symbol] nome do atributo
  #
  # @return [String] tradução do atributo
  def translate_attr(class_name, attr_name)
    I18n.t("activerecord.attributes.#{class_name.to_s.underscore}.#{attr_name}")
  end

  # Retorna a tradução do atributo de um model
  #
  # @param class_name [String|Symbol] nome do model
  # @param enum_name [String|Symbol] nome do atributo
  # @param enum_value [String|Symbol] nome do atributo
  # @return [String] tradução do enum atributo
  def translate_enum_name(class_name, enum_name, enum_value)
    return nil unless enum_value
    I18n.t("activerecord.attributes.#{class_name.to_s.underscore}.#{enum_name}.#{enum_value}")
  end

  # Retorna um label traduzido
  #
  # @param label_name [String|Symbol] nome da label
  #
  # @return [String] label traduzido
  def label_translate(label_name)
    I18n.t("labels.#{label_name}")
  end

  # Retorna uma flash_message traduzida
  #
  # @param message_name [String|Symbol] nome do flash_message
  #
  # @return [String] tradução do flash_message
  def flash_messages_translate(message_name)
    I18n.t("flash_messages.#{message_name}")
  end

  # Retorna a tradução de um breadcrumb
  #
  # @param name [Symbol] simbolo do nome do breadcrumb
  #
  # @return [String]
  def breadcrumb(name)
    I18n.t("breadcrumb.#{name.to_sym}")
  end
end
