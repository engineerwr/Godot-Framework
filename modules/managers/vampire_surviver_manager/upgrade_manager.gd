extends Node
class_name UpgradeManager

# Variáveis para armazenar informações sobre as atualizações
var currentUpgradeLevel = 0
var maxUpgradeLevel = 5
var baseUpgradeCost = 10
var upgradeCostMultiplier = 1.5

# Função para verificar se uma atualização pode ser feita
func canUpgrade() -> bool:
	return currentUpgradeLevel < maxUpgradeLevel

# Função para obter o custo da próxima atualização
func getUpgradeCost():
	if canUpgrade():
		return baseUpgradeCost * (upgradeCostMultiplier ** currentUpgradeLevel)
	else:
		return null

# Função para realizar uma atualização
func upgrade(exp_amount: int):
	if canUpgrade() and getUpgradeCost() <= exp_amount:
		var cost = getUpgradeCost()
		currentUpgradeLevel += 1
		return cost
	return 0
