# SmartCore::Operation &middot; <a target="_blank" href="https://github.com/Cado-Labs"><img src="https://github.com/Cado-Labs/cado-labs-logos/raw/main/cado_labs_badge.svg" alt="Supported by Cado Labs" style="max-width: 100%; height: 20px"></a> &middot; [![Gem Version](https://badge.fury.io/rb/smart_operation.svg)](https://badge.fury.io/rb/smart_operation)

Smart implementation of the most-used programming pattern - Service Object. Powered by smart_injection, smart_container, smart_types and smart_initializer.

> previous generation: https://github.com/0exp/smart_core

---

<p>
  <a href="https://github.com/Cado-Labs">
    <img src="https://github.com/Cado-Labs/cado-labs-logos/blob/main/cado_labs_supporting.svg" alt="Supported by Cado Labs" />
  </a>
</p>

---

## Main features

- multifunctional constructor DSL (powerd by [smart_initializer](https://github.com/smart-rb/smart_initializer) and [smart_types](https://github.com/smart-rb/smart_types));
- result object interface (`Success`, `Failure`, `Fatal`, `Callback`);
- `call.new.call` invocation behavior;
- support for dependency injection (powered by [smart_injection](https://github.com/smart-rb/smart_injection) and [smart_container](https://github.com/smart-rb/smart_container));

---

## Installation

```ruby
gem 'smart_operation'
```

```shell
bundle install
# --- or ---
gem install smart_types
```

```ruby
require 'smart_core/operation'
```

---

## Synopsis

```ruby
class CreateUser < SmartCore::Operation
  register_container(ReposContainer)

  import({ user_repo: 'business.users' }, access: :private)

  option :name, 'value.string'
  option :password, 'value.string'
  option :age, 'value.integer'

  def call
    user = user_repo.create({ name: name, password: password, age: age })
    Success(user: user) # or Callback { puts 'wow o.O' }
  end
end

CreateUser.call(name: 'Rustam', password: 'test123', age: 28) do |result|
  result.success?  { puts 'success!' }
  result.failure?  { puts 'failure!' }
  result.fatal?    { puts 'fatal!' }
  result.callback? { result.call } # or some_object.instance_eval(&result.callback)
end
```

Pre-requisits:

```ruby
class UserRepo
  def create(user_creds)
     # ... some code
  end
end

ReposContainer = SmartCore::Container.define do
  namespace(:business) do
    register(:users) { UserRepo.new }
  end
end
```

---

## Roadmap

- method memoization logic (with abilities to refresh memoized methods);
- pattern matching for result objects (`Success`, `Failure`, `Fatal`, `Callback`);
- migrate to `Github Actions`;
- parametrized `.call` methods (`ServiceObject.with(attrs_a).call(attrs_b)` => `ServiceObject.new(attrs_b).call(attrs_a)` or something another);
- think about default exception classes and interfaces to support a basic domain-specific exception class definitioning (common practice);
- generators: an ability to invoke result block in repeatable `yield`-like style :thinking: (think about Fibers, js-like generators and similar) (for example: `.generator(call_attrs) do |result| # repeatable result block invokation for each "yield" from an inside "generator" method)`;

---

## Build

- run tests:

```shell
bundle exec rspec
```

- run code style checks:

```shell
bundle exec rubocop
```

- run code style checks with auto-correction:

```shell
bundle exec rubocop -A
```

---

## Contributing

- Fork it ( https://github.com/smart-rb/smart_operation )
- Create your feature branch (`git checkout -b feature/my-new-feature`)
- Commit your changes (`git commit -am '[feature_context] Add some feature'`)
- Push to the branch (`git push origin feature/my-new-feature`)
- Create new Pull Request

## License

Released under MIT License.

## Supporting

<a href="https://github.com/Cado-Labs">
  <img src="https://github.com/Cado-Labs/cado-labs-logos/blob/main/cado_labs_logo.png" alt="Supported by Cado Labs" />
</a>

## Authors

[Rustam Ibragimov](https://github.com/0exp)
