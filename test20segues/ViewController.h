#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate>

{
    //Declaring individual audio pointers
    AVAudioPlayer* clickPointer;
    AVAudioPlayer* hissPointer;
    AVAudioPlayer* backingTrackPointer;
    AVAudioPlayer* slidePointer;
    AVAudioPlayer* helpPointer;
}

//Assigning integers that are to be sent to the next View Controller
@property (nonatomic, assign) int switcher;
@property (nonatomic, assign) int eStringTuning;
@property (nonatomic, assign) int aStringTuning;
@property (nonatomic, assign) int dStringTuning;
@property (nonatomic, assign) int gStringTuning;

//Assigning UIPickers controlling tunings
@property (strong, nonatomic) IBOutlet UIPickerView *eStringPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *aStringPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *dStringPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *gStringPicker;

//Button declaration
- (IBAction)buttonGo:(id)sender;
- (IBAction)buttonHelp:(id)sender;

//UIImage declaration
@property (strong, nonatomic) IBOutlet UIImageView *button;
@property (strong, nonatomic) IBOutlet UIImageView *buttonPressed;
@property (strong, nonatomic) IBOutlet UIImageView *lightOff;
@property (strong, nonatomic) IBOutlet UIImageView *lightOn;


@end
