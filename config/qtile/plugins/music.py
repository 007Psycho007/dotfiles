from subprocess import CalledProcessError, DEVNULL, check_output
def limit_len(string,l):
    if len(string) > l:
        return f"{string[:l-4]}..."
    else: return string

def status():
    try:
        spotify_status = check_output(["/home/jpeterhaensel/anaconda3/bin/spotify", "status"], stderr=DEVNULL).decode("utf-8").rstrip()
    except CalledProcessError as _:
       spotify_status = "Not installed"
    except FileNotFoundError as _:
       spotify_status = "Not installed"
    try:
        playerctl_status = check_output(["playerctl", "status"], stderr=DEVNULL).decode("utf-8").strip()
    except FileNotFoundError:
        playerctl_status = "Not installed"
    except CalledProcessError as _:
       playerctl_status = "Not installed"
    if spotify_status.split(":",1)[0] == "Playing":
        title = spotify_status.split("\n",1)[0].split(": ",1)[1]
        artist = spotify_status.split("\n")[1].split(" - ",1)[0].strip(" ")
        return f"{limit_len(title,15)} | {limit_len(artist,15)}"
    elif playerctl_status == "Playing":
        title = check_output(["playerctl", "metadata","xesam:title"]).decode("utf-8").replace("&","&#38;").strip()
        
        artist = check_output(["playerctl", "metadata","xesam:artist"]).decode("utf-8").strip()
        if len(artist) == 0:
            return f"{limit_len(title,30)}"
        else:
            return f"{limit_len(title,15)} | {limit_len(artist,15)}"
    else:
        return " - "
