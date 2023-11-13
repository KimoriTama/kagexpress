; 
; 系统设置是标准的设置，load save也参考这个  这个系统是 jump的来源决定渐变方式，进行开启， 
;返回只看是否来自于标题或游戏，甚至说根本不进行判断，用统一的方式，还有就是鼠标返回多一个音效
;
*start_title
	[stoptrans layer=uibase]
	[locklink]
	[backlay]
	[layopt page=back layer=ui1 object=option]
	[uiload page=back layer=ui1 storage=sys_base]
	[trans layer="uibase" page=fore method=rotatezoom factor=0 time=300 accel=2 twist=0]
	[wt]
	[rclick enabled jump target=*back_rclick]
	[layopt page=fore layer=ui1 action=open]
	[unlocklink]
	[s]
*start_game
	[stoptrans layer=uibase]
	[locklink]
	[backlay]
	[layopt page=back layer=message0 visible=false]
	[layopt page=back layer=ui1 object=option]
	[uiload page=back layer=ui1 storage=sys_base]
	[trans layer="uibase" page=fore method=rotatezoom factor=0 time=300 accel=2 twist=0]
	[wt]
	[rclick enabled jump target=*back_rclick]
	[layopt page=fore layer=ui1 action=open]
	[unlocklink]
	[s]
*back_title
	[jump target=*back cond=!inGameState()]
	[eval exp="SystemAction.title()"]
	[s]
*back_rclick
; 右クリック効果音
;[sysse   name="option.rclick"]
*back
;	先解除模态再交换隐藏
	[layopt page=fore layer=ui1 mode=false]
	[backlay]
	[locklink]
	[layopt page=back layer=message0 visible cond=inGameState()]
	[layopt page=back layer=ui1 visible=false]
	[trans layer=uibase page=fore method=rotatevanish  time=300 twist=0]
	[wt]
	[rclick jump=false]
	[unlocklink]
	[return]

*page
	[stoptrans layer=uibase]
	[backlay]
	[layopt page=back layer=ui1 object=option]
	[uiload page=back layer=ui1 storage=sys_base]
	[trans page=fore layer=uibase method=crossfade time=300]
	[wt]
	[unlocklink]
	[s]


;这个不是我写的
*open
	[stoptrans]
	[backlay]

	[syshook name="option.open.init"]
	[syspage uiload page=back]

	[systrans name="option.open" method=crossfade time=300]
	[wt]
	[jump target=*page_done]




; 復帰処理	也不是我写的
*return
	[backlay]
	[syspage free page=back]
	[syshook name="option.close.init"]

	[systrans name="option.close" method=crossfade time=300]
	[wt]
*return_done
	[syshook name="option.close.done"]
	[sysrestore]
	[return]
