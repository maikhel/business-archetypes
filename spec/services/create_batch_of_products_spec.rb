# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateBatchOfProducts do
  describe 'call' do
    it 'creates 1 example batch of product instances' do
      cpu = create(:product_type, name: 'Ryzen 5800')

      expect(described_class.call(cpu)).to eq true

      expect(cpu.product_instances.count).to eq described_class::BATCH_SIZE
      expect(cpu.product_batches.count).to eq 1

      batch = cpu.product_batches.first
      expect(batch.start_serial_number).to eq batch.product_instances.first.serial_number
      expect(batch.end_serial_number).to eq batch.product_instances.last.serial_number
    end
  end
end
