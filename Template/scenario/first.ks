*start
@call storage="custom.ks"
[uiload page=back layer=history storage=backlog visible=false]

[uiload page=fore layer=history storage=backlog visible=false]
[uiload page=fore layer=message0 storage=window visible=false transparent]

[iscript]
SystemLanguage.subLan = "jp";
[endscript]
[jump storage=title.ks]