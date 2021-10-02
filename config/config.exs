
# This doesn't apply when used as library.
use Mix.Config

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :local_time, :time_zone, "America/New_York"
