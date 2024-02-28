json.extract! bank_slip, :id, :amount, :drawee_address, :drawee, :created_at, :updated_at
json.url bank_slip_url(bank_slip, format: :json)
