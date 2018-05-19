--author: apollo
--精铁礼盒

Item60222 = {
}

function Item60222:MapUse(target)
local ItemListZ = {
  {itemid = 20251, itemname = "60级百炼精铁"}, 
  {itemid = 20252, itemname = "70级百炼精铁"}, 
  {itemid = 20253, itemname = "80级百炼精铁"}}
  local Item = {
  {itemid = 20254, itemname = "90级百炼精铁"}, 
  {itemid = 20255, itemname = "100级百炼精铁"}, 
  {itemid = 20256, itemname = "110级百炼精铁"}}
  local Item2 = {{itemid = 20257, itemname = "120级百炼精铁"}}
  local i = math.random(1,100)
  IAsk("确定要打开礼盒吗?")
  SetAnswer(1,"打开")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then 
    if not item:ReduceCount() then return end
	  if i <= 10 then
      local r = RandTable(Item2)  
      ShowMessage(string.format("#W获得[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O百炼精铁礼盒#W,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    elseif i < 30 then
      local r = RandTable(Item)  
      ShowMessage(string.format("#W获得[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O百炼精铁礼盒#W,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    elseif i <= 100 then
      local r = RandTable(ItemListZ)  
      ShowMessage(string.format("#W获得[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
    end
  end
end
    






function Item60222:CanUse(user, target)
end



function Item60222:BattleUse(user, target)

end

AddItemTable(Item60222)