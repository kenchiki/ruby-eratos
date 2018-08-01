require 'spec_helper'

RSpec.describe Eratos do
  describe '#prime_numbers' do
    # 同値分割
    it 'is exception, when initial number is 0' do
      expect{Eratos.new(0).prime_numbers}.to raise_error ArgumentError
    end

    it 'is only prime numbers, when initial number is 30' do
      expect(Eratos.new(30).prime_numbers).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    end

    # 境界値分析
    it 'is only prime numbers, when initial number is 3' do
      expect(Eratos.new(3).prime_numbers).to eq [2]
    end

    it 'is exception, when initial number is 2' do
      expect{Eratos.new(2).prime_numbers}.to raise_error ArgumentError
    end
  end
end
