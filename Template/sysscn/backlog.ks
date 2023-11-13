
*start
;	[sysse    name="backlog.open"]

*open
	[stoptrans layer=uibase]
	[rclick jump target=*back_rclick]
	[backlay]
	[layopt layer=message0 page=back visible=false]
	[layopt layer=history page=back visible action=dispInit]
	[trans layer="uibase" page=fore method=rotatezoom factor=0 time=500 accel=2 twist=0]
	[wt]
	[s]
;	[jump target=*page_done]
*back_rclick
;   [se] 在这里播放音效
*back
;	[sysse    name="backlog.close"]
	[stoptrans layer=uibase]
	[backlay]
	[layopt layer=history page=back visible=false]
	[layopt layer=message0 page=back visible=true]
	[trans layer=uibase page=fore method=rotatevanish  time=300 twist=0]
	[wt]
	[rclick jump=false]
	[return]

*page
	[stoptrans]
	[backlay]

	[syshook  name="backlog.page.init"]
	[syspage current page=back]
	[syspage  uiload page=back]

	[dialog   action="onShow"]
	[systrans name="backlog.page" method=crossfade time=300]
	[wt]
*page_done
	[syspage  current page=fore]
	[rclick   enabled jump storage="" target=*back_rclick]

	[syshook  name="backlog.page.done"]
*wait
	[dialog   action="onWait"]
	[s]
	[s]

*jump
	[locklink]
	[stoptrans]
	[begintrans]
	[syspage  free page=back]
	[dialog   action="onHide"]
	[syshook  name="backlog.jump.init"]
	[clearlayers page=back]
;;	[allimage hide delete]
	[all ontype=layer delete]
	[all ontype=dlayer delete]
	[systrans env name="backlog.jump" method=crossfade time=1000]
	[syshook  name="backlog.jump.done"]
*jump_go
	[syscurrent name="game"]
	[sysrestore]

	[syshook  name="backlog.jump"]
	[dialog  action=invokeJump]
	[s]


; ゲームに戻る
*game
	[locklink]
	[stoptrans]
	[backlay]
	[syspage  free page=back]
	[syshook  name="backlog.close.init"]

	[dialog   action="onHide"]
	[systrans name="backlog.close" method=crossfade time=300]
	[wt]

	[syshook  name="backlog.close.done"]
	[sysjump  from="backlog" to="game" back]
