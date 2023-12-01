require 'pry'

# #PART ONE:
@part_one_sum = 0
file_path = 'test_file.txt'

File.foreach(file_path) do |line|
  num1 = line.scan(/\d/).first.to_i
  num2 = line.scan(/\d/).last.to_i

  @part_one_sum += "#{num1}#{num2}".to_i
end

puts "Part One Total Sum: #{@part_one_sum}"

#PART TWO:
@number_array = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

@part_two_sum = 0

file_path = 'test_file.txt'

File.foreach(file_path) do |line|
  result = @number_array.reduce(line) do |acc, word|
    acc.gsub(word) { |match| "#{match}#{@number_array.index(word) + 1}#{match}" }
  end

  results = result.chars.map(&:to_i).reject(&:zero?)
  result1 = results.first.to_i
  result2 = results.last.to_i
  @part_two_sum += "#{result1}#{result2}".to_i
end

puts "Part Two Total Sum: #{@part_two_sum}"