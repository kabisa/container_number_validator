require 'spec_helper'

describe ContainerNumberValidator do

  context 'fails on nil and empty values' do
    it 'with nil' do
      expect(subject.validate(nil)).to be_false
    end

    it 'with empty string' do
      expect(subject.validate('')).to be_false
    end
  end

  context 'fails on invalid owner code and category indentifier' do
    %w{1CLU812975-4 TCLU81A975-4 TCLU81-975-4 T3LU812975-4}.each do |value|
      it "with #{value}" do
        expect(subject.validate(value)).to be_false
      end
    end
  end

  context 'fails on invalid checksum' do
    %w{TCLU812975-1 MOFU587008-2 DRYU413526-6 NYKU561651-8}.each do |value|
      it "with #{value}" do
        expect(subject.validate(value)).to be_false
      end
    end
  end

  context 'passes on valid owner code and category identifier' do
    %w{MOFU587008-7 DRYU413526-5 NYKU644101-8 KKFU137865-2 NYKU561651-2 KKFU760143-9 TCLU250850-8}.each do |value|
      it "with #{value}" do
        expect(subject.validate(value)).to be_true
      end
    end
  end

  context 'passes on mixed case valid owner code and category identifier' do
    %w{TCLU812975-4 TCLU8129754 tclu8129754 tclu812975-4}.each do |value|
      it "with #{value}" do
        expect(subject.validate(value)).to be_true
      end
    end
  end
end