require 'rails_helper'

RSpec.describe School, type: :model do

  before do
    @school = School.new(nome:"Escola Edool",email_dono: "teste@edool.com.br",
    pitch:"Lorem ipsum dolor sit amet, quo eu soluta detracto, vim eu tation deleniti fabellas, falli prompta",
    sub_dominio:"escola-edool",data_criacao:Time.now)
  end

  describe "quando o nome da escola não foi informado" do
    before { @school.nome = ""}
    it { should_not be_valid }
  end


end
