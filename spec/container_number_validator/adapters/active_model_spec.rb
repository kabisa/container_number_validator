require 'spec_helper'

if defined?(ActiveModel)

  class Container < ModelBase
    validates :container_no, container_number: true
  end

  describe Container do
    it 'accepts only valid container numbers' do
      obj = Container.new(container_no: 'TCLU812975-4')
      expect(obj).to be_valid

      obj = Container.new(container_no: 'TCLU812975-7')
      expect(obj).not_to be_valid
    end
  end
end