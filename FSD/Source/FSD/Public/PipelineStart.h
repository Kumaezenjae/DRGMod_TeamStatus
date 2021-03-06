#pragma once
#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "EPipelineBuildState.h"
#include "PipelineStart.generated.h"

class APipelineStart;
class APipelineSegment;
class AFSDRefinery;
class UTrackBuilderUsable;
class APipelineFinish;
class ATrackBuilderSegment;

UCLASS(Abstract)
class FSD_API APipelineStart : public AActor {
    GENERATED_BODY()
public:
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_TwoParams(FPipelineStartStateDelegate, APipelineStart*, InPipelineStart, EPipelineBuildState, InPipelineState);
    
    UPROPERTY(BlueprintAssignable, BlueprintReadWrite, meta=(AllowPrivateAccess=true))
    FPipelineStartStateDelegate OnBuildStateChanged;
    
protected:
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    int32 PipelineID;
    
    UPROPERTY(BlueprintReadWrite, Export, VisibleAnywhere, meta=(AllowPrivateAccess=true))
    UTrackBuilderUsable* PipelineStartUsable;
    
    UPROPERTY(BlueprintReadWrite, Transient, ReplicatedUsing=OnRep_BuildState, meta=(AllowPrivateAccess=true))
    EPipelineBuildState BuildState;
    
    UPROPERTY(BlueprintReadWrite, Replicated, Transient, meta=(AllowPrivateAccess=true))
    APipelineFinish* PipelineFinish;
    
    UPROPERTY(BlueprintReadWrite, Transient, meta=(AllowPrivateAccess=true))
    AFSDRefinery* Refinery;
    
    UPROPERTY(Transient, meta=(AllowPrivateAccess=true))
    TArray<TWeakObjectPtr<APipelineSegment>> BrokenSegments;
    
public:
    APipelineStart();
    virtual void GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const override;
    
protected:
    UFUNCTION(BlueprintCallable, BlueprintImplementableEvent)
    void ReceiveBuildStateChanged(EPipelineBuildState InBuildState);
    
public:
    UFUNCTION(BlueprintAuthorityOnly, BlueprintCallable)
    void PipelineCompleted(APipelineFinish* InPipelineFinish);
    
protected:
    UFUNCTION(BlueprintCallable)
    void OnRep_BuildState();
    
    UFUNCTION(BlueprintCallable)
    void OnNextSegmentChanged(UTrackBuilderUsable* InUsable, ATrackBuilderSegment* InSegment);
    
public:
    UFUNCTION(BlueprintCallable, BlueprintPure)
    TArray<APipelineSegment*> GetAllPipelineSegments() const;
    
};

