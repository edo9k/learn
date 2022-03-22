# -*- coding: utf-8 -*-

import pytrends
import datetime

from pytrends.request import TrendReq

pytrend = TrendReq(hl='pt-BR', tz=360)

keywords = ['Lula', 'Bolsonaro', 'Ciro', 'Moro']

pytrend.build_payload(
        kw_list=keywords,
        cat=0,
        timeframe='today 3-m',
        geo='BR',
        gprop='')

data  = pytrend.interest_over_time()
data  = data.drop(labels=['isPartial'], axis='columns')

image = data.plot(title = "Trends Eleições 2022")

time_now = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')

fig = image.get_figure()
fig.savefig( './trends_elecoes_' + time_now + '.png' )

