#import <Cocoa/Cocoa.h>

@interface App : NSObject <NSApplicationDelegate>
{
  IBOutlet NSWindow *prefPanel;
  IBOutlet NSTextField *textField;
}

- (IBAction)showPrefPanel:(id)sender;
- (IBAction)applyChange:(id)sender;
- (IBAction)restoreDefaultPath:(id)sender;

@end
