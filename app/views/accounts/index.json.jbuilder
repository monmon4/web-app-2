json.array!(@accounts) do |account|
  json.extract! account, :id, :user_name, :first_name, :last_name, :email, :password_digest
  json.url account_url(account, format: :json)
end
