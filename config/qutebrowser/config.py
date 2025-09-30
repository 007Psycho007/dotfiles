config.load_autoconfig(True)
#c.url.searchengines = {'DEFAULT': 'https://search.home.janpeterhaensel.de/?q={}'}
#c.url.start_pages = ["https://search.home.janpeterhaensel.de/search"]
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
c.url.start_pages = ["https://google.com"]
config.unbind('d',mode='normal')
config.bind('<Shift-W>','spawn mpv {url}')


#### Theme Onedark
c.colors.keyhint.bg = "#73b8f1"

# Completionbox
c.colors.completion.category.bg = "#73b8f1"
c.colors.completion.category.fg = "#282c34"
c.colors.completion.category.border.top = "#73b8f1"
c.colors.completion.category.border.bottom = "#73b8f1"

c.colors.completion.fg = "#abb2bf"
c.colors.completion.odd.bg = "#393f4a"
c.colors.completion.even.bg = "#393f4a"
c.colors.completion.item.selected.fg = "#abb2bf"
c.colors.completion.item.selected.bg = "#282c34"
c.colors.completion.item.selected.border.top = "#282c34"
c.colors.completion.item.selected.border.bottom = "#282c34"
c.colors.completion.match.fg = "#61afef"

c.colors.completion.scrollbar.fg = "#61afef"
c.colors.completion.scrollbar.bg = "#282c34"

# Context Menu
c.colors.contextmenu.menu.bg = "#282c34"
c.colors.contextmenu.menu.fg = "#abb2bf"

c.colors.contextmenu.selected.fg = "#282c34"
c.colors.contextmenu.selected.bg = "#73b8f1"
c.colors.contextmenu.disabled.fg = "#5c6370"

#Downloads
c.colors.downloads.bar.bg = "#282c34"
c.colors.downloads.error.bg = "#e06c75"
c.colors.downloads.error.fg = "#282c34"
c.colors.downloads.start.bg = "#e5c07b"
c.colors.downloads.start.fg = "#282c34"
c.colors.downloads.stop.bg = "#98c379"
c.colors.downloads.stop.fg = "#282c34"

# Hints
c.colors.hints.bg = "#282c34"
c.colors.hints.fg = "#61afef"
c.colors.hints.match.fg = "#e06c75"

c.colors.keyhint.bg = "#393f4a"
c.colors.keyhint.fg = "#abb2bf"
c.colors.keyhint.suffix.fg = "#61afef"

# Messages
c.colors.messages.error.bg = "#e06975"
c.colors.messages.error.border = "#e06c75"
c.colors.messages.error.fg = "#282c34"

c.colors.messages.info.bg = "#73b8f1"
c.colors.messages.info.border = "#73b8f1"
c.colors.messages.info.fg = "#282c34"

c.colors.messages.info.bg = "#e5c07b"
c.colors.messages.info.border = "#e5c07b"
c.colors.messages.info.fg = "#282c34"

#Prompts
c.colors.prompts.bg = "#393f4a"
c.colors.prompts.border = "#393f4a"
c.colors.prompts.fg = "#abb2bf"
c.colors.prompts.selected.bg = "#73b8f1"
c.colors.prompts.selected.fg = "#282c34"

# Statusbar
c.colors.statusbar.normal.bg = "#181a1f"
c.colors.statusbar.normal.fg = "#abb2bf"

c.colors.statusbar.caret.bg = "#c678dd"
c.colors.statusbar.caret.fg = "#282c34"

c.colors.statusbar.caret.selection.bg = "#c678dd"
c.colors.statusbar.caret.selection.fg = "#282c34"

c.colors.statusbar.insert.bg = "#73b8f1"
c.colors.statusbar.insert.fg = "#282c34"

c.colors.statusbar.command.fg = "#abb2bf"
c.colors.statusbar.command.bg = "#181a1f"

c.colors.statusbar.passthrough.bg = "#5ab0f6"
c.colors.statusbar.passthrough.fg = "#ef5f6b"

c.colors.statusbar.private.bg = "#e06975"
c.colors.statusbar.private.fg = "#282c34"

c.colors.statusbar.progress.bg = "#73b8f1"

c.colors.statusbar.url.fg = "#61afef"
c.colors.statusbar.url.success.http.fg = "#97ca72"
c.colors.statusbar.url.success.https.fg = "#97ca72"
c.colors.statusbar.url.warn.fg = "#e5c07b"

# Tabbar
c.colors.tabs.bar.bg = "#282c34"
c.colors.tabs.even.bg = "#18141f"
c.colors.tabs.even.fg = "#abb2bf"
c.colors.tabs.odd.bg = "#18141f"
c.colors.tabs.odd.fg = "#abb2bf"

c.colors.tabs.selected.even.fg = "#282c34"
c.colors.tabs.selected.even.bg = "#73b8f1"
c.colors.tabs.selected.odd.fg = "#282c34"
c.colors.tabs.selected.odd.bg = "#73b8f1"

c.colors.tabs.pinned.even.bg = "#393f4c"
c.colors.tabs.pinned.even.fg = "#abb2bf"
c.colors.tabs.pinned.odd.bg = "#393f49"
c.colors.tabs.pinned.odd.fg = "#abb2bf"

c.colors.tabs.pinned.selected.even.fg = "#282c34"
c.colors.tabs.pinned.selected.even.bg = "#73b8f1"
c.colors.tabs.pinned.selected.odd.fg = "#282c34"
c.colors.tabs.pinned.selected.odd.bg = "#73b8f1"

c.colors.tabs.indicator.error = "#e06c75"
c.colors.tabs.indicator.start = "#e5c07b"
c.colors.tabs.indicator.error = "#97ca72"

c.colors.webpage.darkmode.enabled = False

c.content.tls.certificate_errors = "ask-block-thirdparty"
