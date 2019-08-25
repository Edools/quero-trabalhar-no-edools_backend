module ActiveSupport
  class TimeWithZone


    def to_s_without_time_zone
      self.strftime('%d-%m-%Y %H:%M:%S')
    end

    def to_querry
      "to_date('#{self.to_s_without_time_zone}','dd-mm-yyyy hh24:mi:ss')"
    end


  end
end

class DateTime
  def to_s_without_time_zone
    self.strftime('%d-%m-%Y %H:%M:%S')
  end

  def to_querry
    "to_date('#{self.to_s_without_time_zone}','dd-mm-yyyy hh24:mi:ss')"
  end

end

class Time
  def to_s_without_time_zone
    self.strftime('%d-%m-%Y %H:%M:%S')
  end

  def to_querry
    "to_date('#{self.to_s_without_time_zone}','dd-mm-yyyy hh24:mi:ss')"
  end

end


class Date
  def to_s_without_time_zone
    self.strftime('%d-%m-%Y')
  end

  def to_querry
    "to_date('#{self.to_s_without_time_zone}','dd-mm-yyyy')"
  end

end