json.array!(@tasks) do |task|
  json.extract! task, :id, :task_id, :task_name, :task_description, :task_due_date, :task_date_completed, :task_status, :task_user
  json.url task_url(task, format: :json)
end
