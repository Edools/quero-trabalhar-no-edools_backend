module TranslationHelper
  # Translate model name
  #
  #   <%= tm Post %>
  #   ...
  #   <%= tm Post, 2 %>
  #
  def translate_model_name(model, count = 1)
    model.model_name.human(:count => count)
  end
  alias_method :tm, :translate_model_name

  # Translate model name pluralized
  #
  #   <%= tm Post %>
  #
  def translate_model_name_pluralized(model)
    translate_model_name(model, count = 2)
  end
  alias_method :tmp, :translate_model_name_pluralized

  # Translate a model attribute from config/locales/models-*.yml for more details.
  #
  #   <%= ta Post, :title %>
  #   ...
  #   <%= ta Post, :title, 2 %>
  #
  def translate_model_attribute(model, attribute, count = 1)
    model.human_attribute_name(attribute, :count => count)
  end
  alias_method :ta, :translate_model_attribute
end
