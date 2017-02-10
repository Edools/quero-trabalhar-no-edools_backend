class Escola < ActiveRecord::Base
  
  has_many :cursos

  validates_presence_of :nome, :email_do_dono, :pitch, :subdominio

  def self.busca(busca)
    escolas = []
    if busca[:nome]
    	escolas = Escola.find_all_by_nome busca[:nome]
    end
    escolas
  end

end
