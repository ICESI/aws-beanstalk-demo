from pricehunters.store import get_stores

def test_get_targets():
  stores = get_stores()
  assert len(stores['stores']) > 0