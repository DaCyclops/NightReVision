
 local buildlist = {}

for eqi, eq in pairs(data.raw["night-vision-equipment"]) do
 buildlist[eq.name] = {
    name = eq.name,
    sprite = eq.sprite,
    shape = eq.shape,
    energy_source = eq.energy_source,
    categories = eq.categories
   }
 
end

for eqi, eq in pairs (buildlist) do

data:extend(
{
  {
    type = "night-vision-equipment",
    name = eq.name .. "-off",
    localised_name = {"equipment-name."..eq.name,{"gui-power-switch.off"}},
    sprite =
    {
      filename = eq.sprite.filename,
      width = eq.sprite.width,
      height = eq.sprite.height,
      priority = "medium",
      tint = {r=0.8, g=0.1, b=0.3, a=1.0},
    },
    shape = eq.shape,
    energy_source = eq.energy_source,
    energy_input = "00kW",
    tint = {r = 0, g = 0.0, b = 0, a = 0.0},
    categories = eq.categories
  },
  
  {
    type = "item",
    name = eq.name .. "-off",
    localised_name = {"equipment-name."..eq.name,{"gui-power-switch.off"}},
    icon = data.raw.item[eq.name].icon,
    placed_as_equipment_result = eq.name,
    flags = data.raw.item[eq.name].flags,
    subgroup = data.raw.item[eq.name].subgroup,
    order = data.raw.item[eq.name].order,
    stack_size = data.raw.item[eq.name].stack_size
  },
  
})

end

data:extend(
{
 
  {
    type = "custom-input",
    name = "NightReVision_hotkey",
    key_sequence = "F2",
    consuming = "script-only"
  }
  
})