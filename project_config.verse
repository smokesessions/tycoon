# Project Configuration for Tycoon Game
# Contains all game settings, constants, and configuration options

# Game Configuration Constants
var GAME_CONFIG : GameConfiguration = GameConfiguration()
var UI_CONFIG : UIConfiguration = UIConfiguration()
var RESOURCE_CONFIG : ResourceConfiguration = ResourceConfiguration()
var UPGRADE_CONFIG : UpgradeConfiguration = UpgradeConfiguration()
var WORLD_CONFIG : WorldConfiguration = WorldConfiguration()

# Game Configuration Class
class GameConfiguration :
    # Game Settings
    var GameName : string = "Tycoon Empire"
    var GameVersion : string = "1.0.0"
    var GameDescription : string = "Build your fortune from scratch in this exciting tycoon game!"
    
    # Game Duration Settings
    var MinGameDuration : float = 900.0    # 15 minutes
    var DefaultGameDuration : float = 1800.0  # 30 minutes
    var MaxGameDuration : float = 7200.0   # 2 hours
    
    # Player Settings
    var MinPlayersToStart : int = 1
    var DefaultMaxPlayers : int = 16
    var MaxMaxPlayers : int = 32
    
    # Game Phase Settings
    var CountdownDuration : float = 10.0
    var GameEndDelay : float = 5.0
    var AutoSaveInterval : float = 60.0
    
    # Resource Generation Settings
    var DefaultResourceInterval : float = 2.0
    var MinResourceInterval : float = 0.5
    var MaxResourceInterval : float = 10.0
    
    # Experience Settings
    var BaseExperiencePerResource : int = 1
    var ExperienceMultiplier : float = 1.0
    var LevelUpBonus : int = 50

# UI Configuration Class
class UIConfiguration :
    # UI Update Intervals
    var ResourceUpdateInterval : float = 0.5
    var StatusUpdateInterval : float = 1.0
    var NotificationDuration : float = 3.0
    
    # UI Text Settings
    var MaxTextLength : int = 100
    var DefaultFontSize : float = 16.0
    var LargeFontSize : float = 24.0
    
    # UI Colors (as strings for display)
    var PrimaryColor : string = "#FFD700"      # Gold
    var SecondaryColor : string = "#4169E1"    # Blue
    var SuccessColor : string = "#32CD32"      # Green
    var WarningColor : string = "#FFA500"      # Orange
    var ErrorColor : string = "#FF0000"        # Red
    
    # UI Positioning
    var ResourcePanelX : float = 100.0
    var ResourcePanelY : float = 100.0
    var UpgradePanelX : float = 300.0
    var UpgradePanelY : float = 100.0
    var StatusPanelX : float = 500.0
    var StatusPanelY : float = 100.0

# Resource Configuration Class
class ResourceConfiguration :
    # Starting Resources
    var StartingGold : int = 100
    var StartingWood : int = 50
    var StartingMetal : int = 25
    var StartingGems : int = 5
    
    # Resource Generation Base Values
    var BaseGoldGeneration : int = 15
    var BaseWoodGeneration : int = 20
    var BaseMetalGeneration : int = 25
    var BaseGemGeneration : int = 5
    
    # Resource Generation Intervals
    var GoldGenerationInterval : float = 2.0
    var WoodGenerationInterval : float = 3.0
    var MetalGenerationInterval : float = 4.0
    var GemGenerationInterval : float = 5.0
    
    # Collection Cooldowns
    var GoldCollectionCooldown : float = 1.0
    var WoodCollectionCooldown : float = 1.5
    var MetalCollectionCooldown : float = 2.0
    var GemCollectionCooldown : float = 3.0
    
    # Resource Limits
    var MaxGoldStorage : int = 10000
    var MaxWoodStorage : int = 5000
    var MaxMetalStorage : int = 3000
    var MaxGemStorage : int = 1000

