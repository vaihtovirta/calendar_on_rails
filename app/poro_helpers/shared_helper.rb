class SharedHelper
  include ActionView::Helpers

  def date_normalized(date)
    (date.present? ? date : Time.zone.now).strftime("%d %B, %Y")
  end

  def delete_button(title, path)
    link_to title, path,
      data: { confirm: "Are you sure?" },
      method: :delete,
      class: "mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-color--red-800"
  end

  def mat_icon(name, klass = "")
    content_tag :i, name, class: "material-icons #{klass}"
  end
end
