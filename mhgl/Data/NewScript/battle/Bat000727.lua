-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Bat000727.out 

Preload("Quest69205.lua")
Bat000727 = {}
Bat000727.OnInit = function(self)
end

Bat000727.OnPreTurn = function(self, turn)
  battle:DisableCmd(LuaI.BATCMD_HELP)
  battle:SetPunish(false)
end

Bat000727.OnPostTurn = function(self, turn)
end

Bat000727.OnFinish = function(self, turn, result)
  if result == LuaI.END_WIN then
    Quest69205:Return()
  end
  if npc then
    npc:Destroy()
  end
end

AddBattleTable(Bat000727)

