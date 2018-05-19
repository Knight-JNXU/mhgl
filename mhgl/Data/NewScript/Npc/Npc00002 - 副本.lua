-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00002 = {							-- 孙小红
	npc_id = 2,						-- NPC ID
	name = GetNpcName(2),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00002:Talk(bProcess)
if player:GetFaction() ==  1 then --LG
    player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  2 and player:GetSkillLv(1800) > 0 then -- st
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	--player:RemoveSkill(1800)--st
    --player:RemoveSkill(1810)
    --player:RemoveSkill(1820)
    --player:RemoveSkill(1830)
    --player:RemoveSkill(1840)
    --player:RemoveSkill(1850)
    --player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  2 and player:GetSkillLv(11000) > 0 then -- mw
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	--player:RemoveSkill(11000)--魔王
    --player:RemoveSkill(11010)
    --player:RemoveSkill(11020)
    --player:RemoveSkill(11030)
    --player:RemoveSkill(11040)
    --player:RemoveSkill(11050)
    --player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  3 and player:GetSkillLv(12000) > 0 then -- DF
	--player:RemoveSkill(12000)--地府
    --player:RemoveSkill(12010)
   -- player:RemoveSkill(12020)
    --player:RemoveSkill(12030)
   -- player:RemoveSkill(12040)
   -- player:RemoveSkill(12050)
    --player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  3 and player:GetSkillLv(2600) > 0 then -- fc
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
   player:RemoveSkill(12020)
    player:RemoveSkill(12030)
   player:RemoveSkill(12040)
   player:RemoveSkill(12050)
   player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	--player:RemoveSkill(2600)--fc
    --player:RemoveSkill(2610)
    --player:RemoveSkill(2620)
    --player:RemoveSkill(2630)
    --player:RemoveSkill(2640)
    --player:RemoveSkill(2650)
    --player:RemoveSkill(2660)
	elseif player:GetFaction() ==  3 and player:GetSkillLv(21000) > 0 then -- wz
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	--player:RemoveSkill(21000)--WZ
    --player:RemoveSkill(21010)
    --player:RemoveSkill(21020)
    --player:RemoveSkill(21030)
    --player:RemoveSkill(21040)
    --player:RemoveSkill(21050)
    --player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  4  then -- tg
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	--player:RemoveSkill(16000)--TG
   -- player:RemoveSkill(16010)
   -- player:RemoveSkill(16020)
   -- player:RemoveSkill(16030)
    --player:RemoveSkill(16040)
   -- player:RemoveSkill(16050)
   -- player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  5 and player:GetSkillLv(20000) > 0 then -- pt
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	--player:RemoveSkill(20000)--PT
    --player:RemoveSkill(20010)
    --player:RemoveSkill(20020)
    --player:RemoveSkill(20030)
    --player:RemoveSkill(20040)
    --player:RemoveSkill(20050)
    --player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  5 and player:GetSkillLv(17000) > 0 then -- ne
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	--player:RemoveSkill(17000)--ne
    --player:RemoveSkill(17010)
    --player:RemoveSkill(17020)
    --player:RemoveSkill(17030)
    --player:RemoveSkill(17040)
    --player:RemoveSkill(17050)
    --player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  6  then -- hs
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	--player:RemoveSkill(19000)--HS
    --player:RemoveSkill(19010)
    --player:RemoveSkill(19020)
    --player:RemoveSkill(19030)
    --player:RemoveSkill(19040)
    --player:RemoveSkill(19050)
    --player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  7  then -- dt
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    --player:RemoveSkill(13000)--DT
    --player:RemoveSkill(13010)
    --player:RemoveSkill(13020)
    --player:RemoveSkill(13030)
    --player:RemoveSkill(13040)
    --player:RemoveSkill(13050)
    --player:RemoveSkill(13060)
    player:RemoveSkill(15000)--ps
    player:RemoveSkill(15010)
    player:RemoveSkill(15020)
    player:RemoveSkill(15030)
    player:RemoveSkill(15040)
    player:RemoveSkill(15050)
    player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
	elseif player:GetFaction() ==  8  then -- ps
	player:RemoveSkill(12000)--地府
    player:RemoveSkill(12010)
    player:RemoveSkill(12020)
    player:RemoveSkill(12030)
    player:RemoveSkill(12040)
    player:RemoveSkill(12050)
    player:RemoveSkill(12060)
	player:RemoveSkill(21000)--WZ
    player:RemoveSkill(21010)
    player:RemoveSkill(21020)
    player:RemoveSkill(21030)
    player:RemoveSkill(21040)
    player:RemoveSkill(21050)
    player:RemoveSkill(21060)
	player:RemoveSkill(1800)--st
    player:RemoveSkill(1810)
    player:RemoveSkill(1820)
    player:RemoveSkill(1830)
    player:RemoveSkill(1840)
    player:RemoveSkill(1850)
    player:RemoveSkill(1860)
	player:RemoveSkill(11000)--魔王
    player:RemoveSkill(11010)
    player:RemoveSkill(11020)
    player:RemoveSkill(11030)
    player:RemoveSkill(11040)
    player:RemoveSkill(11050)
    player:RemoveSkill(11060)
    player:RemoveSkill(13000)--DT
    player:RemoveSkill(13010)
    player:RemoveSkill(13020)
    player:RemoveSkill(13030)
    player:RemoveSkill(13040)
    player:RemoveSkill(13050)
    player:RemoveSkill(13060)
    --player:RemoveSkill(15000)--ps
    --player:RemoveSkill(15010)
    --player:RemoveSkill(15020)
    --player:RemoveSkill(15030)
    --player:RemoveSkill(15040)
    --player:RemoveSkill(15050)
    --player:RemoveSkill(15060)	
	player:RemoveSkill(16000)--TG
    player:RemoveSkill(16010)
    player:RemoveSkill(16020)
    player:RemoveSkill(16030)
    player:RemoveSkill(16040)
    player:RemoveSkill(16050)
    player:RemoveSkill(16060)
	player:RemoveSkill(17000)--ne
    player:RemoveSkill(17010)
    player:RemoveSkill(17020)
    player:RemoveSkill(17030)
    player:RemoveSkill(17040)
    player:RemoveSkill(17050)
    player:RemoveSkill(17060)
	player:RemoveSkill(19000)--HS
    player:RemoveSkill(19010)
    player:RemoveSkill(19020)
    player:RemoveSkill(19030)
    player:RemoveSkill(19040)
    player:RemoveSkill(19050)
    player:RemoveSkill(19060)
	player:RemoveSkill(20000)--PT
    player:RemoveSkill(20010)
    player:RemoveSkill(20020)
    player:RemoveSkill(20030)
    player:RemoveSkill(20040)
    player:RemoveSkill(20050)
    player:RemoveSkill(20060)
	player:RemoveSkill(10000)--lg
    player:RemoveSkill(10010)
    player:RemoveSkill(10020)
    player:RemoveSkill(10030)
    player:RemoveSkill(10040)
    player:RemoveSkill(10050)
    player:RemoveSkill(10060)
	player:RemoveSkill(2600)--fc
    player:RemoveSkill(2610)
    player:RemoveSkill(2620)
    player:RemoveSkill(2630)
    player:RemoveSkill(2640)
    player:RemoveSkill(2650)
    player:RemoveSkill(2660)
end
  if  player:GetLevel() >= 10 then
  NpcAsk("欢迎使用GM传送功能,请问你要去那里？")
  SetAnswer(1, "建邺城")
  SetAnswer(2, "东海湾")
  SetAnswer(3, "东海海底")
  SetAnswer(4, "沉船")
  SetAnswer(5, "沉船内室")
  SetAnswer(6, "江南野外")
  SetAnswer(7, "傲来国")
  SetAnswer(8, "花果山")
  SetAnswer(9, "东海岩洞")
  SetAnswer(10, "女儿村")
  SetAnswer(11, "北俱芦洲")
  SetAnswer(12, "长寿村郊外")
  SetAnswer(13, "天宫")
  SetAnswer(14, "下一页")
  SetAnswer(15, "离开")
  WaitAnswer(15)
  if GetAnswer() == 1 then
    player:JumpMap(1,12,44)--建邺城
  elseif GetAnswer() == 2 then
    player:JumpMap(2,47,237)--东海湾
  elseif GetAnswer() == 3 then
    player:JumpMap(3,36,101)--东海海底
  elseif GetAnswer() == 4 then
    player:JumpMap(4,26,97)--沉船
  elseif GetAnswer() == 5 then
    player:JumpMap(5,8,43)--沉船内室
  elseif GetAnswer() == 6 then
    player:JumpMap(6,44,175)--江南野外
  elseif GetAnswer() == 7 then
    player:JumpMap(7,74,144)--傲来国
  elseif GetAnswer() == 8 then
    player:JumpMap(8,30,140)--花果山
  elseif GetAnswer() == 9 then
    player:JumpMap(9,13,148)--东海岩洞
  elseif GetAnswer() == 10 then
    player:JumpMap(10,41,201)--女儿村
  elseif GetAnswer() == 11 then
    player:JumpMap(11,71,229)--北俱芦洲
  elseif GetAnswer() == 12 then
    player:JumpMap(12,83,223)--长寿村郊外
  elseif GetAnswer() == 13 then
    player:JumpMap(13,51,188)--天宫
  elseif GetAnswer() == 14 then
    ItemAsk("欢迎使用#KJ#W传送系统,请问您需要去那儿？")
    SetAnswer(1, "大唐境外")
    SetAnswer(2, "五庄观")
    SetAnswer(3, "盘丝岭")
    SetAnswer(4, "狮驼岭")
    SetAnswer(5, "魔王寨")
    SetAnswer(6, "大唐国境")
    SetAnswer(7, "地府")
    SetAnswer(8, "龙宫")
    SetAnswer(9, "海底迷宫一层")
    SetAnswer(10, "海底迷宫二层")
    SetAnswer(11, "海底迷宫三层")
    SetAnswer(12, "海底迷宫四层")
    SetAnswer(13, "普陀山")
    SetAnswer(14, "下一页")
    SetAnswer(15, "离开")
    WaitAnswer(15)
    if GetAnswer() == 1 then
      player:JumpMap(14,238,245)--大唐境外
    elseif GetAnswer() == 2 then
      player:JumpMap(15,31,105)--五庄观
    elseif GetAnswer() == 3 then
      player:JumpMap(16,114,62)--盘丝岭
    elseif GetAnswer() == 4 then
      player:JumpMap(17,68,37)--狮驼岭
    elseif GetAnswer() == 5 then
      player:JumpMap(18,53,56)--魔王寨
    elseif GetAnswer() == 6 then
      player:JumpMap(19,32,670)--大唐国境
    elseif GetAnswer() == 7 then
      player:JumpMap(20,28,166)--地府
    elseif GetAnswer() == 8 then
      player:JumpMap(21,124,226)--龙宫
    elseif GetAnswer() == 9 then
      player:JumpMap(22,18,44)--海底迷宫一层
    elseif GetAnswer() == 10 then
      player:JumpMap(23,19,30)--海底迷宫二层
    elseif GetAnswer() == 11 then
      player:JumpMap(24,27,37)--海底迷宫三层
    elseif GetAnswer() == 12 then
      player:JumpMap(25,18,33)--海底迷宫四层
    elseif GetAnswer() == 13 then
      player:JumpMap(26,51,68)--普陀山
    elseif GetAnswer() == 14 then
      ItemAsk("欢迎使用#PKJ#W传送系统,请问您需要去那儿？")
      SetAnswer(1, "大唐官府")
      SetAnswer(2, "化生寺")
      SetAnswer(3, "方寸山")
      SetAnswer(4, "大雁塔一层")
      SetAnswer(5, "大雁塔二层")
      SetAnswer(6, "大雁塔三层")
      SetAnswer(7, "大雁塔四层")
      SetAnswer(8, "长安城")
      SetAnswer(9, "无名鬼域")
      SetAnswer(15, "离开")
      WaitAnswer(15)
      if GetAnswer() == 1 then
        player:JumpMap(27,49,145)--大唐官府
      elseif GetAnswer() == 2 then
        player:JumpMap(28,29,161)--化生寺
      elseif GetAnswer() == 3 then
        player:JumpMap(29,74,193)--方寸山
      elseif GetAnswer() == 4 then
        player:JumpMap(30,36,101)--大雁塔一层
      elseif GetAnswer() == 5 then
        player:JumpMap(31,52,52)--大雁塔二层
      elseif GetAnswer() == 6 then
        player:JumpMap(32,38,101)--大雁塔三层
      elseif GetAnswer() == 7 then
        player:JumpMap(33,74,97)--大雁塔四层
      elseif GetAnswer() == 8 then
        player:JumpMap(34,265,544)--长安城
      elseif GetAnswer() == 9 then
        player:JumpMap(53,27,293)--无名鬼域
      end
    end
  end
  
end
     end 
 
   

--]]










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00002)
