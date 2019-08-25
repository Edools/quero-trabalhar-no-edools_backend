# app/helpers/models_helper.rb
module ModelsHelper
  # Retorna a tradução para o nome do model
  #
  # @param klass [Class] classe do model
  #
  # @return [String]
  def model_name(klass)
    klass.model_name.human
  end

  # Retorna o plural da tradução do nome do model
  def pluralize_model_name(klass)
    model_name(klass).pluralize
  end

  # Retorna a tradução de um atributo do model passado por parametro
  #
  # @param klass [Class] classe do model
  # @param attribute [Symbol]
  #
  # @return [String]
  def human_attr(klass, attribute)
    klass.human_attribute_name(attribute)
  end

  # Retorna a tradução do atributo e adiciona uma interrogação
  # ao final
  #
  # @param klass [Class] classe do model
  # @param attribute [Symbol] atributo
  #
  # @return [String]
  def ask_attr(klass, attribute)
    "#{human_attr(klass, attribute)}?"
  end
end
