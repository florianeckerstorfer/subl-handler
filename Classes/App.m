#import "App.h"

#import "NSURL+L0URLParsing.h"

#define kDefaultsPathKey @"path"
#define kDefaultPath @"/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"

@implementation App

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
  [NSUserDefaults.standardUserDefaults registerDefaults:@{kDefaultsPathKey:kDefaultPath}];
  NSAppleEventManager *appleEventManager = [NSAppleEventManager sharedAppleEventManager];
  [appleEventManager setEventHandler:self andSelector:@selector(handleGetURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
  // TODO Show preferences when not opened from protocol
}

-(void)awakeFromNib
{
  [super awakeFromNib];
}

/**
 * Handles URLs with format subl://open/?file=/path/to/file&line=11&col=2
 * Both line and col are optional.
 */
-(void)handleGetURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{  
    NSURL *url = [NSURL URLWithString:[[event paramDescriptorForKeyword:keyDirectObject] stringValue]];

    if ([url.host isEqualToString:@"open"]) {
        NSDictionary *params = [url dictionaryByDecodingQueryString];
        NSString* file = [params objectForKey:@"file"];

        if (file) {
            NSString *line = [params objectForKey:@"line"];
            NSString *column = [params objectForKey:@"col"];

            if (file) {
                NSTask *task = [[NSTask alloc] init];
                [task setLaunchPath:self.sublimePath];
                NSString* filePath = [NSString stringWithFormat:@"%@:%ld:%ld", file, line ? [line integerValue] : 1, [column integerValue]];
                task.arguments = @[filePath];
                [task launch];
                [task release];
                NSWorkspace *sharedWorkspace = [NSWorkspace sharedWorkspace];
                NSString *appPath = [sharedWorkspace fullPathForApplication:@"Sublime Text 2"];
                NSString *identifier = [[NSBundle bundleWithPath:appPath] bundleIdentifier];
                NSArray *selectedApps = [NSRunningApplication runningApplicationsWithBundleIdentifier:identifier];
                NSRunningApplication *runningApplcation = (NSRunningApplication*)[selectedApps objectAtIndex:0];
                [runningApplcation activateWithOptions:NSApplicationActivateAllWindows];
                //[runningApplcation setCollectionBehavior:NSWindowCollectionBehaviorMoveToActiveSpace];
            }
        }
    }
}

-(IBAction)showPrefPanel:(id)sender
{
  [textField setStringValue:self.sublimePath];
  [prefPanel makeKeyAndOrderFront:nil];
}

-(IBAction)applyChange:(id)sender
{
  NSString *path = [textField stringValue];
  if (path) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:path forKey:kDefaultsPathKey];
  }

  [prefPanel orderOut:nil];
}

- (IBAction)restoreDefaultPath:(id)sender
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:kDefaultPath forKey:kDefaultsPathKey];
  textField.stringValue = kDefaultPath;
}

- (NSString *)sublimePath
{
  return [NSUserDefaults.standardUserDefaults stringForKey:kDefaultsPathKey];
}

@end
