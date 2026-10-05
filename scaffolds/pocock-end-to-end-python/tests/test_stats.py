import pandas as pd

from rides.stats import rides_by_city, total_rides


def sample() -> pd.DataFrame:
    return pd.DataFrame(
        {
            "date": pd.to_datetime(["2026-07-01", "2026-07-01", "2026-07-02"]),
            "city": ["Miami", "Boston", "Boston"],
            "rides": [10, 20, 30],
        }
    )


def test_total_rides_sums_the_rides_column():
    assert total_rides(sample()) == 60


def test_rides_by_city_totals_per_city_in_alphabetical_order():
    out = rides_by_city(sample())
    assert list(out["city"]) == ["Boston", "Miami"]
    assert list(out["rides"]) == [50, 10]


def test_rides_by_city_has_one_row_per_city():
    assert len(rides_by_city(sample())) == 2
