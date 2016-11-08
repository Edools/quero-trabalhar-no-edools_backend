class BaseSerializer
  include JSONAPI::Serializer

  def self_link
    nil
  end

  def type
    object.class.name.demodulize.tableize.underscore
  end

  def format_name(attribute_name)
    attribute_name.to_s
  end

  def unformat_name(attribute_name)
    attribute_name.to_s
  end
end
