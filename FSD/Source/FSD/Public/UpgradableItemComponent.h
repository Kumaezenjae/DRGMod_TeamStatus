#pragma once
#include "CoreMinimal.h"
#include "UpgradableGearComponent.h"
#include "UpgradableItemComponent.generated.h"

UCLASS(meta=(BlueprintSpawnableComponent))
class UUpgradableItemComponent : public UUpgradableGearComponent {
    GENERATED_BODY()
public:
    UUpgradableItemComponent();
};

