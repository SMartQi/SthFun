//
//  NullValueInDictionary.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/22.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "NullValueInDictionary.h"

@implementation NullValueInDictionary

+ (void)crashedNullValue
{
    id nullValue = [NSNull null];
    NSDictionary *dict = @{@"key": nullValue};
    id value = [dict objectForKey:@"key"];
    if([NSNull null] == value) {
        NSLog(@"Look, there's a NSNull instance. It's about to crash.");
    }
    [value objectForKey:@"anyKey"];
    
    /*
     2018-11-22 19:10:47.387059+0800 SthFun[17430:6606465] Look, there's a NSNull instance. It's about to crash.
     2018-11-22 19:10:47.387392+0800 SthFun[17430:6606465] -[NSNull objectForKey:]: unrecognized selector sent to instance 0x107838f28
     2018-11-22 19:10:47.457031+0800 SthFun[17430:6606465] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[NSNull objectForKey:]: unrecognized selector sent to instance 0x107838f28'
     *** First throw call stack:
     (
     0   CoreFoundation                      0x00000001075c61bb __exceptionPreprocess + 331
     1   libobjc.A.dylib                     0x0000000106b64735 objc_exception_throw + 48
     2   CoreFoundation                      0x00000001075e4f44 -[NSObject(NSObject) doesNotRecognizeSelector:] + 132
     3   CoreFoundation                      0x00000001075caed6 ___forwarding___ + 1446
     4   CoreFoundation                      0x00000001075ccda8 _CF_forwarding_prep_0 + 120
     5   SthFun                              0x0000000106245198 +[NullValueInDictionary crashedNullValue] + 312
     6   SthFun                              0x000000010624393d -[ViewController viewDidLoad] + 77
     7   UIKitCore                           0x0000000109e0d4e1 -[UIViewController loadViewIfRequired] + 1186
     8   UIKitCore                           0x0000000109e0d940 -[UIViewController view] + 27
     9   UIKitCore                           0x000000010a464c53 -[UIWindow addRootViewControllerViewIfPossible] + 122
     10  UIKitCore                           0x000000010a46536e -[UIWindow _setHidden:forced:] + 294
     11  UIKitCore                           0x000000010a4785c0 -[UIWindow makeKeyAndVisible] + 42
     12  UIKitCore                           0x000000010a425833 -[UIApplication _callInitializationDelegatesForMainScene:transitionContext:] + 4595
     13  UIKitCore                           0x000000010a42ac2f -[UIApplication _runWithMainScene:transitionContext:completion:] + 1623
     14  UIKitCore                           0x0000000109c494e9 __111-[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:]_block_invoke + 866
     15  UIKitCore                           0x0000000109c5229c +[_UICanvas _enqueuePostSettingUpdateTransactionBlock:] + 153
     16  UIKitCore                           0x0000000109c49126 -[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:] + 233
     17  UIKitCore                           0x0000000109c49ae0 -[__UICanvasLifecycleMonitor_Compatability activateEventsOnly:withContext:completion:] + 1085
     18  UIKitCore                           0x0000000109c47cb5 __82-[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:]_block_invoke + 795
     19  UIKitCore                           0x0000000109c4795f -[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:] + 435
     20  UIKitCore                           0x0000000109c4ca90 __125-[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:]_block_invoke + 584
     21  UIKitCore                           0x0000000109c4d80e _performActionsWithDelayForTransitionContext + 100
     22  UIKitCore                           0x0000000109c4c7ef -[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:] + 221
     23  UIKitCore                           0x0000000109c5193a -[_UICanvas scene:didUpdateWithDiff:transitionContext:completion:] + 392
     24  UIKitCore                           0x000000010a42944e -[UIApplication workspace:didCreateScene:withTransitionContext:completion:] + 515
     25  UIKitCore                           0x0000000109fcdd09 -[UIApplicationSceneClientAgent scene:didInitializeWithEvent:completion:] + 357
     26  FrontBoardServices                  0x0000000112c602da -[FBSSceneImpl _didCreateWithTransitionContext:completion:] + 448
     27  FrontBoardServices                  0x0000000112c6b443 __56-[FBSWorkspace client:handleCreateScene:withCompletion:]_block_invoke_2 + 271
     28  FrontBoardServices                  0x0000000112c6ab3a __40-[FBSWorkspace _performDelegateCallOut:]_block_invoke + 53
     29  libdispatch.dylib                   0x0000000108ec4602 _dispatch_client_callout + 8
     30  libdispatch.dylib                   0x0000000108ec7b78 _dispatch_block_invoke_direct + 301
     31  FrontBoardServices                  0x0000000112c9fba8 __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__ + 30
     32  FrontBoardServices                  0x0000000112c9f860 -[FBSSerialQueue _performNext] + 457
     33  FrontBoardServices                  0x0000000112c9fe40 -[FBSSerialQueue _performNextFromRunLoopSource] + 45
     34  CoreFoundation                      0x000000010752b721 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
     35  CoreFoundation                      0x000000010752af93 __CFRunLoopDoSources0 + 243
     36  CoreFoundation                      0x000000010752563f __CFRunLoopRun + 1263
     37  CoreFoundation                      0x0000000107524e11 CFRunLoopRunSpecific + 625
     38  GraphicsServices                    0x000000010fca41dd GSEventRunModal + 62
     39  UIKitCore                           0x000000010a42c81d UIApplicationMain + 140
     40  SthFun                              0x0000000106244440 main + 112
     41  libdyld.dylib                       0x0000000108f3a575 start + 1
     )
     libc++abi.dylib: terminating with uncaught exception of type NSException
     */
}

@end
