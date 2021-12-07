
from typing_extensions import final

class AbstractCompanyDepartment(object):
    name = 'Department name goes here'


print('classes can also be declared final')
print('preventing further extension.')

@final 
class SalesDepartment(AbstractCompanyDepartment):
    name = 'Sales or something'

    def monthly_report(self)  -> int:
        total = 123000 # get total from somewhere
        return total

class BootlegSalesDeparment(SalesDepartment):
    def monthly_report(self) -> int:
        return 321 # fake fake total

