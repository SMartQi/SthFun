//
//  CallStack.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/27.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "CallStack.h"

@implementation CallStack

+ (void)showCallStackSymbols
{
    NSArray *stack = [NSThread callStackSymbols];
    NSLog(@"%@", stack);
    
    NSString *sourceString = [stack objectAtIndex:0];
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
    [array removeObject:@""];
    
    NSLog(@"Stack = %@", [array objectAtIndex:0]);
    NSLog(@"Framework = %@", [array objectAtIndex:1]);
    NSLog(@"Memory address = %@", [array objectAtIndex:2]);
    NSLog(@"Class caller = %@", [array objectAtIndex:3]);
    NSLog(@"Function caller = %@", [array objectAtIndex:4]);
    
    /*
     2018-11-29 19:15:04.071672+0800 SthFun[44283:9631006] (
     0   SthFun                              0x000000010431aa42 +[CallStack showCallStackSymbols] + 50
     1   SthFun                              0x000000010431a9fd -[ViewController viewDidLoad] + 77
     2   UIKitCore                           0x000000010a7714e1 -[UIViewController loadViewIfRequired] + 1186
     3   UIKitCore                           0x000000010a771940 -[UIViewController view] + 27
     4   UIKitCore                           0x000000010adc8c53 -[UIWindow addRootViewControllerViewIfPossible] + 122
     5   UIKitCore                           0x000000010adc936e -[UIWindow _setHidden:forced:] + 294
     6   UIKitCore                           0x000000010addc5c0 -[UIWindow makeKeyAndVisible] + 42
     7   UIKitCore                           0x000000010ad89833 -[UIApplication _callInitializationDelegatesForMainScene:transitionContext:] + 4595
     8   UIKitCore                           0x000000010ad8ec2f -[UIApplication _runWithMainScene:transitionContext:completion:] + 1623
     9   UIKitCore                           0x000000010a5ad4e9 __111-[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:]_block_invoke + 866
     10  UIKitCore                           0x000000010a5b629c +[_UICanvas _enqueuePostSettingUpdateTransactionBlock:] + 153
     11  UIKitCore                           0x000000010a5ad126 -[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:] + 233
     12  UIKitCore                           0x000000010a5adae0 -[__UICanvasLifecycleMonitor_Compatability activateEventsOnly:withContext:completion:] + 1085
     13  UIKitCore                           0x000000010a5abcb5 __82-[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:]_block_invoke + 795
     14  UIKitCore                           0x000000010a5ab95f -[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:] + 435
     15  UIKitCore                           0x000000010a5b0a90 __125-[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:]_block_invoke + 584
     16  UIKitCore                           0x000000010a5b180e _performActionsWithDelayForTransitionContext + 100
     17  UIKitCore                           0x000000010a5b07ef -[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:] + 221
     18  UIKitCore                           0x000000010a5b593a -[_UICanvas scene:didUpdateWithDiff:transitionContext:completion:] + 392
     19  UIKitCore                           0x000000010ad8d44e -[UIApplication workspace:didCreateScene:withTransitionContext:completion:] + 515
     20  UIKitCore                           0x000000010a931d09 -[UIApplicationSceneClientAgent scene:didInitializeWithEvent:completion:] + 357
     21  FrontBoardServices                  0x00000001117072da -[FBSSceneImpl _didCreateWithTransitionContext:completion:] + 448
     22  FrontBoardServices                  0x0000000111712443 __56-[FBSWorkspace client:handleCreateScene:withCompletion:]_block_invoke_2 + 271
     23  FrontBoardServices                  0x0000000111711b3a __40-[FBSWorkspace _performDelegateCallOut:]_block_invoke + 53
     24  libdispatch.dylib                   0x0000000107968602 _dispatch_client_callout + 8
     25  libdispatch.dylib                   0x000000010796bb78 _dispatch_block_invoke_direct + 301
     26  FrontBoardServices                  0x0000000111746ba8 __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__ + 30
     27  FrontBoardServices                  0x0000000111746860 -[FBSSerialQueue _performNext] + 457
     28  FrontBoardServices                  0x0000000111746e40 -[FBSSerialQueue _performNextFromRunLoopSource] + 45
     29  CoreFoundation                      0x0000000105605721 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
     30  CoreFoundation                      0x0000000105604f93 __CFRunLoopDoSources0 + 243
     31  CoreFoundation                      0x00000001055ff63f __CFRunLoopRun + 1263
     32  CoreFoundation                      0x00000001055fee11 CFRunLoopRunSpecific + 625
     33  GraphicsServices                    0x000000010e7461dd GSEventRunModal + 62
     34  UIKitCore                           0x000000010ad9081d UIApplicationMain + 140
     35  SthFun                              0x000000010431b820 main + 112
     36  libdyld.dylib                       0x00000001079de575 start + 1
     )
     2018-11-29 19:15:04.073919+0800 SthFun[44283:9631006] Stack = 0
     2018-11-29 19:15:04.074029+0800 SthFun[44283:9631006] Framework = SthFun
     2018-11-29 19:15:04.074124+0800 SthFun[44283:9631006] Memory address = 0x000000010431aa42
     2018-11-29 19:15:04.074204+0800 SthFun[44283:9631006] Class caller = CallStack
     2018-11-29 19:15:04.074278+0800 SthFun[44283:9631006] Function caller = showCallStackSymbols
     */
}

@end
