# エラトステネスの篩
class Eratos
  # initialize
  # @param initial_number [Numeric]
  def initialize(initial_number)
    raise ArgumentError, 'initial number must be greater than 2' if initial_number <= 2
    @initial_number = initial_number
  end

  # 数値から素数のみの連番配列を作成
  # @return [Array]
  def prime_numbers
    number_range = number_to_number_range(initial_number)
    delete_searched_numbers(number_range)
  end

  private

  attr_reader :initial_number

  # number_rangeの先頭の数をsearch_numbersに移動し、その倍数をnumber_rangeから篩い落とす
  # @param number_range [Array]
  # @return [Array]
  def delete_searched_numbers(number_range)
    search_numbers = []
    loop do
      search_number = number_range.first
      break if search_number >= Math.sqrt(initial_number)
      search_numbers << search_number
      number_range = delete_searched_number(number_range, search_number)
    end

    [*search_numbers, *number_range]
  end

  # search_numberの倍数をnumber_rangeから篩い落とす
  # @param number_range [Array]
  # @param search_number [Numeric]
  # @return [Array]
  def delete_searched_number(number_range, search_number)
    number_range.reject {|loop_number|
      next true if loop_number == search_number
      next true if loop_number >= (search_number ** 2) && (loop_number % search_number) == 0
      false
    }
  end

  # 数値から連番配列（2から始まる）を作成
  # @param number [Numeric]
  # @return [Array]
  def number_to_number_range(number)
    [*(2..number - 1)]
  end
end
