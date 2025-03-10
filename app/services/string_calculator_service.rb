class StringCalculatorService
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      custom_delimiter = numbers.match(%r{//(.)\n})[1]
      delimiter = /#{Regexp.escape(custom_delimiter)}|\n/
      numbers = numbers.split("\n", 2)[1] # Remove the delimiter definition line
    end

    nums = numbers.split(delimiter).map(&:to_i)
    
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end
end
