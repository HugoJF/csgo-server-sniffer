rrdtool graph player_count.png \
--imgformat PNG \
--title="Total Players" \
--vertical-label "Player amount" \
--start=n-501min \
--end=n-1min \
--color=BACK#CCCCCC \
--color=CANVAS#FEFEFE \
--color=SHADEB#9999CC \
--height=250 \
--upper-limit=120 \
--lower-limit=0 \
--grid-dash 0:1 \
--no-gridfit \
--watermark "Servidores de_nerdTV" \
--slope-mode \
DEF:sv1=143_202_39_221_27001.rrd:players:AVERAGE \
DEF:sv2=143_202_39_221_27002.rrd:players:AVERAGE \
DEF:sv3=143_202_39_221_27003.rrd:players:AVERAGE \
DEF:sv4=143_202_39_221_27004.rrd:players:AVERAGE \
DEF:sv5=143_202_39_221_27005.rrd:players:AVERAGE \
DEF:sv6=143_202_39_221_27006.rrd:players:AVERAGE \
DEF:sv7=143_202_39_221_27007.rrd:players:AVERAGE \
DEF:sv8=143_202_39_221_27008.rrd:players:AVERAGE \
DEF:sv9=143_202_39_221_27009.rrd:players:AVERAGE \
CDEF:line1=sv1,sv1,UNKN,IF \
CDEF:line2=sv2,sv1,sv2,+,UNKN,IF \
CDEF:line3=sv3,sv1,sv2,sv3,+,+,UNKN,IF \
CDEF:line4=sv4,sv1,sv2,sv3,sv4,+,+,+,UNKN,IF \
CDEF:line5=sv5,sv1,sv2,sv3,sv4,sv5,+,+,+,+,UNKN,IF \
CDEF:line6=sv6,sv1,sv2,sv3,sv4,sv5,sv6,+,+,+,+,+,UNKN,IF \
CDEF:line7=sv7,sv1,sv2,sv3,sv4,sv5,sv6,sv7,+,+,+,+,+,+,UNKN,IF \
CDEF:line8=sv8,sv1,sv2,sv3,sv4,sv5,sv6,sv7,sv8,+,+,+,+,+,+,+,UNKN,IF \
CDEF:line9=sv9,sv1,sv2,sv3,sv4,sv5,sv6,sv7,sv8,sv9,+,+,+,+,+,+,+,+,UNKN,IF \
COMMENT:"        Name | Player Average | Max Players  | Current Players\l" \
COMMENT:" \l" \
AREA:sv1#3634c0:STACK:"Server #1\:" \
GPRINT:sv1:AVERAGE:"%5.1lf players" \
GPRINT:sv1:MAX:"%5.0lf players" \
GPRINT:sv1:LAST:"%5.0lf players\l" \
AREA:sv2#4e34c3:STACK:"Server #2\:" \
GPRINT:sv2:AVERAGE:"%5.1lf players" \
GPRINT:sv2:MAX:"%5.0lf players" \
GPRINT:sv2:LAST:"%5.0lf players\l" \
AREA:sv3#6734c6:STACK:"Server #3\:" \
GPRINT:sv3:AVERAGE:"%5.1lf players" \
GPRINT:sv3:MAX:"%5.0lf players" \
GPRINT:sv3:LAST:"%5.0lf players\l" \
AREA:sv4#8133c9:STACK:"Server #4\:" \
GPRINT:sv4:AVERAGE:"%5.1lf players" \
GPRINT:sv4:MAX:"%5.0lf players" \
GPRINT:sv4:LAST:"%5.0lf players\l" \
AREA:sv5#9c33cc:STACK:"Server #5\:" \
GPRINT:sv5:AVERAGE:"%5.1lf players" \
GPRINT:sv5:MAX:"%5.0lf players" \
GPRINT:sv5:LAST:"%5.0lf players\l" \
AREA:sv6#b635cd:STACK:"Server #6\:" \
GPRINT:sv6:AVERAGE:"%5.1lf players" \
GPRINT:sv6:MAX:"%5.0lf players" \
GPRINT:sv6:LAST:"%5.0lf players\l" \
AREA:sv7#ce36cc:STACK:"Server #7\:" \
GPRINT:sv7:AVERAGE:"%5.1lf players" \
GPRINT:sv7:MAX:"%5.0lf players" \
GPRINT:sv7:LAST:"%5.0lf players\l" \
AREA:sv8#d038b4:STACK:"Server #8\:" \
GPRINT:sv8:AVERAGE:"%5.1lf players" \
GPRINT:sv8:MAX:"%5.0lf players" \
GPRINT:sv8:LAST:"%5.0lf players\l" \
AREA:sv9#d13a9c:STACK:"Server #9\:" \
GPRINT:sv9:AVERAGE:"%5.1lf players" \
GPRINT:sv9:MAX:"%5.0lf players" \
GPRINT:sv9:LAST:"%5.0lf players\l" \
LINE:line1#060451 \
LINE:line2#130453 \
LINE:line3#210456 \
LINE:line4#300459 \
LINE:line5#41045c \
LINE:line6#52045f \
LINE:line7#620360 \
LINE:line8#650353 \
LINE:line9#680345

mv player_count.png graphs/player_count.png