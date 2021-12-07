from typing_extensions import Final, final


print('runs normally with standard python interpreter')

class BaseAPIDeclaration(object):
    namespace: Final = 'base-api'

    @final 
    def resolve(self) -> dict:
        return {'namespace': self.namespace, 'base': True}


print('mypy accuses error, property and method were declired final')
print('cannot be overwritten by child class') 

class ConcreteAPI(BaseAPIDeclaration):
    namespace = 'custom-api'

    def resolve(self) -> dict:
        return {'hmmm': True}


