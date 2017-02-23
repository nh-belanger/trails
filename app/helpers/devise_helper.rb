module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="devise-error">
      <ul style="list-style: none;">#{messages}</ul>
    </div>
    HTML


    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