# Upgrade Configuration Class
class UpgradeConfiguration :
    # Upgrade Base Costs
    var BaseGeneratorUpgradeCost : int = 100
    var BaseCollectorUpgradeCost : int = 120
    var BaseStorageUpgradeCost : int = 80
    var BasePlayerUpgradeCost : int = 300
    
    # Upgrade Cost Multipliers
    var GeneratorCostMultiplier : float = 1.5
    var CollectorCostMultiplier : float = 1.4
    var StorageCostMultiplier : float = 1.3
    var PlayerCostMultiplier : float = 2.0
    
    # Upgrade Level Limits
    var MaxGeneratorLevel : int = 10
    var MaxCollectorLevel : int = 15
    var MaxStorageLevel : int = 20
    var MaxPlayerLevel : int = 25
    
    # Upgrade Effects
    var GeneratorEfficiencyIncrease : float = 0.2
    var CollectorSpeedIncrease : float = 0.15
    var StorageCapacityIncrease : float = 0.25
    var PlayerMultiplierIncrease : float = 0.1

# World Configuration Class
class WorldConfiguration :
    # World Size Settings
    var WorldSize : float = 2000.0
    var StartingAreaSize : float = 1000.0
    var ResourceAreaSize : float = 500.0
    var UpgradeAreaSize : float = 200.0
    
    # Spawn Point Settings
    var MainSpawnPointCount : int = 1
    var ResourceSpawnPointCount : int = 4
    var UpgradeSpawnPointCount : int = 4
    
    # Boundary Settings
    var GameBoundaryHeight : float = 1000.0
    var ResourceAreaHeight : float = 500.0
    var UpgradeAreaHeight : float = 300.0
    
    # Environmental Settings
    var WeatherChangeInterval : float = 300.0  # 5 minutes
    var DayNightCycleDuration : float = 1200.0  # 20 minutes
    var MaxWeatherIntensity : float = 1.0

# Achievement Configuration Class
class AchievementConfiguration :
    # Achievement Categories
    var BeginnerAchievementCount : int = 3
    var IntermediateAchievementCount : int = 3
    var AdvancedAchievementCount : int = 2
    var ExpertAchievementCount : int = 2
    var MasterAchievementCount : int = 2
    var LegendaryAchievementCount : int = 1
    
    # Achievement Rewards
    var BeginnerRewardMultiplier : float = 1.0
    var IntermediateRewardMultiplier : float = 1.5
    var AdvancedRewardMultiplier : float = 2.0
    var ExpertRewardMultiplier : float = 3.0
    var MasterRewardMultiplier : float = 5.0
    var LegendaryRewardMultiplier : float = 10.0
    
    # Achievement Progress Tracking
    var ProgressUpdateInterval : float = 5.0
    var AchievementCheckInterval : float = 10.0

# Performance Configuration Class
class PerformanceConfiguration :
    # Update Intervals
    var MainLoopInterval : float = 1.0
    var ResourceUpdateInterval : float = 2.0
    var UIUpdateInterval : float = 0.5
    var AchievementCheckInterval : float = 10.0
    
    # Device Limits
    var MaxActiveDevices : int = 100
    var MaxSimultaneousEffects : int = 20
    var MaxAudioSources : int = 10
    
    # Memory Management
    var MaxStoredData : int = 1000
    var CleanupInterval : float = 300.0  # 5 minutes

# Multiplayer Configuration Class
class MultiplayerConfiguration :
    # Player Settings
    var MaxPlayersPerGame : int = 16
    var MinPlayersToStart : int = 1
    var PlayerTimeoutDuration : float = 300.0  # 5 minutes
    
    # Synchronization Settings
    var StateSyncInterval : float = 0.1
    var PlayerUpdateInterval : float = 0.05
    var ResourceSyncInterval : float = 1.0
    
    # Competition Settings
    var EnablePlayerCompetition : logic = false
    var EnableResourceSharing : logic = false
    var EnableTeamPlay : logic = false

# Sound Configuration Class
class SoundConfiguration :
    # Audio Settings
    var MasterVolume : float = 1.0
    var MusicVolume : float = 0.7
    var SFXVolume : float = 0.8
    var VoiceVolume : float = 1.0
    
    # Sound Effects
    var ResourceCollectionSound : string = "collect_sound"
    var UpgradeSound : string = "upgrade_sound"
    var AchievementSound : string = "achievement_sound"
    var LevelUpSound : string = "levelup_sound"
    
    # Music Tracks
    var BackgroundMusic : string = "tycoon_theme"
    var VictoryMusic : string = "victory_theme"
    var GameOverMusic : string = "gameover_theme"

