rrdtool create 143_202_39_221_27001.rrd --step 60 DS:players:GAUGE:120:0:16 RRA:AVERAGE:0.5:1:3600 RRA:AVERAGE:0.5:60:1440 RRA:AVERAGE:0.5:3600:720
