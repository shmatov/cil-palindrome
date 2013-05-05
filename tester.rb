class Runner
  def initialize(command)
    @command = command
  end

  def run(input)
    IO.popen(@command, 'r+') do |p|
      p.write input
      p.read
    end
  end
end

class PalindromeTester
  def initialize(runner, io=STDOUT)
    @runner = runner
    @test_index = 0
    @io = io
    yield self if block_given?
  end

  def test(word, expected)
    log @test_index += 1, word, is_palindrome?(word), expected
  end

  private

  def log(test, word, real, expected)
    @io.print <<EOF
Test ##{test}.\t\
#{real == expected ? 'Ok.' : 'Fail!'}\t\
Palindrome: #{real}.\t\
Word: "#{word}".
EOF
  end

  def is_palindrome?(word)
    !/not/.match run(word)
  end

  def run(input)
    @runner.run(input + "\n").split("\n").last
  end
end

if __FILE__ == $0
  PalindromeTester.new(Runner.new 'mono run') do |t|
    t.test 'word', false
    t.test 'ab',   false
    t.test 'abs',  false
    t.test '',     true
    t.test 'a',    true
    t.test 'aba',  true
    t.test 'abba', true
  end
end
