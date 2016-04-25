module ApplicationHelper
  def active_controller(controller_name)
    params[:controller] == controller_name ? 'active' : nil
  end

  def active_action(action_name)
    params[:action] == action_name ? 'active' : nil
  end

  def active_li(text, path, class_attributes: '')
    class_name = current_page?(path) ? 'active' : ''
    class_attributes = "#{class_name} #{class_attributes}".strip
    content_tag(:li, class: class_attributes) do
      link_to text, path
    end
  end

  def present(model)
    klass = "#{model.class}Presenter".constantize
    presenter = klass.new(model)
    yield(presenter) if block_given?
  end
end
