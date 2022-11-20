module ApplicationHelper
  def show_errors(model, attribute)
    model.errors.messages[attribute].join(', ')
  end
end
