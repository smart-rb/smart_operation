# SmartCore::Operation &middot; [![Gem Version](https://badge.fury.io/rb/smart_operation.svg)](https://badge.fury.io/rb/smart_operation) [![Build Status](https://travis-ci.org/smart-rb/smart_operation.svg?branch=master)](https://travis-ci.org/smart-rb/smart_operation)

Smart implementation of the most-used programming pattern - Service Object.

> previous generation: https://github.com/0exp/smart_core

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
  
  import { user_repo: 'business.users' }, access: :private
  
  option :name, 'value.string'
  option :password, 'value.string'
  option :age, 'value.integer'
  
  def call
    user_repo.create({ name: name, password: password, age: age })
  end
end

CreateUser.call(name: 'Rustam', password: 'test123', age: 28)
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

## Contributing

- Fork it ( https://github.com/smart-rb/smart_operation )
- Create your feature branch (`git checkout -b feature/my-new-feature`)
- Commit your changes (`git commit -am '[feature_context] Add some feature'`)
- Push to the branch (`git push origin feature/my-new-feature`)
- Create new Pull Request

## License

Released under MIT License.

## Authors

[Rustam Ibragimov](https://github.com/0exp)
