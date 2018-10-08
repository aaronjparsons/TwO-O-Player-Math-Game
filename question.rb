class Question

  def initialize
    @min = 1
    @max = 20
  end

  def create_question
    x = rand(@min...@max)
    y = rand(@min...@max)
    answer = x + y
    question_object = {
      question: "What does #{x} plus #{y} equal?",
      answer: answer
    }
  end

end