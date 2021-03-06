



 -- Start OnLoad/OnInit/OnConfig events
script.on_configuration_changed( function(data)
  if data.mod_changes ~= nil and data.mod_changes["NightReVision"] ~= nil and data.mod_changes["NightReVision"].old_version == nil then
   -- Mod added 
	
    
  	for _, player in pairs(game.players) do
		if (global.NightReVision_toggle[player.index] == nil) then
			global.NightReVision_toggle[player.index] = {state=true}
		end
	end

   

   
  end 

  if data.mod_changes ~= nil and data.mod_changes["NightReVision"] ~= nil and data.mod_changes["NightReVision"].old_version ~= nil then
   -- Mod updated or removed
   -- Nothing to do

  end

end)


script.on_init(function()
  	global.NightReVision_toggle = global.NightReVision_toggle or {}
    global.NightReVision_NVlist = {}
    global.NightReVision_NVlistmade = 0
 
end)   
  
script.on_load(function()
  --Nothing to Do Now  
end)
-- End OnLoad/OnInit/OnConfig events

function on_player_created(event)
	global.NightReVision_toggle[event.player_index] = {state=true}
end

script.on_event(defines.events.on_player_created, on_player_created)


function on_hotkey(event)
	
  if (global.NightReVision_NVlistmade == 0) then
    global.NightReVision_NVlist = {}
    for eqi, eq in pairs(game.equipment_prototypes) do
      if(eq.type == "night-vision-equipment") then
        if(string.sub(eq.name, -4) ~= "-off") then
          global.NightReVision_NVlist[eq.name] = {eqname = eq.name}
        end
      end
    end
  end
  
  
  
	local player_index = event.player_index
	local player = game.players[player_index]
	
  local parmor = player.get_inventory(defines.inventory.player_armor)[1]
  
  if (parmor.valid_for_read and parmor.grid) then
    local peg = parmor.grid    
    
    --If on toggle off
    if global.NightReVision_toggle[player_index].state then
      
      for _, nvl in pairs (global.NightReVision_NVlist) do
        local lf = nvl.eqname
        for _, eq in pairs(peg.equipment) do
          if (eq.name == lf) then
            --Make all NV into NVoff
            local penergy = eq.energy
            local ppos = eq.position
            
            local discard = peg.take{position=ppos}
            discard=nil
            peg.put{name=lf.."-off",position=ppos}
            peg.get(ppos).energy = penergy
          end
        end
      end
      
      global.NightReVision_toggle[player_index].state = false
      player.print({"NightReVision_toggle_off"})
    
    --If off toggle on
    else

      for _, nvl in pairs (global.NightReVision_NVlist) do
        local lf = nvl.eqname
        for _, eq in pairs(peg.equipment) do
          if (eq.name == lf.."-off") then
            --Make all NVoff into NV
            local penergy = eq.energy
            local ppos = eq.position
            
            local discard = peg.take{position=ppos}
            discard=nil
            peg.put{name=lf,position=ppos}
            peg.get(ppos).energy = penergy
          end
        end
      end

      
      
      global.NightReVision_toggle[player_index].state = true
      player.print({"NightReVision_toggle_on"})
    end
	end
  
end

script.on_event("NightReVision_hotkey", on_hotkey)


