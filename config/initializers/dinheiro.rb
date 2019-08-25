class Integer
  def to_dinheiro
    Dinheiro.new(self).real_formatado
  end
end

class Float
  def to_dinheiro
    Dinheiro.new(self).real_formatado
  end
end

class BigDecimal
  def to_dinheiro
    Dinheiro.new(self).real_formatado
  end
end

class Fixnum
  def to_dinheiro
    Dinheiro.new(self).real_formatado
  end
end

class NilClass
  def to_dinheiro
    ""
  end
end


class Integer
  def to_dinheiro_s_cifra
    Dinheiro.new(self).to_s
  end
end

class Float
  def to_dinheiro_s_cifra
    Dinheiro.new(self).to_s
  end
end

class BigDecimal
  def to_dinheiro_s_cifra
    Dinheiro.new(self).to_s
  end
end

class Fixnum
  def to_dinheiro_s_cifra
    Dinheiro.new(self).to_s
  end
end

class NilClass
  def to_dinheiro_s_cifra
    ""
  end
end