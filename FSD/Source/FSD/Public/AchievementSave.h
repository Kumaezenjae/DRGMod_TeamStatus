#pragma once
#include "CoreMinimal.h"
#include "AchievementSaveEntry.h"
#include "AchievementSave.generated.h"

USTRUCT(BlueprintType)
struct FAchievementSave {
    GENERATED_BODY()
public:
protected:
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    TArray<FString> OfflineAchievedAchievements;
    
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    TArray<FAchievementSaveEntry> AchievementEntries;
    
public:
    FSD_API FAchievementSave();
};

