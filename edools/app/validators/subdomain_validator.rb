class SubdomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?

    reserved_names = %w(www ftp mail pop smtp admin ssl sftp)
    reserved_names = options[:reserved] if options[:reserved]

    if reserved_names.include?(value)
      record.errors[attribute] << 'cannot be a reserved name'
    end
    record.errors.add attribute, 'must have between 3 and 20 characters' unless (3..20) === value.length
    record.errors.add attribute, 'cannot start or end with a hypen' unless value =~ /\A[^-].*[^-]\z/i
    record.errors.add attribute, 'must be alphanumeric or hypen' unless value =~ /\A[a-z0-9\-]*\z/i
  end
end