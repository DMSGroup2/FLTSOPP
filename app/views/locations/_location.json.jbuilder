json.extract! location, :id, :stop_date, :stop_time, :county_fips, :county_name, :created_at, :updated_at
json.url location_url(location, format: :json)
