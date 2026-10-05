"""Summaries of the rides data. Computation lives here; pages only display."""
from __future__ import annotations

import pandas as pd


def load_rides(path: str = "data/rides.csv") -> pd.DataFrame:
    """Read the rides CSV with the date column parsed."""
    return pd.read_csv(path, parse_dates=["date"])


def total_rides(df: pd.DataFrame) -> int:
    """Sum of the rides column."""
    return int(df["rides"].sum())


def rides_by_city(df: pd.DataFrame) -> pd.DataFrame:
    """Total rides per city, one row per city, sorted by city name."""
    return (
        df.groupby("city", as_index=False)["rides"]
        .sum()
        .sort_values("city")
        .reset_index(drop=True)
    )
