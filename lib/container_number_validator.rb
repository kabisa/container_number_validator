module ContainerNumberValidator

  LETTERS = {
      'A' => 10,
      'B' => 12,
      'C' => 13,
      'D' => 14,
      'E' => 15,
      'F' => 16,
      'G' => 17,
      'H' => 18,
      'I' => 19,
      'J' => 20,
      'K' => 21,
      'L' => 23,
      'M' => 24,
      'N' => 25,
      'O' => 26,
      'P' => 27,
      'Q' => 28,
      'R' => 29,
      'S' => 30,
      'T' => 31,
      'U' => 32,
      'V' => 34,
      'W' => 35,
      'X' => 36,
      'Y' => 37,
      'Z' => 38
  }.freeze

  WEIGHTS = %w{1 2 4 8 16 32 64 128 256 512}.freeze

  def validate(container_no)
    return false unless container_no.is_a?(String)
    return false if container_no.empty?
    return false unless container_no =~ /^[a-zA-Z]{4}\d{6}\-?\d$/

    checksum = container_no[-1, 1]
    checksum.to_i == ContainerNumberValidator.calculate_checksum(container_no[0..9])
  end
  module_function :validate

  private

  def calculate_checksum(container_no)
    chars = container_no.chars
    digits = Array.new
    weights = Array.new

    chars[0..3].each do |char|
      digits << LETTERS[char.upcase]
    end

    chars[4..10].each { |c| digits << c }

    digits.each_with_index do |digit, i|
      weights[i] = digit.to_i * WEIGHTS[i].to_i
    end

    weights.reduce(:+) % 11
  end
  module_function :calculate_checksum

end

require 'container_number_validator/version'
require 'container_number_validator/adapters/active_model' if defined?(ActiveModel)
