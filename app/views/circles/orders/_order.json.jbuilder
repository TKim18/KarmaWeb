json.extract! order, :id, :name, :circleName, :requestUserName, :acceptUserName, :category, :fromLocation, :toDestination, :instant, :preOrderTime, :cost, :created_at, :updated_at
json.url order_url(order, format: :json)
