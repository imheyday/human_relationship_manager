class BasePresenter
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def initialize(item_to_present)
    mathods = item_to_present.attribute_names + item_to_present.class.reflections.keys
    mathods.each do |value|
      define_singleton_method value.to_s do
        item_to_present.send(value)
      end
    end
  end
end
