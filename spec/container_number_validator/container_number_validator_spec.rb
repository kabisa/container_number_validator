require 'spec_helper'

describe ContainerNumberValidator do

  describe '#validate' do
    context 'invalid values' do
      context 'nil and empty values' do
        it { ContainerNumberValidator.validate(nil).should be_false }
        it { ContainerNumberValidator.validate('').should be_false }
      end

      context 'check owner code and category indentifier string' do
        %w{1CLU812975-4 TCLU81A975-4 TCLU81-975-4 T3LU812975-4}.each do |value|
          it { ContainerNumberValidator.validate(value).should be_false }
        end

        context 'invalid checksum' do
          %w{TCLU812975-1 MOFU587008-2 DRYU413526-6 NYKU561651-8}.each do |value|
            it { ContainerNumberValidator.validate(value).should be_false }
          end
        end

        context 'valid values' do
          context 'check owner code and category indentifier string' do
            # Different variations on string case
            %w{TCLU812975-4 TCLU8129754 tclu8129754 tclu812975-4}.each do |value|
              it { ContainerNumberValidator.validate(value).should be_true }
            end

            %w{MOFU587008-7 DRYU413526-5 NYKU644101-8 KKFU137865-2 NYKU561651-2 KKFU760143-9 TCLU250850-8}.each do |value|
              it { ContainerNumberValidator.validate(value).should be_true }
            end
          end
        end
      end
    end
  end
end