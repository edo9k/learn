import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
    
get_url  = "http://careers.picpay.com/tests/mobdev/users"
post_url = "http://careers.picpay.com/tests/mobdev/transaction"

logs = open("picpay-cli.log", "w")

#
# fault tolerant get idea from https://www.peterbe.com/plog/best-practice-with-retries-with-requests
# 
def managed_session(
      retries = 3,
      backoff_factor = 0.3,
      status_forcelist = (500, 502, 504),
      session = None,
    ):
      session = session or requests.Session()
      retry = Retry(
          total = retries,
          read = retries,
          connect = retries,
          backoff_factor = backoff_factor,
          status_forcelist = status_forcelist,
      )
      adapter = HTTPAdapter(max_retries = retry)
      session.mount('http://', adapter)
      session.mount('https://', adapter)
      return session

def get_users():
  try:
    response = managed_session().get(get_url)
  except Exception as e:
    logs.write(str(e))
    
    print('''        Não foi possível recuperar a lista de usuários.
        Tente de novo mais tarde. Ou, caso o  problema persista,
        entre em contato via alo@picpay.com\n''')

    print('''        Pressione qualquer tecla para finalizar,
        (logs de erro foram gravados em picpay-cli.log)''')

    quit()
  finally:
    return response.json()

#
# TODO
# 
# + Make a proper PicPay ascii logo when the code runs
# + Star screen menu (w/ [t]ransações [c]artões [p]essoas [e]stabelecimentos [p]agar)
# + Make some kind of quick Menu (w/ [p]esquisar [v]er usuarios [s]air)
# + Load users avatar in ascii art
# + Manage Credit Cards (Add/Edit/Remove) SQLite?
# + Validade Credit Card
# + Post operation

def main():
  users = sorted(get_users(), key=lambda k: k['name'])

  for item in users[:15]:
    # too sleepy and tired for this kind of FORMAT shit
    # print("{0:25s} {0:25s} {0:{}d}".format(item['name'],item['username'], item['id']))
    print("{} -  {} [{}]".format(item['name'],item['username'], item['id']))

  print("Digite o numero do destinatario para escolher ou 'p' para [p]esquisar:")
  option = input()

  print(option)


if __name__ == '__main__':
  main()
  

