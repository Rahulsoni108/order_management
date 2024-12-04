# OrderManagement
The **OrderManagement** gem is a lightweight and modular Rails engine designed to simplify order management in your Rails application. It provides built-in models, migrations, controllers, and serializers for managing orders, order_items.

## Features
- Manage orders and order_items with ease.
- Provides RESTful controllers and JSON API serializers.
- Includes migrations for setting up the database structure.
- Extensible and easy to integrate with existing Rails applications.

## Installation

Add the gem to your application's Gemfile:

```ruby
gem "order_management", git: 'https://github.com/Rahulsoni108/order_management'
```

Run `bundle install` to install the gem:

```bash
$ bundle install
```

Run the installation generator to set up migrations and controllers:

```bash
$ rails generate order_management:install
```

Migrate the database:

```bash
$ rails db:migrate
```

---

## Usage

After installation, you can start managing your order by visiting the routes provided by the gem. For example:
- `/orders`
- `/orders/new`
- `/order_items`

The gem also exposes an API for integrations. Use the built-in serializers to customize JSON responses for your frontend.

---

## Development

To run the engine in development mode:
1. Clone the repository and set it up as a Rails engine.
2. Use the dummy application under `spec/dummy` to test features locally.
3. Make changes, write tests, and ensure everything is working before committing.

---

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a feature branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Create a pull request.

---

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).