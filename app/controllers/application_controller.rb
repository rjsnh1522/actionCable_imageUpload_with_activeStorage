class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :store_timezone

def store_timezone
offset     = cookies["time_zone_offset"].to_i
   time_zone = ActiveSupport::TimeZone[-offset.minutes].name
   Time.zone = time_zone
end

end
