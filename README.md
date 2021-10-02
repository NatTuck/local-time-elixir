# LocalTime

Sometimes your app really does exist only in a single place. This library works
to let you ignore timezones and work in local time as much as possible.

If your app is going to have users in more than one physical location, there's a good chance this is not the right thing for you.

## Installation

Add `local_time` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:local_time, "~> 0.1.0"}
  ]
end
```

Add configuration in config/config.exs:

```
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :local_time, :time_zone, "America/New_York"
```

## Publishing to hex.pm

If [available in Hex](https://hex.pm/docs/publish), the package can be installed...

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/local_time](https://hexdocs.pm/local_time).

## Copyright

Copyright (C) 2021 Nat Tuck. Licensed under the Apache Licence, version 2.0.
