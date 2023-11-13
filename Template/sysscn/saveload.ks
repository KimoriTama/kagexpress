*start

*load
    [syscurrent name=load]
    [jump target=*page]
*save
    [syscurrent name=save]
    [jump target=*page]
*qload
    [syscurrent name=qload]
    [jump target=*page]
*page
    [locklink]
    [backlay]
    [layopt page=back layer=ui1 object=saveload]
    [uiload page=back layer=ui1 storage=file visible]
	[trans layer="uibase" page=fore method=rotatezoom factor=0 time=300 accel=2 twist=0]
	[wt]
    [rclick enabled jump target=*back_rclick]
    [unlocklink]
    [layopt page=fore layer=ui1 action=open]
    [s]
*doload
    [ask ytarget=*doload_success name=askLoad]
    [s]
*doload_success
    [syshook name="load.leave"]
    [s]
*back_rclick
;   [se] 在这里播放音效
*back
    [rclick jump=false]
    [eval exp="tf.sl_state=null,tf.sl_num=null"]
;	先解除模态再交换隐藏
    [locklink]
	[layopt page=fore layer=ui1 mode=false]
    [backlay]
    [layopt page=back layer=ui1 visible=false]
	[trans layer=uibase page=fore method=rotatevanish  time=300 twist=0]
	[wt]
    [layopt page=fore layer=ui1 action=close]
    [unlocklink]
    [return]

