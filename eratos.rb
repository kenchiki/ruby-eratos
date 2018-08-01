require_relative './lib/eratos'

user_input_number = ARGV[0].to_i
p Eratos.new(user_input_number).prime_numbers
