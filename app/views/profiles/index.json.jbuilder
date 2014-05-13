json.array!(@profiles) do |profile|
  json.extract! profile, :id, :start_weight, :goal_weight, :height
  json.url profile_url(profile, format: :json)
end
