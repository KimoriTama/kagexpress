*init
    [addSysHook   name="exit.end" call storage="custom.ks" target=*exit]
    [addSysHook   name="load.leave" call=false storage="custom.ks" target=*doload]
    [addSysHook   name="game.enter" call storage="custom.ks" target=*black]
    [return]
;黑屏
*black
    [locklink]
    [clickskip enabled=false]
    [stoptrans]
    [backlay]
    [clearLayers page=back]
    [trans page=fore layer=base time=1000 method=crossfade]
    [trans page=fore layer=uibase time=1000 method=crossfade]
    [wt]
    [unlocklink]
    [clickskip enabled=true]
    [return]
*doload
    [call target=*black]
    [load place="&tf.load_number"]
    [s]
*gototitle
    [call target=*black]
    [gotostart ask=false]
    [s]
*continue
    [call target=*black]
    [eval exp="SystemAction.conti()"]
    [s]
*exit
    [call target=*black]
;   [se]
    [return]