using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/World }
using { /Fortnite.com/Items }

# Resource System for Tycoon Game
# Handles resource generation, collection, and management

# Resource Generator Types
enum ResourceType :
    Gold
    Wood
    Metal
    Gems
    Experience

# Resource Generator Class
class ResourceGenerator :
    var GeneratorType : ResourceType = ResourceType.Gold
    var GenerationRate : float = 1.0
    var GenerationAmount : int = 10
    var CurrentLevel : int = 1
    var MaxLevel : int = 10
    var UpgradeCost : int = 100
    var IsActive : logic = true
    
    # Device References
    var GeneratorDevice : PropDevice = PropDevice{}
    var EffectDevice : EffectDevice = EffectDevice{}
    var AudioDevice : AudioDevice = AudioDevice{}
    
    Initialize(type : ResourceType, rate : float, amount : int) : void =
        GeneratorType = type
        GenerationRate = rate
        GenerationAmount = amount
        CurrentLevel = 1
        UpgradeCost = 100
        IsActive = true
    
    # Generate Resources
    GenerateResources() : int =
        if (IsActive) then
            var amount : int = GenerationAmount * CurrentLevel
            PlayGenerationEffect()
            amount
        else
            0
    
    # Play Generation Effect
    PlayGenerationEffect() : void =
        EffectDevice.PlayEffect()
        AudioDevice.Play()
    
    # Upgrade Generator
    Upgrade() : logic =
        if (CurrentLevel < MaxLevel) then
            CurrentLevel += 1
            GenerationAmount += 5
            GenerationRate *= 0.9  # Faster generation
            UpgradeCost = UpgradeCost * 2  # More expensive next upgrade
            true
        else
            false
    
    # Get Current Upgrade Cost
    GetUpgradeCost() : int = UpgradeCost
    
    # Get Current Level
    GetCurrentLevel() : int = CurrentLevel
    
    # Get Generation Rate
    GetGenerationRate() : float = GenerationRate

# Resource Collector Class
class ResourceCollector :
    var CollectorType : ResourceType = ResourceType.Gold
    var CollectionAmount : int = 10
    var CollectionCooldown : float = 1.0
    var LastCollectionTime : float = 0.0
    var IsCollectable : logic = true
    
    # Device References
    var CollectorDevice : PropDevice = PropDevice{}
    var CollectionEffect : EffectDevice = EffectDevice{}
    var CollectionSound : AudioDevice = AudioDevice{}
    
    Initialize(type : ResourceType, amount : int, cooldown : float) : void =
        CollectorType = type
        CollectionAmount = amount
        CollectionCooldown = cooldown
        LastCollectionTime = 0.0
        IsCollectable = true
    
    # Collect Resources
    CollectResources() : int =
        var currentTime : float = GetGameTime()
        
        if (IsCollectable and (currentTime - LastCollectionTime) >= CollectionCooldown) then
            LastCollectionTime = currentTime
            PlayCollectionEffect()
            CollectionAmount
        else
            0
    
    # Play Collection Effect
    PlayCollectionEffect() : void =
        CollectionEffect.PlayEffect()
        CollectionSound.Play()
    
    # Check if Collectable
    CanCollect() : logic =
        var currentTime : float = GetGameTime()
        (currentTime - LastCollectionTime) >= CollectionCooldown
    
    # Get Collection Amount
    GetCollectionAmount() : int = CollectionAmount
    
    # Get Remaining Cooldown
    GetRemainingCooldown() : float =
        var currentTime : float = GetGameTime()
        var timeSinceLastCollection : float = currentTime - LastCollectionTime
        if (timeSinceLastCollection >= CollectionCooldown) then
            0.0
        else
            CollectionCooldown - timeSinceLastCollection

