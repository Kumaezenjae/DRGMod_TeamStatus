#pragma once
#include "CoreMinimal.h"
#include "WatchedTutorial.generated.h"

USTRUCT(BlueprintType)
struct FWatchedTutorial {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    FString TutorialName;
    
    UPROPERTY(BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    int32 count;
    
    FSD_API FWatchedTutorial();
};

