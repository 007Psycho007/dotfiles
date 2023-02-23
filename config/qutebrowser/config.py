config.load_autoconfig(True)
c.url.searchengines = {'DEFAULT': 'https://search.home.janpeterhaensel.de/?q={}'}
c.url.start_pages = ["https://search.home.janpeterhaensel.de/search"]
config.unbind('d',mode='normal')
config.bind('<Shift-W>','spawn mpv {url}')
