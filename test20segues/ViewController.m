#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

//Declaring tuning arrays containing available pitches (root, semitone down, tone down)
@property (strong, nonatomic) NSArray *eStringArray;
@property (strong, nonatomic) NSArray *aStringArray;
@property (strong, nonatomic) NSArray *dStringArray;
@property (strong, nonatomic) NSArray *gStringArray;
 
@end

@implementation ViewController

// Declaring random number for backing track selector
int randomNumberBackingTrack;

// Do any additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Assigning image visiblilty
    _button.hidden = NO;
    _buttonPressed.hidden = YES;
    _lightOff.hidden = NO;
    _lightOn.hidden = YES;
    
    // Randomly selecting backing track
    randomNumberBackingTrack = arc4random()%2;
    if (randomNumberBackingTrack == 0){
        
        // Play funk backing track
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"funk_backing"
                                             ofType:@"wav"]];
        
        backingTrackPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        backingTrackPointer.delegate = self;
        [backingTrackPointer setVolume:0.8];
        [backingTrackPointer play];
    }
    else if (randomNumberBackingTrack == 1){
        
        // Play rock backing track
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"rock_backing"
                                             ofType:@"wav"]];
        
        backingTrackPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        backingTrackPointer.delegate = self;
        [backingTrackPointer setVolume:0.8];
        [backingTrackPointer play];
        
    }
    
    // Creating the array for the selectable tunings of each string (root, semitone down, tone down)
    NSArray *eStringData = [[NSArray alloc] initWithObjects:@"E", @"Eb", @"D", nil];
    self.eStringArray = eStringData;
    
    NSArray *aStringData = [[NSArray alloc] initWithObjects:@"A", @"Ab", @"G", nil];
    self.aStringArray = aStringData;
    
    NSArray *dStringData = [[NSArray alloc] initWithObjects:@"D", @"Db", @"C", nil];
    self.dStringArray = dStringData;
    
    NSArray *gStringData = [[NSArray alloc] initWithObjects:@"G", @"Gb", @"F", nil];
    self.gStringArray = gStringData;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Setting up segue to move data from this View Controller to the fretboard View Controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
        MainViewController *body = [segue destinationViewController];
    
    // Distortion segue
    if (_switcher == YES){
        body.distortion = YES;
    }
    else if (_switcher == NO) {
        body.distortion = NO;
    }
    
    
    //T uning segues - E string
    if (_eStringTuning == 1){
        body.eStringSegueTuning = 1;
    }
    else if (_eStringTuning == 2){
        body.eStringSegueTuning = 2;
    }
    else if (_eStringTuning == 3){
        body.eStringSegueTuning = 3;
    }

    // Tuning segues - A string
    if (_aStringTuning == 1){
        body.aStringSegueTuning = 1;
    }
    else if (_aStringTuning == 2){
        body.aStringSegueTuning = 2;
    }
    else if (_aStringTuning == 3){
        body.aStringSegueTuning = 3;
    }
    
    // Tuning segues - D string
    if (_dStringTuning == 1){
        body.dStringSegueTuning = 1;
    }
    else if (_dStringTuning == 2){
        body.dStringSegueTuning = 2;
    }
    else if (_dStringTuning == 3){
        body.dStringSegueTuning = 3;
    }
    
    // Tuning segues - G string
    if (_gStringTuning == 1){
        body.gStringSegueTuning = 1;
    }
    else if (_gStringTuning == 2){
        body.gStringSegueTuning = 2;
    }
    else if (_gStringTuning == 3){
        body.gStringSegueTuning = 3;
    }
}

// Time delayed button pressing
-(void)buttonPressing{
    
    // The button images change for 0.1s, giving the appearence of the button being pressed down
    _buttonPressed.hidden = YES;
    _button.hidden = NO;
}

// Distortion switch controls
- (IBAction)switch:(id)sender {
    
    // Play click sound
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"click"
                                         ofType:@"wav"]];
    
    clickPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    clickPointer.delegate = self;
    [clickPointer setVolume:0.5];
    [clickPointer play];
    
    // Button being pressed down
    _button.hidden = YES;
    _buttonPressed.hidden = NO;
    
    // 0.1s delay to show the button pressed down before showing the button not pressed again
    [self performSelector:@selector(buttonPressing) withObject:nil afterDelay:0.1];
    
    // Status of switch
    UISwitch *onoff = (UISwitch *) sender;
    if(onoff.on)
    {
        // Distortion pedal is off
        
        
        _switcher = NO;
        
        // Turn off hiss
        [hissPointer stop];
        
        // Turning off light
        _lightOff.hidden = NO;
        _lightOn.hidden = YES;
    }
    else
    {
        // Distortion pedal is on
        
        
        _switcher = YES;
        
        // Play hiss sound
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"hiss"
                                             ofType:@"wav"]];
        
        hissPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        hissPointer.delegate = self;
        [hissPointer setVolume:0.1];
        [hissPointer play];
        
        // Turning light on
        _lightOff.hidden = YES;
        _lightOn.hidden = NO;
    }
}

