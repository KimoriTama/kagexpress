*start
    [startanchor]
    [syscurrent name=title]
    [uiload page=fore layer=ui0 storage=title partremove=rm_noclear visible=true object=title]
    [image layer="base" page="fore"  storage="title_bg"]
    [playbgm loop=true storage=bgm51]
    [s]
*game
    [syshook name="game.enter"]
    [layopt layer=ui0 page=fore visible=false]
    [jump storage=chapter1.ks]
*option
    [sysjump to=option call]
    [s]
*load
    [sysjump to=load call]
    [s]
*exit
    [close]
    [s]
*continue

    [s]
*game_return

    [return]