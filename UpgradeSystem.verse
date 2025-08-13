using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/UI }
using { /Fortnite.com/World }

# Upgrade System for Tycoon Game
# Handles all upgrade mechanics, progression, and unlockables

# Upgrade Types
enum UpgradeType :
    ResourceGeneration
    CollectionSpeed
    StorageCapacity
    AutoCollection
    Multiplier
    SpecialAbility

# Upgrade Categories
enum UpgradeCategory :
    Generator
    Collector
    Storage
    Player
    Special

# Upgrade Class
class Upgrade :
    var UpgradeID : string = ""
    var UpgradeName : string = ""
    var UpgradeType : UpgradeType = UpgradeType.ResourceGeneration
    var UpgradeCategory : UpgradeCategory = UpgradeCategory.Generator
    var CurrentLevel : int = 0
    var MaxLevel : int = 10
    var BaseCost : int = 100
    var CostMultiplier : float = 1.5
    var IsUnlocked : logic = false
    var IsMaxed : logic = false
    
    # Upgrade Effects
    var GenerationMultiplier : float = 1.0
    var CollectionSpeedMultiplier : float = 1.0
    var StorageMultiplier : float = 1.0
    var AutoCollectionEnabled : logic = false
    var MultiplierBonus : float = 1.0
    
    # Device References
    var UpgradeDevice : PropDevice = PropDevice{}
    var EffectDevice : EffectDevice = EffectDevice{}
    var AudioDevice : AudioDevice = AudioDevice{}
    
    Initialize(id : string, name : string, type : UpgradeType, category : UpgradeCategory, baseCost : int) : void =
        UpgradeID = id
        UpgradeName = name
        UpgradeType = type
        UpgradeCategory = category
        BaseCost = baseCost
        CurrentLevel = 0
        MaxLevel = 10
        CostMultiplier = 1.5
        IsUnlocked = false
        IsMaxed = false
        
        # Initialize multipliers
        GenerationMultiplier = 1.0
        CollectionSpeedMultiplier = 1.0
        StorageMultiplier = 1.0
        AutoCollectionEnabled = false
        MultiplierBonus = 1.0
    
    # Get Upgrade Cost
    GetUpgradeCost() : int =
        if (CurrentLevel >= MaxLevel) then
            0
        else
            (BaseCost * (CostMultiplier ^ CurrentLevel)).Floor()
    
    # Can Afford Upgrade
    CanAffordUpgrade(playerResources : int) : logic =
        playerResources >= GetUpgradeCost()
    
    # Perform Upgrade
    PerformUpgrade() : logic =
        if (CurrentLevel < MaxLevel) then
            CurrentLevel += 1
            ApplyUpgradeEffects()
            PlayUpgradeEffect()
            
            if (CurrentLevel >= MaxLevel) then
                IsMaxed = true
            
            true
        else
            false
    
    # Apply Upgrade Effects
    ApplyUpgradeEffects() : void =
        if (UpgradeType = UpgradeType.ResourceGeneration) then
            GenerationMultiplier += 0.2
        else if (UpgradeType = UpgradeType.CollectionSpeed) then
            CollectionSpeedMultiplier += 0.15
        else if (UpgradeType = UpgradeType.StorageCapacity) then
            StorageMultiplier += 0.25
        else if (UpgradeType = UpgradeType.AutoCollection) then
            if (CurrentLevel = 1) then
                AutoCollectionEnabled = true
        else if (UpgradeType = UpgradeType.Multiplier) then
            MultiplierBonus += 0.1
    
    # Play Upgrade Effect
    PlayUpgradeEffect() : void =
        EffectDevice.PlayEffect()
        AudioDevice.Play()
    
    # Get Current Level
    GetCurrentLevel() : int = CurrentLevel
    
    # Get Max Level
    GetMaxLevel() : int = MaxLevel
    
    # Is Upgrade Maxed
    IsUpgradeMaxed() : logic = IsMaxed
    
    # Get Upgrade Progress
    GetUpgradeProgress() : float = CurrentLevel / MaxLevel

