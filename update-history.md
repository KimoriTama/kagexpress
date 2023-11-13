# 更新履历
## 删除的指令
- move   (全部可以使用anim系指令替代)
- wm
- stopmove
- action   
- stopAction
- wact
- pimage    (主要用于动画的指令，应使用部件动画替代)
- ptext
- locate        (控件命令自带xy坐标，文字无法使用这种方式)
- position  (统一使用layopt指令替代)
- link
- endlink
- sysbutton
- csysbutton
- dispname 新指令替代:
- 以下是文字模式关联的删除的指令 
- indent    
- endindent
- autoindent
- graph
- hch
- ruby
- orich
- origr
- linemode
- l 
- r
- hr
- ch 
- craftername
- erafterpage
- autowc
- nor
- hact 履历层相关
- endhact
- 以下因为存档模式智能化而删除的指令
- autolabelmode  
- autolabel
- record
## 参数有所改变
- p 原来是宏，改为了指令，绑定到text指令后自动触发，一般不需要直接使用
- animstart 增加了name 指定动画名称
- animestop 增加了name 指定动画名称
- wa 增加了name 指定动画名称
- stoptrans     增加停止指定层渐变的功能，可用层增加了uibase 和ui0...
- glyph  去掉了line的参数，增加 anime代表动画图片数量 horizon 代表是否横向排列
- layout    增加action参数触发方法，如果为dialogLayer 还可以有 object参数指定行为控制对象
## 新增的指令
- sv (立绘切换指令)
- text 文字处理，配合多语言功能
- uiload  加载ui到dialog图层上
- ask 打开询问窗口，进行跳转
- syscurrent  记录当前系统的状态
- addsyshook  注册跳转(或调用)的脚本
- syshook   执行注册的方法
- sysexec   执行方法（因为ks文件只能表示字符串，而参数需要对象,所以仅由内部使用）
- sysjump   触发跳转，触发相关的注册的钩子
- clearplaytime 记录游玩时长(开始游戏时需要调用，用于记录游玩时长)
- playvoice 新增角色语音相关控制
- stopvoive 停止角色的语音
- fadevoice 渐变语音
- waitvoice 等待角色语音
## 说明

### sv

>  **描述：**

更新立绘的指令，具体的参数对应何种立绘需要事先定义。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |chara| 角色|
 |eye| 眼部表情|
 |dress| 衣服|
 |pose| 姿势|
 |mouse| 嘴部表情|
 |parts| 部件，逗号分割|
 |其他加载图片的参数| 参见 CharacterLayer |

### text

>  **描述：**

支持双语言的文本。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |chara| 角色|
 |eye| 眼部表情|
 |dress| 衣服|
 |pose| 姿势|
 |mouse| 嘴部表情|
 |parts| 部件，逗号分割|
 |其他加载图片的参数| 参见 CharacterLayer |
 
 ### uiload

>  **描述：**

加载ui到dialog层上。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |storage| ui定义文件，具体使用方式很复杂，请查看uiloader.tjs里的注释|
 |layer| 眼部表情|
 |page| 表层或里层|
 
### ask

>  **描述：**

进行对话框选择。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |ystorage| 选择是时跳转文件|
 |ytarget| 选择是时跳转标签|
 |nstorage| 选择否时跳转文件|
 |ntarget| 选择否时跳转标签|

### sysexec

>  **描述：**

执行方法（因为ks文件只能表示字符串，而参数需要对象,所以仅由内部使用）

> **入参：**

无

 
### syscurrent

>  **描述：**

系统当前状态，会影响SysHook.kagJump的行为。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |name| 系统当前状态|
 
### addsyshook

>  **描述：**

注册钩子。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |stoarge| 跳转文件|
 |target| 跳转标签|
 |call| 是否保留call栈，可以return返回|

### syshook

>  **描述：**

 执行注册的钩子。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |name| 钩子名|


### sysjump

>  **描述：**

系统跳转

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |from| 来源状态，不填写为当前状态|
 |to| 去向状态，必填|
 |call| 是否保留call栈，可以return返回|
 |back| 是否触发back钩子|
 

### clearplaytime

>  **描述：**

记录游玩时长(开始游戏时需要调用，用于记录游玩时长）,会影响存档的游玩时间。

> **入参：**
  无

 
  ### playvoice

>  **描述：**

播放角色的语音，可以播放背景循环语音(例如hs的喘息等)。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |mode| 选择是时跳转文件|
 |type| 类型，0为一般类型，1为循环语音，2为hs循环语音|
 |loop| 是否循环|
 |pan| 左右声道|
 |noflip| 是否触发逐帧事件(一般用于口型变化)|
 |fade| 是否渐变|

  ### stopvoive

>  **描述：**

停止角色的语音。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |name| 停止的角色|
 |time| 渐变时间|
 |all| 是否停止背景循环语音|



  ### fadevoice

>  **描述：**

渐变角色的音量。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |name| 停止的角色|
 |fade| 渐变的音量|
 |time| 渐变时间|


  ### waitvoice

>  **描述：**

等待角色语音结束。

> **入参：**

 | 参数名 |  描述 |
 |----| ----|
 |name| 等待的角色|
 |all| 是否包括背景循环语音|

