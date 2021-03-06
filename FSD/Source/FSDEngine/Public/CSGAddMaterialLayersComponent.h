#pragma once
#include "CoreMinimal.h"
#include "CSGBaseComponent.h"
#include "CSGAddMaterialLayersProperties.h"
#include "CSGAddMaterialLayersComponent.generated.h"

UCLASS(BlueprintType, meta=(BlueprintSpawnableComponent))
class UCSGAddMaterialLayersComponent : public UCSGBaseComponent {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    FCSGAddMaterialLayersProperties Properties;
    
    UCSGAddMaterialLayersComponent();
};