# Upgrade Manager Class
class UpgradeManagerSystem :
    var AvailableUpgrades : []Upgrade = array{}
    var UnlockedUpgrades : []Upgrade = array{}
    var MaxedUpgrades : []Upgrade = array{}
    
    # Initialize Upgrade Manager
    Initialize() : void =
        CreateDefaultUpgrades()
    
    # Create Default Upgrades
    CreateDefaultUpgrades() : void =
        # Generator Upgrades
        var goldGenUpgrade : Upgrade = Upgrade()
        goldGenUpgrade.Initialize("gold_gen", "Gold Generator", UpgradeType.ResourceGeneration, UpgradeCategory.Generator, 100)
        AvailableUpgrades = AvailableUpgrades + array{goldGenUpgrade}
        
        var woodGenUpgrade : Upgrade = Upgrade()
        woodGenUpgrade.Initialize("wood_gen", "Wood Generator", UpgradeType.ResourceGeneration, UpgradeCategory.Generator, 150)
        AvailableUpgrades = AvailableUpgrades + array{woodGenUpgrade}
        
        var metalGenUpgrade : Upgrade = Upgrade()
        metalGenUpgrade.Initialize("metal_gen", "Metal Generator", UpgradeType.ResourceGeneration, UpgradeCategory.Generator, 200)
        AvailableUpgrades = AvailableUpgrades + array{metalGenUpgrade}
        
        # Collector Upgrades
        var collectionSpeedUpgrade : Upgrade = Upgrade()
        collectionSpeedUpgrade.Initialize("collection_speed", "Collection Speed", UpgradeType.CollectionSpeed, UpgradeCategory.Collector, 120)
        AvailableUpgrades = AvailableUpgrades + array{collectionSpeedUpgrade}
        
        var autoCollectionUpgrade : Upgrade = Upgrade()
        autoCollectionUpgrade.Initialize("auto_collection", "Auto Collection", UpgradeType.AutoCollection, UpgradeCategory.Collector, 500)
        AvailableUpgrades = AvailableUpgrades + array{autoCollectionUpgrade}
        
        # Storage Upgrades
        var storageUpgrade : Upgrade = Upgrade()
        storageUpgrade.Initialize("storage", "Storage Capacity", UpgradeType.StorageCapacity, UpgradeCategory.Storage, 80)
        AvailableUpgrades = AvailableUpgrades + array{storageUpgrade}
        
        # Player Upgrades
        var playerMultiplierUpgrade : Upgrade = Upgrade()
        playerMultiplierUpgrade.Initialize("player_multiplier", "Player Multiplier", UpgradeType.Multiplier, UpgradeCategory.Player, 300)
        AvailableUpgrades = AvailableUpgrades + array{playerMultiplierUpgrade}
    
    # Get Upgrade by ID
    GetUpgradeByID(id : string) : ?Upgrade =
        for (upgrade : AvailableUpgrades) do
            if (upgrade.UpgradeID = id) then
                return ?upgrade
        
        for (upgrade : UnlockedUpgrades) do
            if (upgrade.UpgradeID = id) then
                return ?upgrade
        
        for (upgrade : MaxedUpgrades) do
            if (upgrade.UpgradeID = id) then
                return ?upgrade
        
        false
    
    # Unlock Upgrade
    UnlockUpgrade(upgradeID : string) : logic =
        var upgrade : ?Upgrade = GetUpgradeByID(upgradeID)
        
        if (upgrade) then
            upgrade.IsUnlocked = true
            UnlockedUpgrades = UnlockedUpgrades + array{upgrade}
            true
        else
            false
    
    # Perform Upgrade
    PerformUpgrade(upgradeID : string, playerResources : int) : logic =
        var upgrade : ?Upgrade = GetUpgradeByID(upgradeID)
        
        if (upgrade and upgrade.IsUnlocked and upgrade.CanAffordUpgrade(playerResources)) then
            if (upgrade.PerformUpgrade()) then
                if (upgrade.IsUpgradeMaxed()) then
                    MaxedUpgrades = MaxedUpgrades + array{upgrade}
                    UnlockedUpgrades = UnlockedUpgrades - array{upgrade}
                
                true
            else
                false
        else
            false
    
    # Get Available Upgrades
    GetAvailableUpgrades() : []Upgrade = AvailableUpgrades
    
    # Get Unlocked Upgrades
    GetUnlockedUpgrades() : []Upgrade = UnlockedUpgrades
    
    # Get Maxed Upgrades
    GetMaxedUpgrades() : []Upgrade = MaxedUpgrades
    
    # Get Total Upgrade Cost
    GetTotalUpgradeCost() : int =
        var totalCost : int = 0
        
        for (upgrade : UnlockedUpgrades) do
            if (not upgrade.IsUpgradeMaxed()) then
                totalCost += upgrade.GetUpgradeCost()
        
        totalCost
    
    # Check if Player Can Afford Any Upgrades
    CanAffordAnyUpgrades(playerResources : int) : logic =
        for (upgrade : UnlockedUpgrades) do
            if (not upgrade.IsUpgradeMaxed() and upgrade.CanAffordUpgrade(playerResources)) then
                true
        
        false
    
    # Get Upgrade Recommendations
    GetUpgradeRecommendations(playerResources : int) : []Upgrade =
        var recommendations : []Upgrade = array{}
        
        for (upgrade : UnlockedUpgrades) do
            if (not upgrade.IsUpgradeMaxed() and upgrade.CanAffordUpgrade(playerResources)) then
                recommendations = recommendations + array{upgrade}
        
        recommendations
    
    # Get Total Multipliers
    GetTotalMultipliers() : float =
        var totalMultiplier : float = 1.0
        
        for (upgrade : UnlockedUpgrades) do
            totalMultiplier *= upgrade.GenerationMultiplier
            totalMultiplier *= upgrade.CollectionSpeedMultiplier
            totalMultiplier *= upgrade.StorageMultiplier
            totalMultiplier *= upgrade.MultiplierBonus
        
        totalMultiplier

# Upgrade Interaction System
OnInteract<PropDevice>(device : PropDevice) : void =
    # This would be connected to specific upgrade stations in the world
    # For now, it's a placeholder for the upgrade interaction system
    
    # Check if it's an upgrade station and perform upgrade
    # The actual implementation would depend on the device tags or properties

# Upgrade UI Helper Functions
GetUpgradeDisplayText(upgrade : Upgrade) : string =
    var displayText : string = upgrade.UpgradeName + "\n"
    displayText += "Level: " + upgrade.CurrentLevel.ToString() + "/" + upgrade.MaxLevel.ToString() + "\n"
    
    if (upgrade.IsUpgradeMaxed()) then
        displayText += "MAXED OUT!"
    else
        displayText += "Cost: " + upgrade.GetUpgradeCost().ToString() + " Gold"
    
    displayText

GetUpgradeProgressBar(upgrade : Upgrade) : string =
    var progress : float = upgrade.GetUpgradeProgress()
    var barLength : int = 20
    var filledLength : int = (progress * barLength).Floor()
    
    var progressBar : string = "["
    for (i : int = 0..barLength) do
        if (i < filledLength) then
            progressBar += "█"
        else
            progressBar += "░"
    
    progressBar += "] " + (progress * 100).Floor().ToString() + "%"
    progressBar