Item555560= {
}

function Item555560:MapUse(target)
  local A = player:GetQuests():GetFlag(80086)
  IAsk("下仙转生以后升级所得潜能点都会寄存于幻境内丹，请问要进行什么操作？积分鬼王任务获取哦")
  SetAnswer(1,"我要洗点") 
  SetAnswer(3,"查询幻境经验")
  SetAnswer(4,"提升当前等级")
  SetAnswer(5,"开启幻境造型") 
  SetAnswer(6,"关闭幻境造型") 
  SetAnswer(8,"离开") 
  WaitAnswer(8)
    
  if GetAnswer() == 1 then
    IAsk("洗点的机会只有一次,少侠确定要进行使用吗?")
    SetAnswer(1,"使用")
    SetAnswer(2,"算了")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      player:ResetCharLevel(Lv)
      ShowHint("已经成功为少侠洗点,请重新分配属性点吧")
    end
 elseif GetAnswer() == 3 then
      ShowHint(string.format("当前你拥有#P%s#W点幻境经验",A))
    elseif GetAnswer() == 4 then
      if player:GetLevel() >= 200 then
        ShowHint("目前等级上限为200级，你需要突破等级#103")
        return
      end
      if A < 50 then
        ShowHint("少侠当前的幻境经验值不足以突破啊,本次突破需要积分50")
        return
      end
      player:GetQuests():SetFlag(80086, A - 50)	
      player:ChangeLevel(1)
      ShowHint("#Y可喜可贺,少侠修为又上升了一步#50")
	elseif GetAnswer() == 5 then
    player:AddBuff(8020, 0, 0, 0, 90000000, 0)
	ShowHint("#G特效已开启。")
    elseif GetAnswer() == 6 then
    player:RemoveBuff(8020)
	ShowHint("#R特效已关闭。")
  end
end
    



--]]

















function Item555560:CanUse(user, target)
end

function Item555560:BattleUse(user, target)
end

AddItemTable(Item555560)