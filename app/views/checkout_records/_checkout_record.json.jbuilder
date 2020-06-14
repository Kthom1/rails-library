json.extract! checkout_record, :id, :created_at, :updated_at
json.url checkout_record_url(checkout_record, format: :json)
