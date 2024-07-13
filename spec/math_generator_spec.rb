# frozen_string_literal: true

RSpec.describe MathGenerator do
  it "has a version number" do
    expect(MathGenerator::VERSION).not_to be nil
  end

  it "generates addition problems" do
    generated = MathGenerator::Problem.generate(:addition, 20, 100)
    expect(generated[:problem]).to match(/\d+(\.\d{1,2})? \+ \d+(\.\d{1,2})? = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" + ")
    expected_result = problem_parts[0].to_i + problem_parts[1].to_i

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates subtraction problems" do
    generated = MathGenerator::Problem.generate(:subtraction)
    expect(generated[:problem]).to match(/\d+(\.\d{1,2})? - \d+(\.\d{1,2})? = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" - ")
    expected_result = problem_parts[0].to_i - problem_parts[1].to_i

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates multiplication problems" do
    generated = MathGenerator::Problem.generate(:multiplication)
    expect(generated[:problem]).to match(/\d+(\.\d{1,2})? \* \d+(\.\d{1,2})? = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" * ")
    expected_result = problem_parts[0].to_i * problem_parts[1].to_i

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates division problems" do
    generated = MathGenerator::Problem.generate(:division)
    expect(generated[:problem]).to match(/\d+(\.\d{1,2})? \/ \d+(\.\d{1,2})? = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" / ")
    expected_result = problem_parts[0].to_i / problem_parts[1].to_i

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates addition problems with decimals" do
    generated = MathGenerator::Problem.generate(:addition, 1, 10, true)
    expect(generated[:problem]).to match(/\d+\.\d{1,2} \+ \d+\.\d{1,2} = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" + ")
    expected_result = problem_parts[0].to_f + problem_parts[1].to_f

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates subtraction problems with decimals" do
    generated = MathGenerator::Problem.generate(:subtraction, 1, 10, true)
    expect(generated[:problem]).to match(/\d+\.\d{1,2} - \d+\.\d{1,2} = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" - ")
    expected_result = problem_parts[0].to_f - problem_parts[1].to_f

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates multiplication problems with decimals" do
    generated = MathGenerator::Problem.generate(:multiplication, 1, 10, true)
    expect(generated[:problem]).to match(/\d+\.\d{1,2} \* \d+\.\d{1,2} = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" * ")
    expected_result = problem_parts[0].to_f * problem_parts[1].to_f

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates division problems with decimals" do
    generated = MathGenerator::Problem.generate(:division, 1, 10, true)
    expect(generated[:problem]).to match(/\d+\.\d{1,2} \/ \d+\.\d{1,2} = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" / ")
    expected_result = problem_parts[0].to_f / problem_parts[1].to_f

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates addition problems with fractions" do
    generated = MathGenerator::Problem.generate(:addition, 1, 10, false, true)

    expect(generated[:problem]).to match(/\d+\/\d+ \+ \d+\/\d+ = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" + ")
    fraction1 = Rational(problem_parts[0])
    fraction2 = Rational(problem_parts[1])
    expected_result = fraction1 + fraction2

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates subtraction problems with fractions" do
    generated = MathGenerator::Problem.generate(:subtraction, 1, 10, false, true)

    expect(generated[:problem]).to match(/\d+\/\d+ - \d+\/\d+ = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" - ")
    fraction1 = Rational(problem_parts[0])
    fraction2 = Rational(problem_parts[1])
    expected_result = fraction1 - fraction2

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates multiplication problems with fractions" do
    generated = MathGenerator::Problem.generate(:multiplication, 1, 10, false, true)

    expect(generated[:problem]).to match(/\d+\/\d+ \* \d+\/\d+ = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" * ")
    fraction1 = Rational(problem_parts[0])
    fraction2 = Rational(problem_parts[1])
    expected_result = fraction1 * fraction2

    expect(generated[:result]).to eq(expected_result)
  end

  it "generates division problems with fractions" do
    generated = MathGenerator::Problem.generate(:division, 10, 100, false, true)

    expect(generated[:problem]).to match(/\d+\/\d+ \/ \d+\/\d+ = \?/)

    problem_parts = generated[:problem].gsub(" = ?", "").split(" / ")
    fraction1 = Rational(problem_parts[0])
    fraction2 = Rational(problem_parts[1])
    expected_result = fraction1 / fraction2

    expect(generated[:result]).to eq(expected_result)
  end
end
