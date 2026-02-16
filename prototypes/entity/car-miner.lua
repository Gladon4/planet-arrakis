mining_car = table.deepcopy(data.raw["car"]["car"])

mining_car.name = "mining-car"
mining_car.allow_remote_driving = true
mining_car.minable = {mining_time = 0.4, result = "iron-plate"}
mining_car.consumption = "500kW"
mining_car.braking_power = "1000kW"
mining_car.effectivity = 0.3
mining_car.is_military_target = true

data.extend{mining_car}