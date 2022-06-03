defmodule LocalTimeTest do
  use ExUnit.Case
  doctest LocalTime

  test "from unix" do
    {:ok, dt} = LocalTime.from(0)
    assert dt.time_zone == "America/New_York"
    assert dt.year == 1969
  end

  test "from naive" do
    {:ok, ndt} = NaiveDateTime.new(2000, 1, 2, 3, 4, 5)
    {:ok, dt} = LocalTime.from(ndt)
    assert dt.time_zone == "America/New_York"
    assert dt.year == 2000
    assert dt.hour == 3
  end
end
