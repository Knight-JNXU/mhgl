-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00704 = {							-- 孙小红
	npc_id = 704,						-- NPC ID
	name = GetNpcName(704),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00704:Talk(bProcess)
NpcAsk("我是“超级神兽使者”,如果你是游戏活动中获得相关奖项的玩家,可以通过我进入神兽乐园寻找对应的神兽领取奖励！欢迎你常来乐园中,与我的伙伴们一同玩耍(特别注意,各项活动奖品的领取时间限制是不同的,请玩家查看相关的主页xyq.163.com公告)")
  SetAnswer(1,"我是来带神兽回家的")
     
  SetAnswer(3,"我是专程来和神兽进行一次零距离沟通的")
  WaitAnswer(3)
  if GetAnswer() == 1 then		
    local listmobid = {367}
              local mobid = RandTable(listmobid)
              local mobname = GetMobName(mobid)
              player:GetPartners():AddPartner(mobid)
              ShowError(string.format("#W获得%s", mobname))
script:Rumor(string.format("#E%s #O千辛万苦集齐99个#R神兜兜#O,让我们恭喜他本次兑换的是#P%s #O只见#P%s#O对他#E%s#O说道：#R“让我们一起做对好基友吧#28#28”", player:GetCharNameLink(), mobname, mobname, player:GetCharNameLink()), false)
				        player:GetOwner()
	end	
  if GetAnswer() == 2 then
    if player:GetPartners():GetPartnerCount(367) < 1 then
      ShowHint("你并没有像本宝宝这么可爱的的神兽")
      return 
    end	
    if player:GetItems():GetItemCount(80170) < 30 then
      ShowHint("你还缺少30个百年妖魔内丹")
      return 
    end
    if player:GetItems():GetItemCount(80171) < 25 then
      ShowHint("你还缺少25个千年妖魔内丹")
      return 
    end	
    if player:GetItems():GetItemCount(80172) < 20 then
      ShowHint("你还缺少20个万年妖魔内丹")
      return 
    end	
	player:GetPartners():RemovePartner(367)
    player:GetItems():RemoveItem(80170, 30)
    player:GetItems():RemoveItem(80171, 25)	
    player:GetItems():RemoveItem(80172, 20)	
    player:GetPartners():AddPartner(RandTable({7087}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将神兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  player:GetOwner()
  end	
	end   

-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00704)