// Entering the new View Controller and assigning integer values from the arrays for the segue when the GO! button is pressed
- (IBAction)buttonGo:(id)sender {
    
    if (_switcher == NO){
    
        // Play clean slide sound if distortion is off
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"slide"
                                             ofType:@"wav"]];
    
        slidePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        slidePointer.delegate = self;
        [slidePointer setVolume:0.7];
        [slidePointer play];
        
    }
    else if (_switcher == YES){
        
        // Play distorted slide sound if distortion is on
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"slide_Dist"
                                             ofType:@"wav"]];
        
        slidePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        slidePointer.delegate = self;
        [slidePointer setVolume:0.7];
        [slidePointer play];
    }
    
    // Turning off audio pointers
    [hissPointer stop];
    [backingTrackPointer stop];
    [helpPointer stop];
    [clickPointer stop];
    
    // Setting E string array selection results
    NSString *eStringSelect = [_eStringArray objectAtIndex:[_eStringPicker selectedRowInComponent:0]];
    if([eStringSelect  isEqual: @"E"]){
        _eStringTuning = 1;
    }
    else if ([eStringSelect isEqual: @"Eb"]){
        _eStringTuning = 2;
    }
    else if ([eStringSelect isEqual: @"D"]){
        _eStringTuning = 3;
    }
    
    // Setting A string array selection results
    NSString *aStringSelect = [_aStringArray objectAtIndex:[_aStringPicker selectedRowInComponent:0]];
    if([aStringSelect  isEqual: @"A"]){
        _aStringTuning = 1;
    }
    else if ([aStringSelect isEqual: @"Ab"]){
        _aStringTuning = 2;
    }
    else if ([aStringSelect isEqual: @"G"]){
        _aStringTuning = 3;
    }
    
    // Setting D string array selection results
    NSString *dStringSelect = [_dStringArray objectAtIndex:[_dStringPicker selectedRowInComponent:0]];
    if([dStringSelect  isEqual: @"D"]){
        _dStringTuning = 1;
    }
    else if ([dStringSelect isEqual: @"Db"]){
        _dStringTuning = 2;
    }
    else if ([dStringSelect isEqual: @"C"]){
        _dStringTuning = 3;
    }
    
    //Setting G string array selection results
    NSString *gStringSelect = [_gStringArray objectAtIndex:[_gStringPicker selectedRowInComponent:0]];
    if([gStringSelect  isEqual: @"G"]){
        _gStringTuning = 1;
    }
    else if ([gStringSelect isEqual: @"Gb"]){
        _gStringTuning = 2;
    }
    else if ([gStringSelect isEqual: @"F"]){
        _gStringTuning = 3;
    }
}

// Shows a pop up window with helpful information
- (IBAction)buttonHelp:(id)sender {
    
    if (_switcher == NO){
        
        // Play clean harmonic if distortion is off
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"gHarm"
                                             ofType:@"wav"]];
        
        helpPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        helpPointer.delegate = self;
        [helpPointer setVolume:0.5];
        [helpPointer play];
        
    }
    else if (_switcher == YES){
        
        // Play distorted harmonic if distortion is on
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"gHarm_Dist"
                                             ofType:@"wav"]];
        
        helpPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        helpPointer.delegate = self;
        [helpPointer setVolume:0.5];
        [helpPointer play];
    }

    // Pop up window contents
    UIAlertView *help = [[UIAlertView alloc] initWithTitle:@"Help" message:@"Press the pedal for distortion.\n\n Change the tuning with the pegs above.\n\n Press GO! to use the fretboard.\n\n Use the fretboard by holding down a fret and then playing the string!\n\nUse headphones for best results." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Show the windown
    [help show];
    
}

//UIPicker methods
#pragma mark Picker Data Source Methods

//Stating number of components per UIPicker
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //Each UIPicker contains 1 component
    
    return 1;
}

//Stating number of options per UIPicker
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //Each UIPicker contains 3 options
    
    return 3;
}

//UIPicker delegates
#pragma mark Picker Delegate

//Assigning each UIPicker its own array
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //Assigning E string array to 1st UIPicker
    if([pickerView isEqual: _eStringPicker]){
        return [_eStringArray objectAtIndex:row];
    }
    
    //Assigning A string array to 2nd UIPicker
    if([pickerView isEqual: _aStringPicker]){
        return [_aStringArray objectAtIndex:row];
    }
    
    //Assigning D sting array to 3rd UIPicker
    if([pickerView isEqual: _dStringPicker]){
        return [_dStringArray objectAtIndex:row];
    }
    
    //Assigning G string array to 4th UIPicker
    if([pickerView isEqual: _gStringPicker]){
        return [_gStringArray objectAtIndex:row];
    }

    return 0;
}

@end
