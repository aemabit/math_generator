# MathGenerator

The MathGenerator gem is a tool designed to create a wide range of mathematical problems suitable for educational purposes. It supports basic arithmetic operations such as addition, subtraction, multiplication, and division. Additionally, it can generate problems with decimals and fractions, making it versatile for different levels of difficulty.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "math_generator"
```

And then execute:
```bash
bundle install
```

## Usage

### Generating Addition Problems

```ruby
require 'math_generator'

# Problems with integers
problem = MathGenerator::Problem.generate(:addition, 1, 10)
puts problem[:problem]  # Example: "3 + 7 = ?"
puts problem[:result]   # Example: 10

# Problems with decimals
problem = MathGenerator::Problem.generate(:addition, 1, 10, true)
puts problem[:problem]  # Example: "3.5 + 7.2 = ?"
puts problem[:result]   # Example: 10.7

# Problems with fractions
problem = MathGenerator::Problem.generate(:addition, 1, 10, false, true)
puts problem[:problem]  # Example: "3/4 + 2/5 = ?"
puts problem[:result]   # Example: 23/20
```

### Generating Subtraction Problems

```ruby
require 'math_generator'

# Problems with integers
problem = MathGenerator::Problem.generate(:subtraction, 1, 10)
puts problem[:problem]  # Example: "7 - 3 = ?"
puts problem[:result]   # Example: 4

# Problems with decimals
problem = MathGenerator::Problem.generate(:subtraction, 1, 10, true)
puts problem[:problem]  # Example: "7.5 - 3.2 = ?"
puts problem[:result]   # Example: 4.3

# Problems with fractions
problem = MathGenerator::Problem.generate(:subtraction, 1, 10, false, true)
puts problem[:problem]  # Example: "3/4 - 2/5 = ?"
puts problem[:result]   # Example: 7/20
```

### Generating Multiplication Problems

```ruby
require 'math_generator'

# Problems with integers
problem = MathGenerator::Problem.generate(:multiplication, 1, 10)
puts problem[:problem]  # Example: "3 * 7 = ?"
puts problem[:result]   # Example: 21

# Problems with decimals
problem = MathGenerator::Problem.generate(:multiplication, 1, 10, true)
puts problem[:problem]  # Example: "3.5 * 2.0 = ?"
puts problem[:result]   # Example: 7.0

# Problems with fractions
problem = MathGenerator::Problem.generate(:multiplication, 1, 10, false, true)
puts problem[:problem]  # Example: "3/4 * 2/5 = ?"
puts problem[:result]   # Example: 6/20
```

### Generating Division Problems

```ruby
require 'math_generator'

# Problems with integers
problem = MathGenerator::Problem.generate(:division, 1, 10)
puts problem[:problem]  # Example: "8 / 4 = ?"
puts problem[:result]   # Example: 2

# Problems with decimals
problem = MathGenerator::Problem.generate(:division, 1, 10, true)
puts problem[:problem]  # Example: "7.5 / 2.5 = ?"
puts problem[:result]   # Example: 3.0

# Problems with fractions
problem = MathGenerator::Problem.generate(:division, 1, 10, false, true)
puts problem[:problem]  # Example: "3/4 / 2/5 = ?"
puts problem[:result]   # Example: 15/8
```

## Contributing
Contribution directions go here. You can fork the repository, create a new branch, and submit a pull request for review. Please make sure to write tests for your contributions and follow the coding standards set in the project.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
