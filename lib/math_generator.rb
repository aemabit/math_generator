# frozen_string_literal: true

require_relative "math_generator/version"

module MathGenerator
  class Error < StandardError; end

  class Problem
    OPERATIONS = {
      addition: "+",
      subtraction: "-",
      multiplication: "*",
      division: "/"
    }

    def self.generate(operation, min = 1, max = 10, decimals = false, fractions = false)
      num1 = random_number(min, max, decimals, fractions)
      num2 = random_number(min, max, decimals, fractions)
      result = calculate_result(operation, num1, num2)

      {
        problem: format_problem(operation, num1, num2),
        result: result
      }
    end

    private

    def self.random_number(min, max, decimals, fractions)
      if fractions
        "#{rand(min..max)}/#{rand(1..max)}"
      elsif decimals
        rand(min.to_f..max.to_f).round(2)
      else
        rand(min..max)
      end
    end

    def self.calculate_result(operation, num1, num2)
      if num1.is_a?(String) || num2.is_a?(String)
        num1 = Rational(num1) if num1.is_a?(String)
        num2 = Rational(num2) if num2.is_a?(String)
      end

      case operation
      when :addition
        num1 + num2
      when :subtraction
        num1 - num2
      when :multiplication
        num1 * num2
      when :division
        num1 / num2
      else
        raise Error, "Unsupported operation"
      end
    end

    def self.format_problem(operation, num1, num2)
      case operation
      when :addition
        "#{num1} + #{num2} = ?"
      when :subtraction
        "#{num1} - #{num2} = ?"
      when :multiplication
        "#{num1} * #{num2} = ?"
      when :division
        "#{num1} / #{num2} = ?"
      else
        raise Error, "Unsupported operation"
      end
    end
  end
end
