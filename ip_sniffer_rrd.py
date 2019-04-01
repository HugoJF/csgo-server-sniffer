import valve.source
import valve.source.a2s
import valve.rcon
import subprocess
import time
import sys
import json
import re
import os
from os import system
from urllib.request import urlopen


path = os.getenv('RRD_PATH', '')
ip = os.getenv('IP', '170.81.43.200')

html = urlopen("http://api.steampowered.com/ISteamApps/GetServersAtAddress/v1/?addr={0}".format(ip)).read().decode('utf-8')
res = json.loads(html)
servers_raw = res['response']['servers']
servers = []
for sv in servers_raw:
    servers.append(tuple((ip, int(sv['gameport']))))

while True:
    system('clear')
    print('Looping servers:')
    for sv in servers:
        try:
            with valve.source.a2s.ServerQuerier(sv) as query:
                # Query server information
                info = query.info()

                # Build IP string
                addr = str(sv[0]) + ':' + str(sv[1])

                # Replace non-alphanum characters
                file = re.sub(r"[^A-Za-z0-9]", '_', addr)

                # Compute human players
                pcount = int(info['player_count']) - int(info['bot_count'])

                # Build command string
                command = 'rrdtool update {0}{1}.rrd N:{2}'.format(path, file, pcount)

                # Call RRD update
                subprocess.call(command, shell=True)

                # Debug
                print(command)

        except valve.source.NoResponseError:
            print('Server at {0} is not responding'.format(sv[0]))
        sys.stdout.flush()

    print()
    sys.stdout.flush()
    time.sleep(1)
