json.extract! violation, :id, :violation_type, :stop_outcome, :is_arrested, :created_at, :updated_at
json.url violation_url(violation, format: :json)
