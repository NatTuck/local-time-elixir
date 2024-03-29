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
  Returns the number of seconds since 1970. Note that a UNIX time
  is always UTC, so this doesn't change that.
  """
  def unix_now do
    now() |> DateTime.to_unix()
  end

  @doc """
  Converts a unix timestamp to a DateTime in the local time zone.
  """
  def from_unix(time) do
    DateTime.from_unix!(time)
    |> DateTime.shift_zone(time_zone())
  end

  @doc """
  Converts a Local NaiveDateTime to a DateTime in the local time zone.
  """
  def from_naive(ndt) do
    DateTime.from_naive!(ndt, time_zone())
  end

  @doc """
  Converts a UTC NaiveDateTime to a DateTime in the local time zone.
  """
  def from_naive_utc(ndt) do
    DateTime.from_naive!(ndt, "Etc/UTC")
    |> from!()
  end

  @doc """
  Converts anything to local DateTime or raises.
  """
  def from!(thing) do
    case from(thing) do
      {:ok, dt} -> dt
      {:error, msg} -> raise msg
    end
  end

  @doc """
  Converts anything to local DateTime.
  """
  def from(%NaiveDateTime{} = ndt) do
    DateTime.from_naive(ndt, time_zone())
  end

  def from(%DateTime{} = dt) do
    DateTime.shift_zone(dt, time_zone())
  end

  def from(time) when is_integer(time) do
    with {:ok, dt} <- DateTime.from_unix(time)
    do
      from(dt)
    else
      err -> err
    end
  end

  def from(text) when is_binary(text) do
    DateTime.from_iso8601(text)
    |> from()
  end

  @doc """
  Converts a Date and Time to a DateTime in the local time zone.
  """
  def new(date, time) do
    DateTime.new(date, time, time_zone())
  end
end
