data:extend(
{
  {
    type = "night-vision-equipment",
    name = "night-vision-equipment-off",
    sprite =
    {
      filename = "__NightReVision__/graphics/night-vision-equipment-off.png",
      width = 96,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 3,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "120kJ",
      input_flow_limit = "240kW",
      usage_priority = "primary-input"
    },
    energy_input = "00kW",
    tint = {r = 0, g = 0.0, b = 0, a = 0.0},
    categories = {"armor"}
  },
  
  {
    type = "item",
    name = "night-vision-equipment-off",
    icon = "__base__/graphics/icons/night-vision-equipment.png",
    placed_as_equipment_result = "night-vision-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "f[night-vision]-a[night-vision-equipment]",
    stack_size = 20
  },
  
  {
    type = "custom-input",
    name = "NightReVision_hotkey",
    key_sequence = "F2",
    consuming = "script-only"
  }
  
})