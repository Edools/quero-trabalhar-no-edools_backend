module TranslationHelper
  def translate_model_name(model, count = 1)
    model.model_name.human count: count
  end
  alias tm translate_model_name

  def translate_model_name_pluralized(model)
    translate_model_name model, 2
  end
  alias tmp translate_model_name_pluralized

  def translate_model_attribute(model, attribute, count = 1)
    model.human_attribute_name attribute, count: count
  end
  alias ta translate_model_attribute
end
