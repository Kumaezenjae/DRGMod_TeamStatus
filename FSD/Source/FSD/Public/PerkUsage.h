#pragma once
#include "CoreMinimal.h"
#include "PerkUsage.generated.h"

class UPerkAsset;

USTRUCT(BlueprintType)
struct FPerkUsage {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    UPerkAsset* Perk;
    
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    int32 UsedCount;
    
    FSD_API FPerkUsage();
};

