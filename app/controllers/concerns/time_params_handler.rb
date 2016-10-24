module TimeParamsHandler
  def start_date
    params[:start_date].to_s.to_date || Time.zone.now
  end

  def init_time
    params[:starts_at] || Time.zone.now
  end
end
