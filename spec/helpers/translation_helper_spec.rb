require 'rails_helper'

describe TranslationHelper, type: :helper do
  describe '.translate_model_name' do
    it { expect(tm(Acquire)).to eq('Pedido de Compra') }
    it { expect(tm(Acquire, count: 2)).to eq('Pedidos de Compra') }
  end

  describe '.translate_model_name_pluralized' do
    it { expect(tmp(Acquire)).to eq('Pedidos de Compra') }
  end

  describe '.translate_model_attribute' do
    it { expect(ta(Acquire, :remarks)).to eq('Observações') }
  end
end