# Resource Manager System
class ResourceManagerSystem :
    var GoldGenerators : []ResourceGenerator = array{}
    var WoodGenerators : []ResourceGenerator = array{}
    var MetalGenerators : []ResourceGenerator = array{}
    var GemGenerators : []ResourceGenerator = array{}
    
    var GoldCollectors : []ResourceCollector = array{}
    var WoodCollectors : []ResourceCollector = array{}
    var MetalCollectors : []ResourceCollector = array{}
    var GemCollectors : []ResourceCollector = array{}
    
    # Initialize Resource Manager
    Initialize() : void =
        # Create default generators
        CreateDefaultGenerators()
        CreateDefaultCollectors()
    
    # Create Default Generators
    CreateDefaultGenerators() : void =
        # Gold Generator
        var goldGen : ResourceGenerator = ResourceGenerator()
        goldGen.Initialize(ResourceType.Gold, 2.0, 15)
        GoldGenerators = GoldGenerators + array{goldGen}
        
        # Wood Generator
        var woodGen : ResourceGenerator = ResourceGenerator()
        woodGen.Initialize(ResourceType.Wood, 3.0, 20)
        WoodGenerators = WoodGenerators + array{woodGen}
        
        # Metal Generator
        var metalGen : ResourceGenerator = ResourceGenerator()
        metalGen.Initialize(ResourceType.Metal, 4.0, 25)
        MetalGenerators = MetalGenerators + array{metalGen}
        
        # Gem Generator
        var gemGen : ResourceGenerator = ResourceGenerator()
        gemGen.Initialize(ResourceType.Gems, 5.0, 5)
        GemGenerators = GemGenerators + array{gemGen}
    
    # Create Default Collectors
    CreateDefaultCollectors() : void =
        # Gold Collector
        var goldCol : ResourceCollector = ResourceCollector()
        goldCol.Initialize(ResourceType.Gold, 15, 1.0)
        GoldCollectors = GoldCollectors + array{goldCol}
        
        # Wood Collector
        var woodCol : ResourceCollector = ResourceCollector()
        woodCol.Initialize(ResourceType.Wood, 20, 1.5)
        WoodCollectors = WoodCollectors + array{woodCol}
        
        # Metal Collector
        var metalCol : ResourceCollector = ResourceCollector()
        metalCol.Initialize(ResourceType.Metal, 25, 2.0)
        MetalCollectors = MetalCollectors + array{metalCol}
        
        # Gem Collector
        var gemCol : ResourceCollector = ResourceCollector()
        gemCol.Initialize(ResourceType.Gems, 5, 3.0)
        GemCollectors = GemCollectors + array{gemCol}
    
    # Generate All Resources
    GenerateAllResources() : void =
        GenerateResourcesByType(GoldGenerators)
        GenerateResourcesByType(WoodGenerators)
        GenerateResourcesByType(MetalGenerators)
        GenerateResourcesByType(GemGenerators)
    
    # Generate Resources by Type
    GenerateResourcesByType(generators : []ResourceGenerator) : void =
        for (generator : generators) do
            generator.GenerateResources()
    
    # Collect Resources by Type
    CollectResourcesByType(collectors : []ResourceCollector) : int =
        var totalCollected : int = 0
        
        for (collector : collectors) do
            totalCollected += collector.CollectResources()
        
        totalCollected
    
    # Get Total Gold Generated
    GetTotalGoldGenerated() : int =
        var total : int = 0
        for (generator : GoldGenerators) do
            total += generator.GenerateResources()
        total
    
    # Get Total Wood Generated
    GetTotalWoodGenerated() : int =
        var total : int = 0
        for (generator : WoodGenerators) do
            total += generator.GenerateResources()
        total
    
    # Get Total Metal Generated
    GetTotalMetalGenerated() : int =
        var total : int = 0
        for (generator : MetalGenerators) do
            total += generator.GenerateResources()
        total
    
    # Get Total Gems Generated
    GetTotalGemsGenerated() : int =
        var total : int = 0
        for (generator : GemGenerators) do
            total += generator.GenerateResources()
        total
    
    # Add New Generator
    AddGenerator(type : ResourceType, rate : float, amount : int) : void =
        var newGenerator : ResourceGenerator = ResourceGenerator()
        newGenerator.Initialize(type, rate, amount)
        
        if (type = ResourceType.Gold) then
            GoldGenerators = GoldGenerators + array{newGenerator}
        else if (type = ResourceType.Wood) then
            WoodGenerators = WoodGenerators + array{newGenerator}
        else if (type = ResourceType.Metal) then
            MetalGenerators = MetalGenerators + array{newGenerator}
        else if (type = ResourceType.Gems) then
            GemGenerators = GemGenerators + array{newGenerator}
    
    # Add New Collector
    AddCollector(type : ResourceType, amount : int, cooldown : float) : void =
        var newCollector : ResourceCollector = ResourceCollector()
        newCollector.Initialize(type, amount, cooldown)
        
        if (type = ResourceType.Gold) then
            GoldCollectors = GoldCollectors + array{newCollector}
        else if (type = ResourceType.Wood) then
            WoodCollectors = WoodCollectors + array{newCollector}
        else if (type = ResourceType.Metal) then
            MetalCollectors = MetalCollectors + array{newCollector}
        else if (type = ResourceType.Gems) then
            GemCollectors = GemCollectors + array{newCollector}

# Resource Collection Events
OnInteract<PropDevice>(device : PropDevice) : void =
    # This would be connected to specific resource collectors in the world
    # For now, it's a placeholder for the interaction system
    
    # Check if it's a resource collector and collect resources
    # The actual implementation would depend on the device tags or properties