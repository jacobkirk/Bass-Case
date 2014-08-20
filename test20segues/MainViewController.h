#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController <AVAudioPlayerDelegate>

{
    //Declaring individual audio pointers
    AVAudioPlayer* eStringPointer;
    AVAudioPlayer* aStringPointer;
    AVAudioPlayer* dStringPointer;
    AVAudioPlayer* gStringPointer;
    AVAudioPlayer* fretNoisePointer;
    AVAudioPlayer* eStringHarmonicPointer;
    AVAudioPlayer* aStringHarmonicPointer;
    AVAudioPlayer* dStringHarmonicPointer;
    AVAudioPlayer* gStringHarmonicPointer;
    AVAudioPlayer* returnPointer;
    AVAudioPlayer* helpPointer;
}

//Assigning segue integers
@property (nonatomic, assign) int distortion;
@property (nonatomic, assign) int eStringSegueTuning;
@property (nonatomic, assign) int aStringSegueTuning;
@property (nonatomic, assign) int dStringSegueTuning;
@property (nonatomic, assign) int gStringSegueTuning;

//E string variables
@property (nonatomic, assign) int eStringFirstFret;
@property (nonatomic, assign) int eStringSecondFret;
@property (nonatomic, assign) int eStringThirdFret;
@property (nonatomic, assign) int eStringFourthFret;
@property (nonatomic, assign) int eStringFifthFret;
@property (nonatomic, assign) int eStringOpen;
@property (nonatomic, assign) int eStringHarmonic;

//A string variables
@property (nonatomic, assign) int aStringFirstFret;
@property (nonatomic, assign) int aStringSecondFret;
@property (nonatomic, assign) int aStringThirdFret;
@property (nonatomic, assign) int aStringFourthFret;
@property (nonatomic, assign) int aStringFifthFret;
@property (nonatomic, assign) int aStringOpen;
@property (nonatomic, assign) int aStringHarmonic;

//D string variables
@property (nonatomic, assign) int dStringFirstFret;
@property (nonatomic, assign) int dStringSecondFret;
@property (nonatomic, assign) int dStringThirdFret;
@property (nonatomic, assign) int dStringFourthFret;
@property (nonatomic, assign) int dStringFifthFret;
@property (nonatomic, assign) int dStringOpen;
@property (nonatomic, assign) int dStringHarmonic;

//G string variables
@property (nonatomic, assign) int gStringFirstFret;
@property (nonatomic, assign) int gStringSecondFret;
@property (nonatomic, assign) int gStringThirdFret;
@property (nonatomic, assign) int gStringFourthFret;
@property (nonatomic, assign) int gStringFifthFret;
@property (nonatomic, assign) int gStringOpen;
@property (nonatomic, assign) int gStringHarmonic;

//Strum buttons
- (IBAction)eStringPress:(id)sender;
- (IBAction)aStringPress:(id)sender;
- (IBAction)dStringPress:(id)sender;
- (IBAction)gStringPress:(id)sender;

//Return button
- (IBAction)returnButton:(id)sender;

//Help button
- (IBAction)helpButton:(id)sender;


@end
