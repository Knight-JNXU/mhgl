--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60222 = {
}

function Item60222:MapUse(target)
local ItemListZ = {
  {itemid = 10080, itemname = "反击"}, 
  {itemid = 10081, itemname = "反震"}, 
  {itemid = 10084, itemname = "飞行"}, 
  {itemid = 10086, itemname = "隐身"}, 
  {itemid = 10087, itemname = "感知"}, 
  {itemid = 10088, itemname = "再生"}, 
  {itemid = 10089, itemname = "冥想"}, 
  {itemid = 10090, itemname = "慧根"}, 
  {itemid = 10092, itemname = "幸运"}, 
  {itemid = 10093, itemname = "神迹"}, 
  {itemid = 10094, itemname = "招架"}, 
  {itemid = 10095, itemname = "永恒"}, 
  {itemid = 10096, itemname = "敏捷"}, 
  {itemid = 10097, itemname = "强力"}, 
  {itemid = 10098, itemname = "防御"}, 
  {itemid = 10100, itemname = "毒"}, 
  {itemid = 10101, itemname = "驱鬼"}, 
  {itemid = 10102, itemname = "鬼魂术"}, 
  {itemid = 10104, itemname = "神佑复生"}, 
  {itemid = 10105, itemname = "精神集中"}, 
  {itemid = 10106, itemname = "否定信仰"}, 
  {itemid = 60200, itemname = "水攻"},
  {itemid = 60201, itemname = "烈火"},
  {itemid = 60202, itemname = "落岩"},
  {itemid = 60203, itemname = "雷击"},
  {itemid = 60208, itemname = "水属性吸收"},
  {itemid = 60209, itemname = "火属性吸收"},
  {itemid = 60210, itemname = "土属性吸收"},
  {itemid = 60211, itemname = "雷属性吸收"}}
  local Item = {
  {itemid = 10083, itemname = "连击"}, 
  {itemid = 10082, itemname = "吸血"}, 
  {itemid = 10085, itemname = "夜战"}, 
  {itemid = 10091, itemname = "必杀"}, 
  {itemid = 10099, itemname = "偷袭"}, 
  {itemid = 10103, itemname = "魔之心"}, 
  {itemid = 10107, itemname = "法术连击"}, 
  {itemid = 10108, itemname = "法术暴击"}, 
  {itemid = 60204, itemname = "地狱烈焰"}, 
  {itemid = 60205, itemname = "水漫金山"}, 
  {itemid = 60206, itemname = "泰山压顶"}, 
  {itemid = 60207, itemname = "奔雷咒"}, 
  {itemid = 10109, itemname = "法术波动"}}
  local i = math.random(1,100)
  IAsk("确定要打开礼盒吗?")
  SetAnswer(1,"打开")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then 
    if not item:ReduceCount() then return end
    if i < 10 then
      local r = RandTable(Item)  
      ShowMessage(string.format("#W获得魔兽要诀[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O魔兽要诀宝盒#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    elseif i <= 100 then
      local r = RandTable(ItemListZ)  
      ShowMessage(string.format("#W获得魔兽要诀[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
   --   script:Rumor(string.format(" %s #W打开了#O魔兽要诀宝盒#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    end
  end
end
    






function Item60222:CanUse(user, target)
end



function Item60222:BattleUse(user, target)

end

AddItemTable(Item60222)