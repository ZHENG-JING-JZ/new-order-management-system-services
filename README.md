# README

# Set up the application
  * Configure env variables for database.
  * `bundle install`
  * Run task `rake warehouse:load_data` to load the sample data.
  * Run Rails server.

# Test the application
  * Use tools like Postman to send a request.
  * Use `rZvDngfZIHPrU8yZLpcb` as the test `X-AUTH-TOKEN` as header. (This is created in seeder.rb)
  * Go to homepage to check products and orders status.

# A few things about this sample app
  * If no `orderIds` is sent, an error will be returned.
  * Auth header is required to visit the API as I think this is an internal service.
  * When product stock is below the threshold, create purchase order method will just return `true` and update the stock. (For easier testing)
  * Order process method will roll back the whole transaction if any orderItem fails. This is an edge case when the system is used by multiple connections.
  * If `orderIds` contains a fulfilled order, it will also be returned in the API response, but the order status will not be flagged "Error: Unfulfillable".
