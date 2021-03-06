#pragma once
#include "CoreMinimal.h"
#include "WeeklyCampaignItem.generated.h"

USTRUCT(BlueprintType)
struct FWeeklyCampaignItem {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    int32 LastCompletedWeek;
    
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    int32 LastStartedWeek;
    
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    int32 RewardedProgress;
    
    FSD_API FWeeklyCampaignItem();
};

