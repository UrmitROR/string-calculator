require 'test_helper'
require_relative '../../app/services/string_calculator_service'

class StringCalculatorServiceTest < Minitest::Test
  def test_returns_0_for_empty_string
    assert_equal 0, StringCalculatorService.add("")
  end

  def test_returns_number_itself_for_a_single_input
    assert_equal 1, StringCalculatorService.add("1")
  end

  def test_returns_sum_for_multiple_numbers_with_commas
    assert_equal 6, StringCalculatorService.add("1,2,3")
  end

  def test_handles_newlines_as_delimiters
    assert_equal 6, StringCalculatorService.add("1\n2,3")
  end

  def test_supports_custom_delimiters
    assert_equal 3, StringCalculatorService.add("//;\n1;2")
  end

  def test_supports_custom_delimiters_along_with_newlines
    assert_equal 6, StringCalculatorService.add("//;\n1;2\n3")
  end

  def test_throws_exception_for_negative_numbers
    error = assert_raises(RuntimeError) { StringCalculatorService.add("//;\n-1;2\n-3") }
    assert_equal "negative numbers not allowed -1, -3", error.message
  end
end
