module TimeHandler
  extend ActiveSupport::Concern

  included do
    def start_date
      params[:start_date].to_s.to_time || Time.now
    end

    def init_time
      params[:starts_at] || Time.now
    end
  end
end
