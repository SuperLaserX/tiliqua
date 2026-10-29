"""pytest options for bfr: slow gateware simulations run with --runslow."""

import pytest


def pytest_addoption(parser):
    parser.addoption("--runslow", action="store_true", help="run slow gateware simulations")


def pytest_configure(config):
    config.addinivalue_line("markers", "slow: a long gateware simulation (needs --runslow)")


def pytest_collection_modifyitems(config, items):
    if config.getoption("--runslow"):
        return
    skip = pytest.mark.skip(reason="slow simulation, run with --runslow")
    for item in items:
        if "slow" in item.keywords:
            item.add_marker(skip)
