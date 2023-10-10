require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    cut_name = @nameable.correct_name
    cut_name.length <= 10 ? cut_name : cut_name[0, 10]
  end
end
