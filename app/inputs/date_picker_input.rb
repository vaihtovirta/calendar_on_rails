class DatePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    value = input_html_options[:value]
    value ||= object.send(attribute_name) if object.respond_to? attribute_name
    html_options(value)
    input_html_classes << 'datepicker'
    super
  end

  def html_options(value)
    return if value.blank?

    input_html_options[:value] ||= I18n.localize(value.to_date)
  end
end
