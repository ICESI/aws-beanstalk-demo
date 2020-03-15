import connexion
from flask_cors import CORS, cross_origin
from pricehunters.store import get_stores
from pricehunters.constant import OK_MESSAGE

@cross_origin()
def handler_get_stores():
  stores = get_stores()
  return stores, 200

@cross_origin()
def handler_health():
  return OK_MESSAGE, 200

application = connexion.App(__name__, port=5000, specification_dir='api/')
application.add_api('openapi.yaml', arguments={'title': 'Pricehunters'})
CORS(application.app)

if __name__ == '__main__':
  application.run()