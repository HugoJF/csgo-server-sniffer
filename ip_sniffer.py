import valve.source
import valve.source.a2s
import valve.rcon
import time
import sys
import json
from os import system, name
from urllib.request import urlopen

print('Please input server IP to sniff: ', end='')
ip = input()
if not ip:
    ip = '143.202.39.221'

html = urlopen("http://api.steampowered.com/ISteamApps/GetServersAtAddress/v1/?addr={0}".format(ip)).read().decode('utf-8')
res = json.loads(html)
servers_raw = res['response']['servers']
servers = []
for sv in servers_raw:
    servers.append(tuple((ip, int(sv['gameport']))))

while True:
    system('clear')
    total_players = 0
    total_servers = 0
    print("PLAYER BREAKDOWN ON IP: {0}".format(ip).center(79, ' '))
    print("="*79)
    for sv in servers:
        try:
            with valve.source.a2s.ServerQuerier(sv) as query:
                info = query.info()
                pcount = int(info['player_count']) - int(info['bot_count'])
                print('| {0}: {1} players |'.format(info['server_name'].ljust(63, ' '), str(pcount).rjust(2, ' ')))
                total_players += pcount
                if pcount > 0:
                    total_servers += 1

        except valve.source.NoResponseError:
            print('Server at {0} is not responding'.format(sv[0]))
        sys.stdout.flush()

    print("="*79)
    print ('{0}{1}'.format(' TOTAL PLAYERS'.ljust(65, ' '), (str(total_players) + ' players').rjust(12, ' ')))
    print ('{0}{1}'.format(' TOTAL SERVERS'.ljust(65, ' '), (str(total_servers) + ' servers').rjust(12, ' ')))
    sys.stdout.flush()
    time.sleep(10)
