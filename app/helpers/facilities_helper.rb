module FacilitiesHelper
  def facility_simple_time(time)
    time.strftime("%H:%M")
  end
end
