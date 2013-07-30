//
//  NLAppDelegate.m
//  NibLoading
//
//  Created by snake on 13-7-10.
//  Copyright (c) 2013年 snake. All rights reserved.
//

#import "NLAppDelegate.h"

#import "NLViewController.h"

@implementation NLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[NLViewController alloc] init]; //WithNibName:@"NLViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#if 0
- (void)downloadBundle
{
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/~wsc/template.bundle.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"%d", [httpResponse statusCode]);
    
    if ([httpResponse statusCode] == 404) // bundle will be deleted and the default interface will be used ...
    {
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"template.bundle"];
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        return;
    }
    else if (error)
    {
        NSLog(@"%@", error);
    }
    
    BOOL didWriteData = [data writeToFile:zipFile atomically:YES];
    if (didWriteData)
    {
        BOOL success = [SSZipArchive unzipFileAtPath:zipFile toDestination:documentsDirectory];
        if (!success)
        {
            NSLog(@"failed to unzip file.");
        }
    }
}
#endif
@end
