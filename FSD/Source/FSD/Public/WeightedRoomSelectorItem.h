#pragma once
#include "CoreMinimal.h"
#include "WeightedRoomSelectorItem.generated.h"

class URoomGenerator;

USTRUCT(BlueprintType)
struct FWeightedRoomSelectorItem {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, Transient, meta=(AllowPrivateAccess=true))
    URoomGenerator* Room;
    
    UPROPERTY(BlueprintReadWrite, Transient, meta=(AllowPrivateAccess=true))
    float Weight;
    
    FSD_API FWeightedRoomSelectorItem();
};

