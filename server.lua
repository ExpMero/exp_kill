local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Lang = module("vrp", "lib/Lang")


vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","exp_kill")




local kill = {function(player, choice)
  local user_id = vRP.getUserId({player})
  if user_id ~= nil then
	    vRPclient.isInComa(player,{}, function(in_coma)
          if not in_coma then
				vRPclient.setHealth(player,{0})
		  end
		  end)
  end
end, "سوف تخسر اموالك و اسلحتك"}
  



vRP.registerMenuBuilder({"main", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
    local choices = {}
      choices['اقتل نفسك'] = kill
    add(choices)
  end
end})
