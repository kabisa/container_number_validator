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
    return false unless container_no.to_s =~ /^[a-zA-Z]{4}\d{6}\-?\d$/

    checksum = container_no[-1, 1].to_i
    number   = container_no[0..-1]

    calculate_checksum(number) == checksum
  end
  module_function :validate

  private

  def calculate_checksum(container_no)
    chars = container_no.chars
    digits, weights = [], []

    chars[0..3].each  { |char| digits << LETTERS[char.upcase] }
    chars[4..10].each { |char| digits << char }

    digits.each_with_index do |digit, i|
      weights[i] = digit.to_i * WEIGHTS[i].to_i
    end

    checksum = weights.reduce(:+) % 11

    # When checksum equals 10 the last digit will equal 0
    checksum == 10 ? 0 : checksum
  end
  module_function :calculate_checksum

end

require 'container_number_validator/version'
require 'container_number_validator/adapters/active_model' if defined?(ActiveModel)