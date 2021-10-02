defmodule LocalTime do
  @moduledoc """
  Documentation for `LocalTime`.
  """

  @doc """
  Gets the configured timezone.

  ## Examples

      iex> LocalTime.time_zone()
      "America/New_York"

  """
  def time_zone do
    Application.get_env(:local_time, :time_zone) ||
      raise "Need to set config :local_time, :time_zone"
  end

  @doc """
  Returns the current time in the local time zone.
  """
  def now do
    DateTime.now!(time_zone())
  end

  @doc """
  Converts a unix timestamp to a DateTime in the local time zone.
  """
  def from_unix(time) do
    DateTime.from_unix!(time)
    |> DateTime.shift_zone(time_zone())
  end

  @doc """
  Converts a NaiveDateTime to a DateTime in the local time zone.
  """
  def from_naive(ndt) do
    DateTime.from_naive!(ndt, time_zone())
  end

  @doc """
  Converts a Date and Time to a DateTime in the local time zone.
  """
  def new(date, time) do
    DateTime.new(date, time, time_zone())
  end
end