# Visual Configuration Class
class VisualConfiguration :
    # Effect Settings
    var EnableParticleEffects : logic = true
    var EnableLightingEffects : logic = true
    var EnableWeatherEffects : logic = true
    
    # Effect Intensities
    var ParticleEffectIntensity : float = 0.8
    var LightingEffectIntensity : float = 1.0
    var WeatherEffectIntensity : float = 0.6
    
    # Visual Quality
    var EnableHighQualityEffects : logic = true
    var EnableDynamicShadows : logic = true
    var EnablePostProcessing : logic = true

# Get Configuration Functions
GetGameConfig() : GameConfiguration = GAME_CONFIG
GetUIConfig() : UIConfiguration = UI_CONFIG
GetResourceConfig() : ResourceConfiguration = RESOURCE_CONFIG
GetUpgradeConfig() : UpgradeConfiguration = UPGRADE_CONFIG
GetWorldConfig() : WorldConfiguration = WORLD_CONFIG

# Configuration Validation Functions
ValidateGameConfiguration() : logic =
    # Validate game configuration settings
    if (GAME_CONFIG.MinGameDuration < 60.0) then
        false
    else if (GAME_CONFIG.MaxGameDuration > 14400.0) then
        false
    else if (GAME_CONFIG.MinPlayersToStart < 1) then
        false
    else if (GAME_CONFIG.DefaultMaxPlayers > 32) then
        false
    else
        true

ValidateResourceConfiguration() : logic =
    # Validate resource configuration settings
    if (RESOURCE_CONFIG.StartingGold < 0) then
        false
    else if (RESOURCE_CONFIG.BaseGoldGeneration < 1) then
        false
    else if (RESOURCE_CONFIG.GoldGenerationInterval < 0.1) then
        false
    else
        true

ValidateUpgradeConfiguration() : logic =
    # Validate upgrade configuration settings
    if (UPGRADE_CONFIG.BaseGeneratorUpgradeCost < 1) then
        false
    else if (UPGRADE_CONFIG.GeneratorCostMultiplier < 1.0) then
        false
    else if (UPGRADE_CONFIG.MaxGeneratorLevel < 1) then
        false
    else
        true

# Load Configuration from File
LoadConfigurationFromFile(filePath : string) : logic =
    # This would load configuration from a file
    # For now, it's a placeholder
    true

# Save Configuration to File
SaveConfigurationToFile(filePath : string) : logic =
    # This would save configuration to a file
    # For now, it's a placeholder
    true

# Reset Configuration to Defaults
ResetConfigurationToDefaults() : void =
    # Reset all configuration to default values
    GAME_CONFIG = GameConfiguration()
    UI_CONFIG = UIConfiguration()
    RESOURCE_CONFIG = ResourceConfiguration()
    UPGRADE_CONFIG = UpgradeConfiguration()
    WORLD_CONFIG = WorldConfiguration()

# Configuration Change Events
OnConfigurationChanged() : void =
    # Handle configuration changes
    # This would be called when configuration is modified
    
    # Validate new configuration
    if (not ValidateGameConfiguration()) then
        # Revert to previous valid configuration
        pass
    
    if (not ValidateResourceConfiguration()) then
        # Revert to previous valid configuration
        pass
    
    if (not ValidateUpgradeConfiguration()) then
        # Revert to previous valid configuration
        pass
    
    # Apply new configuration
    ApplyConfigurationChanges()

# Apply Configuration Changes
ApplyConfigurationChanges() : void =
    # Apply configuration changes to the game
    # This would update game systems with new settings
    
    # Update game settings
    # Update UI settings
    # Update resource settings
    # Update upgrade settings
    # Update world settings
    
    # Notify systems of configuration changes
    NotifyConfigurationChanged()

# Notify Configuration Changed
NotifyConfigurationChanged() : void =
    # Notify all game systems that configuration has changed
    # This would trigger updates in affected systems
    pass