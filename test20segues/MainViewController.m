#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

// Declaring random number for fret noise
int randomNumberFretNoise;

// Declaring UITouch
UITouch *screenTouched;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Do any additional setup after loading the view.
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // All strings set to open
    _eStringOpen = YES;
    _eStringFirstFret = NO;
    _eStringSecondFret = NO;
    _eStringThirdFret = NO;
    _eStringFourthFret = NO;
    _eStringFifthFret = NO;
    _eStringHarmonic = NO;
    
    _aStringOpen = YES;
    _aStringFirstFret = NO;
    _aStringSecondFret = NO;
    _aStringThirdFret = NO;
    _aStringFourthFret = NO;
    _aStringFifthFret = NO;
    _aStringHarmonic = NO;
    
    _dStringOpen = YES;
    _dStringFirstFret = NO;
    _dStringSecondFret = NO;
    _dStringThirdFret = NO;
    _dStringFourthFret = NO;
    _dStringFifthFret = NO;
    _dStringHarmonic = NO;
    
    _gStringOpen = YES;
    _gStringFirstFret = NO;
    _gStringSecondFret = NO;
    _gStringThirdFret = NO;
    _gStringFourthFret = NO;
    _gStringFifthFret = NO;
    _gStringHarmonic = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Detecting inital touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Detecting the screen's initial touch, and deciding what frets have been pressed or not pressed
    // Also, when a string is touched, any harmonic on playing on that string is stopped
    
    {
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    NSLog(@"%f - %f", touchLocation.x, touchLocation.y);
    
        // If E string, 1st fret is pressed
        if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 211) && (touchLocation.y < 285)){
            _eStringFirstFret = YES;
            _eStringSecondFret = NO;
            _eStringThirdFret = NO;
            _eStringFourthFret = NO;
            _eStringFifthFret = NO;
            _eStringOpen = NO;
            _eStringHarmonic = NO;
            [eStringHarmonicPointer stop];
        }
        // If E string, 2nd fret is pressed
        if ((touchLocation.x > 73) && (touchLocation.x < 142) && (touchLocation.y > 211) && (touchLocation.y < 285)){
            _eStringFirstFret = NO;
            _eStringSecondFret = YES;
            _eStringThirdFret = NO;
            _eStringFourthFret = NO;
            _eStringFifthFret = NO;
            _eStringOpen = NO;
            _eStringHarmonic = NO;
            [eStringHarmonicPointer stop];
        }
        // If E string, 3rd fret is pressed
        if ((touchLocation.x > 143) && (touchLocation.x < 210) && (touchLocation.y > 211) && (touchLocation.y < 285)){
            _eStringFirstFret = NO;
            _eStringSecondFret = NO;
            _eStringThirdFret = YES;
            _eStringFourthFret = NO;
            _eStringFifthFret = NO;
            _eStringOpen = NO;
            _eStringHarmonic = NO;
            [eStringHarmonicPointer stop];
        }
        // If E string, 4th fret is pressed
        if ((touchLocation.x > 211) && (touchLocation.x < 275) && (touchLocation.y > 211) && (touchLocation.y < 285)){
            _eStringFirstFret = NO;
            _eStringSecondFret = NO;
            _eStringThirdFret = NO;
            _eStringFourthFret = YES;
            _eStringFifthFret = NO;
            _eStringOpen = NO;
            _eStringHarmonic = NO;
            [eStringHarmonicPointer stop];
        }
        // If E string, 5th fret is pressed
        if ((touchLocation.x > 276) && (touchLocation.x < 330) && (touchLocation.y > 211) && (touchLocation.y < 285)){
            _eStringFirstFret = NO;
            _eStringSecondFret = NO;
            _eStringThirdFret = NO;
            _eStringFourthFret = NO;
            _eStringFifthFret = YES;
            _eStringOpen = NO;
            _eStringHarmonic = NO;
            [eStringHarmonicPointer stop];
        }
        // If E string, harmonic is pressed
        if ((touchLocation.x > 331) && (touchLocation.x < 350) && (touchLocation.y > 211) && (touchLocation.y < 285)){
            _eStringFirstFret = NO;
            _eStringSecondFret = NO;
            _eStringThirdFret = NO;
            _eStringFourthFret = NO;
            _eStringFifthFret = NO;
            _eStringOpen = NO;
            _eStringHarmonic = YES;
        }
        // If no frets are pressed
        if (touchLocation.y < 210) {
            _eStringFirstFret = NO;
            _eStringSecondFret = NO;
            _eStringThirdFret = NO;
            _eStringFourthFret = NO;
            _eStringFifthFret = NO;
            _eStringOpen = YES;
            _eStringHarmonic = NO;
        }
        
        // If A string, 1st fret is pressed
        if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 151) && (touchLocation.y < 210)){
            _aStringFirstFret = YES;
            _aStringSecondFret = NO;
            _aStringThirdFret = NO;
            _aStringFourthFret = NO;
            _aStringFifthFret = NO;
            _aStringOpen = NO;
            _aStringHarmonic = NO;
            [aStringHarmonicPointer stop];
        }
        // If A string, 2nd fret is pressed
        if ((touchLocation.x > 73) && (touchLocation.x < 142) && (touchLocation.y > 151) && (touchLocation.y < 210)){
            _aStringFirstFret = NO;
            _aStringSecondFret = YES;
            _aStringThirdFret = NO;
            _aStringFourthFret = NO;
            _aStringFifthFret = NO;
            _aStringOpen = NO;
            _aStringHarmonic = NO;
            [aStringHarmonicPointer stop];
        }
        // If A string, 3rd fret is pressed
        if ((touchLocation.x > 143) && (touchLocation.x < 210) && (touchLocation.y > 151) && (touchLocation.y < 210)){
            _aStringFirstFret = NO;
            _aStringSecondFret = NO;
            _aStringThirdFret = YES;
            _aStringFourthFret = NO;
            _aStringFifthFret = NO;
            _aStringOpen = NO;
            _aStringHarmonic = NO;
            [aStringHarmonicPointer stop];
        }
        // If A string, 4th fret is pressed
        if ((touchLocation.x > 211) && (touchLocation.x < 275) && (touchLocation.y > 151) && (touchLocation.y < 210)){
            _aStringFirstFret = NO;
            _aStringSecondFret = NO;
            _aStringThirdFret = NO;
            _aStringFourthFret = YES;
            _aStringFifthFret = NO;
            _aStringOpen = NO;
            _aStringHarmonic = NO;
            [aStringHarmonicPointer stop];
        }
        // If A string, 5th fret is pressed
        if ((touchLocation.x > 276) && (touchLocation.x < 330) && (touchLocation.y > 151) && (touchLocation.y < 210)){
            _aStringFirstFret = NO;
            _aStringSecondFret = NO;
            _aStringThirdFret = NO;
            _aStringFourthFret = NO;
            _aStringFifthFret = YES;
            _aStringOpen = NO;
            _aStringHarmonic = NO;
            [aStringHarmonicPointer stop];
        }
        // If A string, harmonic is pressed
        if ((touchLocation.x > 331) && (touchLocation.x < 350) && (touchLocation.y > 151) && (touchLocation.y < 210)){
            _aStringFirstFret = NO;
            _aStringSecondFret = NO;
            _aStringThirdFret = NO;
            _aStringFourthFret = NO;
            _aStringFifthFret = NO;
            _aStringOpen = NO;
            _aStringHarmonic = YES;
        }
        // If no frets are pressed
        if ((touchLocation.y > 211) && (touchLocation.y < 150)){
            _aStringFirstFret = NO;
            _aStringSecondFret = NO;
            _aStringThirdFret = NO;
            _aStringFourthFret = NO;
            _aStringFifthFret = NO;
            _aStringOpen = YES;
            _aStringHarmonic = NO;
        }
        
        // If D string, 1st fret is pressed
        if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 81) && (touchLocation.y < 150)){
            _dStringFirstFret = YES;
            _dStringSecondFret = NO;
            _dStringThirdFret = NO;
            _dStringFourthFret = NO;
            _dStringFifthFret = NO;
            _dStringOpen = NO;
            _dStringHarmonic = NO;
            [dStringHarmonicPointer stop];
        }
        // If D string, 2nd fret is pressed
        if ((touchLocation.x > 73) && (touchLocation.x < 142) && (touchLocation.y > 81) && (touchLocation.y < 150)){
            _dStringFirstFret = NO;
            _dStringSecondFret = YES;
            _dStringThirdFret = NO;
            _dStringFourthFret = NO;
            _dStringFifthFret = NO;
            _dStringOpen = NO;
            _dStringHarmonic = NO;
            [dStringHarmonicPointer stop];
        }
        // If D string, 3rd fret is pressed
        if ((touchLocation.x > 143) && (touchLocation.x < 210) && (touchLocation.y > 81) && (touchLocation.y < 150)){
            _dStringFirstFret = NO;
            _dStringSecondFret = NO;
            _dStringThirdFret = YES;
            _dStringFourthFret = NO;
            _dStringFifthFret = NO;
            _dStringOpen = NO;
            _dStringHarmonic = NO;
            [dStringHarmonicPointer stop];
        }
        // If D string, 4th fret is pressed
        if ((touchLocation.x > 211) && (touchLocation.x < 275) && (touchLocation.y > 81) && (touchLocation.y < 150)){
            _dStringFirstFret = NO;
            _dStringSecondFret = NO;
            _dStringThirdFret = NO;
            _dStringFourthFret = YES;
            _dStringFifthFret = NO;
            _dStringOpen = NO;
            _dStringHarmonic = NO;
            [dStringHarmonicPointer stop];
        }
        // If D string, 5th fret is pressed
        if ((touchLocation.x > 276) && (touchLocation.x < 330) && (touchLocation.y > 81) && (touchLocation.y < 150)){
            _dStringFirstFret = NO;
            _dStringSecondFret = NO;
            _dStringThirdFret = NO;
            _dStringFourthFret = NO;
            _dStringFifthFret = YES;
            _dStringOpen = NO;
            _dStringHarmonic = NO;
            [dStringHarmonicPointer stop];
        }
        // If D string, harmonic is pressed
        if ((touchLocation.x > 331) && (touchLocation.x < 350) && (touchLocation.y > 81) && (touchLocation.y < 150)){
            _dStringFirstFret = NO;
            _dStringSecondFret = NO;
            _dStringThirdFret = NO;
            _dStringFourthFret = NO;
            _dStringFifthFret = NO;
            _dStringOpen = NO;
            _dStringHarmonic = YES;
        }
        // If no frets are pressed
        if ((touchLocation.y < 80) && (touchLocation.y > 150)){
            _dStringFirstFret = NO;
            _dStringSecondFret = NO;
            _dStringThirdFret = NO;
            _dStringFourthFret = NO;
            _dStringFifthFret = NO;
            _dStringOpen = YES;
            _dStringHarmonic = NO;
        }
        
        // If G string, 1st fret is pressed
        if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 0) && (touchLocation.y < 80)){
            _gStringFirstFret = YES;
            _gStringSecondFret = NO;
            _gStringThirdFret = NO;
            _gStringFourthFret = NO;
            _gStringFifthFret = NO;
            _gStringOpen = NO;
            _gStringHarmonic = NO;
            [gStringHarmonicPointer stop];
        }
        // If G string, 2nd fret is pressed
        if ((touchLocation.x > 73) && (touchLocation.x < 142) && (touchLocation.y > 0) && (touchLocation.y < 80)){
            _gStringFirstFret = NO;
            _gStringSecondFret = YES;
            _gStringThirdFret = NO;
            _gStringFourthFret = NO;
            _gStringFifthFret = NO;
            _gStringOpen = NO;
            _gStringHarmonic = NO;
            [gStringHarmonicPointer stop];
        }
        // If G string, 3rd fret is pressed
        if ((touchLocation.x > 143) && (touchLocation.x < 210) && (touchLocation.y > 0) && (touchLocation.y < 80)){
            _gStringFirstFret = NO;
            _gStringSecondFret = NO;
            _gStringThirdFret = YES;
            _gStringFourthFret = NO;
            _gStringFifthFret = NO;
            _gStringOpen = NO;
            _gStringHarmonic = NO;
            [gStringHarmonicPointer stop];
        }
        // If G string, 4th fret is pressed
        if ((touchLocation.x > 211) && (touchLocation.x < 275) && (touchLocation.y > 0) && (touchLocation.y < 80)){
            _gStringFirstFret = NO;
            _gStringSecondFret = NO;
            _gStringThirdFret = NO;
            _gStringFourthFret = YES;
            _gStringFifthFret = NO;
            _gStringOpen = NO;
            _gStringHarmonic = NO;
            [gStringHarmonicPointer stop];
        }
        // If G string, 5th fret is pressed
        if ((touchLocation.x > 276) && (touchLocation.x < 330) && (touchLocation.y > 0) && (touchLocation.y < 80)){
            _gStringFirstFret = NO;
            _gStringSecondFret = NO;
            _gStringThirdFret = NO;
            _gStringFourthFret = NO;
            _gStringFifthFret = YES;
            _gStringOpen = NO;
            _gStringHarmonic = NO;
            [gStringHarmonicPointer stop];
        }
        // If G string, harmonic is pressed
        if ((touchLocation.x > 331) && (touchLocation.x < 350) && (touchLocation.y > 0) && (touchLocation.y < 80)){
            _gStringFirstFret = NO;
            _gStringSecondFret = NO;
            _gStringThirdFret = NO;
            _gStringFourthFret = NO;
            _gStringFifthFret = NO;
            _gStringOpen = NO;
            _gStringHarmonic = YES;
        }
        // If no frets are pressed
        if (touchLocation.y > 80){
            _gStringFirstFret = NO;
            _gStringSecondFret = NO;
            _gStringThirdFret = NO;
            _gStringFourthFret = NO;
            _gStringFifthFret = NO;
            _gStringOpen = YES;
            _gStringHarmonic = NO;
            
        }

    }
    
    // Declaring whether or not the screen is currently touched
    if ([touches count] == 1)
    {
        if (!screenTouched) screenTouched = [touches anyObject];
    }
}

// Detecting touch movements
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Detecting any touch movements, updating what frets have been pressed, and generating fret noise
    
    
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    NSLog(@"%f - %f", touchLocation.x, touchLocation.y);
    
    // If E string, 1st fret is pressed
    if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 210) && (touchLocation.y < 285)){
        _eStringFirstFret = YES;
        _eStringSecondFret = NO;
        _eStringThirdFret = NO;
        _eStringFourthFret = NO;
        _eStringFifthFret = NO;
        _eStringOpen = NO;
        _eStringHarmonic = NO;
    }
    // If E string, 2nd fret is pressed
    if ((touchLocation.x > 72) && (touchLocation.x < 142) && (touchLocation.y > 210) && (touchLocation.y < 285)){
        _eStringFirstFret = NO;
        _eStringSecondFret = YES;
        _eStringThirdFret = NO;
        _eStringFourthFret = NO;
        _eStringFifthFret = NO;
        _eStringOpen = NO;
        _eStringHarmonic = NO;
    }
    // If E string, 3rd fret is pressed
    if ((touchLocation.x > 142) && (touchLocation.x < 210) && (touchLocation.y > 210) && (touchLocation.y < 285)){
        _eStringFirstFret = NO;
        _eStringSecondFret = NO;
        _eStringThirdFret = YES;
        _eStringFourthFret = NO;
        _eStringFifthFret = NO;
        _eStringOpen = NO;
        _eStringHarmonic = NO;
    }
    // If E string, 4th fret is pressed
    if ((touchLocation.x > 210) && (touchLocation.x < 275) && (touchLocation.y > 210) && (touchLocation.y < 285)){
        _eStringFirstFret = NO;
        _eStringSecondFret = NO;
        _eStringThirdFret = NO;
        _eStringFourthFret = YES;
        _eStringFifthFret = NO;
        _eStringOpen = NO;
        _eStringHarmonic = NO;
    }
    // If E string, 5th fret is pressed
    if ((touchLocation.x > 275) && (touchLocation.x < 330) && (touchLocation.y > 210) && (touchLocation.y < 285)){
        _eStringFirstFret = NO;
        _eStringSecondFret = NO;
        _eStringThirdFret = NO;
        _eStringFourthFret = NO;
        _eStringFifthFret = YES;
        _eStringOpen = NO;
        _eStringHarmonic = NO;
    }
    // If E string, harmonic is pressed
    if ((touchLocation.x > 330) && (touchLocation.x < 350) && (touchLocation.y > 210) && (touchLocation.y < 285)){
        _eStringFirstFret = NO;
        _eStringSecondFret = NO;
        _eStringThirdFret = NO;
        _eStringFourthFret = NO;
        _eStringFifthFret = NO;
        _eStringOpen = NO;
        _eStringHarmonic = YES;
    }
    // If no frets are pressed
    if (touchLocation.y < 210) {
        _eStringFirstFret = NO;
        _eStringSecondFret = NO;
        _eStringThirdFret = NO;
        _eStringFourthFret = NO;
        _eStringFifthFret = NO;
        _eStringOpen = YES;
        _eStringHarmonic = NO;
    }
    
    // If A string, 1st fret is pressed
    if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 150) && (touchLocation.y < 210)){
        _aStringFirstFret = YES;
        _aStringSecondFret = NO;
        _aStringThirdFret = NO;
        _aStringFourthFret = NO;
        _aStringFifthFret = NO;
        _aStringOpen = NO;
        _aStringHarmonic = NO;
    }
    // If A string, 2nd fret is pressed
    if ((touchLocation.x > 72) && (touchLocation.x < 142) && (touchLocation.y > 150) && (touchLocation.y < 210)){
        _aStringFirstFret = NO;
        _aStringSecondFret = YES;
        _aStringThirdFret = NO;
        _aStringFourthFret = NO;
        _aStringFifthFret = NO;
        _aStringOpen = NO;
        _aStringHarmonic = NO;
    }
    // If A string, 3rd fret is pressed
    if ((touchLocation.x > 142) && (touchLocation.x < 210) && (touchLocation.y > 150) && (touchLocation.y < 210)){
        _aStringFirstFret = NO;
        _aStringSecondFret = NO;
        _aStringThirdFret = YES;
        _aStringFourthFret = NO;
        _aStringFifthFret = NO;
        _aStringOpen = NO;
        _aStringHarmonic = NO;
    }
    // If A string, 4th fret is pressed
    if ((touchLocation.x > 210) && (touchLocation.x < 275) && (touchLocation.y > 150) && (touchLocation.y < 210)){
        _aStringFirstFret = NO;
        _aStringSecondFret = NO;
        _aStringThirdFret = NO;
        _aStringFourthFret = YES;
        _aStringFifthFret = NO;
        _aStringOpen = NO;
        _aStringHarmonic = NO;
    }
    // If A string, 5th fret is pressed
    if ((touchLocation.x > 275) && (touchLocation.x < 330) && (touchLocation.y > 150) && (touchLocation.y < 210)){
        _aStringFirstFret = NO;
        _aStringSecondFret = NO;
        _aStringThirdFret = NO;
        _aStringFourthFret = NO;
        _aStringFifthFret = YES;
        _aStringOpen = NO;
        _aStringHarmonic = NO;
    }
    // If A string, harmonic is pressed
    if ((touchLocation.x > 330) && (touchLocation.x < 350) && (touchLocation.y > 150) && (touchLocation.y < 210)){
        _aStringFirstFret = NO;
        _aStringSecondFret = NO;
        _aStringThirdFret = NO;
        _aStringFourthFret = NO;
        _aStringFifthFret = NO;
        _aStringOpen = NO;
        _aStringHarmonic = YES;
    }
    // If no frets are pressed
    if ((touchLocation.y > 210) && (touchLocation.y < 150)){
        _aStringFirstFret = NO;
        _aStringSecondFret = NO;
        _aStringThirdFret = NO;
        _aStringFourthFret = NO;
        _aStringFifthFret = NO;
        _aStringOpen = YES;
        _aStringHarmonic = NO;
    }
    
    // If D string, 1st fret is pressed
    if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 80) && (touchLocation.y < 150)){
        _dStringFirstFret = YES;
        _dStringSecondFret = NO;
        _dStringThirdFret = NO;
        _dStringFourthFret = NO;
        _dStringFifthFret = NO;
        _dStringOpen = NO;
        _dStringHarmonic = NO;
    }
    // If D string, 2nd fret is pressed
    if ((touchLocation.x > 72) && (touchLocation.x < 142) && (touchLocation.y > 80) && (touchLocation.y < 150)){
        _dStringFirstFret = NO;
        _dStringSecondFret = YES;
        _dStringThirdFret = NO;
        _dStringFourthFret = NO;
        _dStringFifthFret = NO;
        _dStringOpen = NO;
        _dStringHarmonic = NO;
    }
    // If D string, 3rd fret is pressed
    if ((touchLocation.x > 142) && (touchLocation.x < 210) && (touchLocation.y > 80) && (touchLocation.y < 150)){
        _dStringFirstFret = NO;
        _dStringSecondFret = NO;
        _dStringThirdFret = YES;
        _dStringFourthFret = NO;
        _dStringFifthFret = NO;
        _dStringOpen = NO;
        _dStringHarmonic = NO;
    }
    // If D string, 4th fret is pressed
    if ((touchLocation.x > 210) && (touchLocation.x < 275) && (touchLocation.y > 80) && (touchLocation.y < 150)){
        _dStringFirstFret = NO;
        _dStringSecondFret = NO;
        _dStringThirdFret = NO;
        _dStringFourthFret = YES;
        _dStringFifthFret = NO;
        _dStringOpen = NO;
        _dStringHarmonic = NO;
    }
    // If D string, 5th fret is pressed
    if ((touchLocation.x > 275) && (touchLocation.x < 330) && (touchLocation.y > 80) && (touchLocation.y < 150)){
        _dStringFirstFret = NO;
        _dStringSecondFret = NO;
        _dStringThirdFret = NO;
        _dStringFourthFret = NO;
        _dStringFifthFret = YES;
        _dStringOpen = NO;
        _dStringHarmonic = NO;
    }
    //  If D string, harmonic is pressed
    if ((touchLocation.x > 330) && (touchLocation.x < 350) && (touchLocation.y > 80) && (touchLocation.y < 150)){
        _dStringFirstFret = NO;
        _dStringSecondFret = NO;
        _dStringThirdFret = NO;
        _dStringFourthFret = NO;
        _dStringFifthFret = NO;
        _dStringOpen = NO;
        _dStringHarmonic = YES;
    }
    //If no frets are pressed
    if ((touchLocation.y < 80) && (touchLocation.y > 150)){
        _dStringFirstFret = NO;
        _dStringSecondFret = NO;
        _dStringThirdFret = NO;
        _dStringFourthFret = NO;
        _dStringFifthFret = NO;
        _dStringOpen = YES;
        _dStringHarmonic = NO;
    }
    
    //  If G string, 1st fret is pressed
    if ((touchLocation.x > 0) && (touchLocation.x < 72) && (touchLocation.y > 0) && (touchLocation.y < 80)){
        _gStringFirstFret = YES;
        _gStringSecondFret = NO;
        _gStringThirdFret = NO;
        _gStringFourthFret = NO;
        _gStringFifthFret = NO;
        _gStringOpen = NO;
        _gStringHarmonic = NO;
    }
    //  If G string, 2nd fret is pressed
    if ((touchLocation.x > 72) && (touchLocation.x < 142) && (touchLocation.y > 0) && (touchLocation.y < 80)){
        _gStringFirstFret = NO;
        _gStringSecondFret = YES;
        _gStringThirdFret = NO;
        _gStringFourthFret = NO;
        _gStringFifthFret = NO;
        _gStringOpen = NO;
        _gStringHarmonic = NO;
    }
    //  If G string, 3rd fret is pressed
    if ((touchLocation.x > 142) && (touchLocation.x < 210) && (touchLocation.y > 0) && (touchLocation.y < 80)){
        _gStringFirstFret = NO;
        _gStringSecondFret = NO;
        _gStringThirdFret = YES;
        _gStringFourthFret = NO;
        _gStringFifthFret = NO;
        _gStringOpen = NO;
        _gStringHarmonic = NO;
    }
    //  If G string, 4th fret is pressed
    if ((touchLocation.x > 210) && (touchLocation.x < 275) && (touchLocation.y > 0) && (touchLocation.y < 80)){
        _gStringFirstFret = NO;
        _gStringSecondFret = NO;
        _gStringThirdFret = NO;
        _gStringFourthFret = YES;
        _gStringFifthFret = NO;
        _gStringOpen = NO;
        _gStringHarmonic = NO;
    }
    //  If G string, 5th fret is pressed
    if ((touchLocation.x > 275) && (touchLocation.x < 330) && (touchLocation.y > 0) && (touchLocation.y < 80)){
        _gStringFirstFret = NO;
        _gStringSecondFret = NO;
        _gStringThirdFret = NO;
        _gStringFourthFret = NO;
        _gStringFifthFret = YES;
        _gStringOpen = NO;
        _gStringHarmonic = NO;
    }
    //  If G string, harmonic is pressed
    if ((touchLocation.x > 330) && (touchLocation.x < 350) && (touchLocation.y > 0) && (touchLocation.y < 80)){
        _gStringFirstFret = NO;
        _gStringSecondFret = NO;
        _gStringThirdFret = NO;
        _gStringFourthFret = NO;
        _gStringFifthFret = NO;
        _gStringOpen = NO;
        _gStringHarmonic = YES;
    }
    //  If no frets are pressed
    if (touchLocation.y > 80){
        _gStringFirstFret = NO;
        _gStringSecondFret = NO;
        _gStringThirdFret = NO;
        _gStringFourthFret = NO;
        _gStringFifthFret = NO;
        _gStringOpen = YES;
        _gStringHarmonic = NO;
    }
    
    
    
    // Fret noise generator, which uses a random number to play (or not play) different fret noises when a touch movement is detected

    // Get a random number between 0-30
    randomNumberFretNoise = arc4random()%30;
    
    // If the number generated is above 9, don't play anything
    if (randomNumberFretNoise > 9) {
        [fretNoisePointer stop];
    }
    // If its equal to 0, play sound 1
    else if (randomNumberFretNoise == 0) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_1"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_1_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    // If its equal to 1, play sound 2
    else if (randomNumberFretNoise == 1) {
        
        // Play clean sound if distorion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_2"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_2_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    // If its equal to 2, play sound 3
    else if (randomNumberFretNoise == 2) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_3"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_3_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 3, play sound 4
    else if (randomNumberFretNoise == 3) {
        if (_distortion == NO){
            
            // Play clean sound if distortion is off
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_4"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_4_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 4, play sound 5
    else if (randomNumberFretNoise == 4) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_4"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_5_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 5, play sound 6
    else if (randomNumberFretNoise == 5) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_6"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:1];
            [fretNoisePointer play];
        }
        
        // Play distortion sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_6_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 6, play sound 7
    else if (randomNumberFretNoise == 6) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_7"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_7_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 7, play sound 8
    else if (randomNumberFretNoise == 7) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_8"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_8_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 8, play sound 9
    else if (randomNumberFretNoise == 8) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_9"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_9_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
    // If its equal to 9, play sound 10
    else if (randomNumberFretNoise == 9) {
        
        // Play clean sound if distortion is off
        if (_distortion == NO){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_10"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
        
        // Play distorted sound if distortion is on
        else if (_distortion == YES){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"Buzz_10_Dist"
                                                 ofType:@"wav"]];
            
            fretNoisePointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            fretNoisePointer.delegate = self;
            [fretNoisePointer setVolume:0.05];
            [fretNoisePointer play];
        }
    }
    
}

// Detecting no touch
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // If the screen is not being touched...
    if ( screenTouched && [touches containsObject: screenTouched])
    {
        // ...open all strings
        _eStringOpen = YES;
        _eStringFirstFret = NO;
        _eStringSecondFret = NO;
        _eStringThirdFret = NO;
        _eStringFourthFret = NO;
        _eStringFifthFret = NO;
        _eStringHarmonic = NO;
        
        _aStringOpen = YES;
        _aStringFirstFret = NO;
        _aStringSecondFret = NO;
        _aStringThirdFret = NO;
        _aStringFourthFret = NO;
        _aStringFifthFret = NO;
        _aStringHarmonic = NO;
        
        _dStringOpen = YES;
        _dStringFirstFret = NO;
        _dStringSecondFret = NO;
        _dStringThirdFret = NO;
        _dStringFourthFret = NO;
        _dStringFifthFret = NO;
        _dStringHarmonic = NO;
        
        _gStringOpen = YES;
        _gStringFirstFret = NO;
        _gStringSecondFret = NO;
        _gStringThirdFret = NO;
        _gStringFourthFret = NO;
        _gStringFifthFret = NO;
        _gStringHarmonic = NO;
        
        // Reset screenTouched
        screenTouched = nil;
    }
}

// What note to be played when the E string is pressed
- (IBAction)eStringPress:(id)sender {

// Playing the sound appropriate to: which fret has been pressed; the tuning the string has been set to; and whether or not distortion is on
    
// For 1st Fret
    
    if (_eStringFirstFret == YES){
        
        // If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            // If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            // If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
        }
        
        // If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            // If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            // If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
        
        // If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            // If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            // If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
    }
    
// For 2nd fret
    
    else if (_eStringSecondFret == YES){
        
        // If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            // If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            // If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
        }
        
        // If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            // If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
    }
    
// For 3rd fret
    
    else if (_eStringThirdFret == YES){
        
        //If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
    }
    
// For 4th fret
    
    else if (_eStringFourthFret == YES){
        
        //If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
    }
    
// For 5th fret
    
    else if (_eStringFifthFret == YES){
        
        //If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
    }
    
// For harmonics
    
    else if (_eStringHarmonic == YES){
        
        //If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"eHarm_Dist"
                                                     ofType:@"wav"]];
                
                eStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringHarmonicPointer.delegate = self;
                [eStringHarmonicPointer setVolume:1];
                [eStringHarmonicPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"eHarm"
                                                     ofType:@"wav"]];
                
                eStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringHarmonicPointer.delegate = self;
                [eStringHarmonicPointer setVolume:1];
                [eStringHarmonicPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"eHarm-1_Dist"
                                                     ofType:@"wav"]];
                
                eStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringHarmonicPointer.delegate = self;
                [eStringHarmonicPointer setVolume:1];
                [eStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"eHarm-1"
                                                     ofType:@"wav"]];
                
                eStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringHarmonicPointer.delegate = self;
                [eStringHarmonicPointer setVolume:1];
                [eStringHarmonicPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"eHarm-2_Dist"
                                                     ofType:@"wav"]];
                
                eStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringHarmonicPointer.delegate = self;
                [eStringHarmonicPointer setVolume:1];
                [eStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"eHarm-2"
                                                     ofType:@"wav"]];
                
                eStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringHarmonicPointer.delegate = self;
                [eStringHarmonicPointer setVolume:1];
                [eStringHarmonicPointer play];
                
            }
        }
    }
    
// For open string
    
    else if (_eStringOpen == YES) {
        
        [eStringHarmonicPointer stop];
        
        //If tuning is not changed
        if (_eStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E1"
                                                     ofType:@"wav"]];
                    
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_eStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"Eb1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_eStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D1_Dist"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D1"
                                                     ofType:@"wav"]];
                
                eStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                eStringPointer.delegate = self;
                [eStringPointer setVolume:1];
                [eStringPointer play];
                
            }
        }
    }
}

// What note to be played when the A string is pressed
- (IBAction)aStringPress:(id)sender {

// Playing the sound appropriate to: which fret has been pressed; the tuning the string has been set to; and whether or not distortion is on
    
// For 1st fret
    
    if (_aStringFirstFret == YES){
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
    }
    
    
//For 2nd fret
    
    else if (_aStringSecondFret == YES){
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
    }
    
//For 3rd fret
    
    else if (_aStringThirdFret == YES){
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
    }
    
//For 4th fret
    
    else if (_aStringFourthFret == YES){
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
    }
    
//For 5th fret
    
    else if (_aStringFifthFret == YES){
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
    }
    
//For harmonics
    
    else if (_aStringHarmonic == YES){
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"aHarm_Dist"
                                                     ofType:@"wav"]];
                
                aStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringHarmonicPointer.delegate = self;
                [aStringHarmonicPointer setVolume:1];
                [aStringHarmonicPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"aHarm"
                                                     ofType:@"wav"]];
                
                aStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringHarmonicPointer.delegate = self;
                [aStringHarmonicPointer setVolume:1];
                [aStringHarmonicPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"aHarm-1_Dist"
                                                     ofType:@"wav"]];
                
                aStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringHarmonicPointer.delegate = self;
                [aStringHarmonicPointer setVolume:1];
                [aStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"aHarm-1"
                                                     ofType:@"wav"]];
                
                aStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringHarmonicPointer.delegate = self;
                [aStringHarmonicPointer setVolume:1];
                [aStringHarmonicPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"aHarm-2_Dist"
                                                     ofType:@"wav"]];
                
                aStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringHarmonicPointer.delegate = self;
                [aStringHarmonicPointer setVolume:1];
                [aStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"aHarm-2"
                                                     ofType:@"wav"]];
                
                aStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringHarmonicPointer.delegate = self;
                [aStringHarmonicPointer setVolume:1];
                [aStringHarmonicPointer play];
                
            }
        }
    }
    
    //For open string
    
    else if (_aStringOpen == YES) {
        
        [aStringHarmonicPointer stop];
        
        //If tuning is not changed
        if (_aStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_aStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_aStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1_Dist"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G1"
                                                     ofType:@"wav"]];
                
                aStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                aStringPointer.delegate = self;
                [aStringPointer setVolume:1];
                [aStringPointer play];
                
            }
        }
    }
}

// What note to be played when the D string is pressed
- (IBAction)dStringPress:(id)sender {
   
// Playing the sound appropriate to: which fret has been pressed; the tuning the string has been set to; and whether or not distortion is on
    
// For 1st fret
    
    if (_dStringFirstFret == YES){
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
    }
    
//For 2nd fret
    
    else if (_dStringSecondFret == YES){
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
    }

//For 3rd fret

    else if (_dStringThirdFret == YES){
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
    }
    
//For 4th fret
    
    else if (_dStringFourthFret == YES){
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"E2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
    }
    
//For 5th fret
    
    else if (_dStringFifthFret == YES){
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
    }
    
//For harmonics
    
    else if (_dStringHarmonic == YES){
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"dHarm_Dist"
                                                     ofType:@"wav"]];
                
                dStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringHarmonicPointer.delegate = self;
                [dStringHarmonicPointer setVolume:1];
                [dStringHarmonicPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"dHarm"
                                                     ofType:@"wav"]];
                
                dStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringHarmonicPointer.delegate = self;
                [dStringHarmonicPointer setVolume:1];
                [dStringHarmonicPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"dHarm-1_Dist"
                                                     ofType:@"wav"]];
                
                dStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringHarmonicPointer.delegate = self;
                [dStringHarmonicPointer setVolume:1];
                [dStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"dHarm-1"
                                                     ofType:@"wav"]];
                
                dStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringHarmonicPointer.delegate = self;
                [dStringHarmonicPointer setVolume:1];
                [dStringHarmonicPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"dHarm-2_Dist"
                                                     ofType:@"wav"]];
                
                dStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringHarmonicPointer.delegate = self;
                [dStringHarmonicPointer setVolume:1];
                [dStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"dHarm-2"
                                                     ofType:@"wav"]];
                
                dStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringHarmonicPointer.delegate = self;
                [dStringHarmonicPointer setVolume:1];
                [dStringHarmonicPointer play];
                
            }
        }
    }
    
//For open string
    
    else if (_dStringOpen == YES) {
        
        [dStringHarmonicPointer stop];
        
        //If tuning is not changed
        if (_dStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"D2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_dStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C#2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_dStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2_Dist"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C2"
                                                     ofType:@"wav"]];
                
                dStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                dStringPointer.delegate = self;
                [dStringPointer setVolume:1];
                [dStringPointer play];
                
            }
        }
    }
}

// What note to be played when the G string is pressed
- (IBAction)gStringPress:(id)sender {

// Playing the sound appropriate to: which fret has been pressed; the tuning the string has been set to; and whether or not distortion is on
    
//For 1st fret
    
    if (_gStringFirstFret == YES){
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
    }
    
//For 2nd fret
    
    else if (_gStringSecondFret == YES){
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
    }
    
//For 3rd fret
    
    else if (_gStringThirdFret == YES){
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
    }
    
//For 4th fret
    
    else if (_gStringFourthFret == YES){
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B3_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B3"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }}

//For 5th fret
    
    else if (_gStringFifthFret == YES){
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C3_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"C3"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B3_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"B3"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"A#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
    }
    
//For harmonics
    
    else if (_gStringHarmonic == YES){
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"gHarm_Dist"
                                                     ofType:@"wav"]];
                
                gStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringHarmonicPointer.delegate = self;
                [gStringHarmonicPointer setVolume:1];
                [gStringHarmonicPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"gHarm"
                                                     ofType:@"wav"]];
                
                gStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringHarmonicPointer.delegate = self;
                [gStringHarmonicPointer setVolume:1];
                [gStringHarmonicPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"gHarm-1_Dist"
                                                     ofType:@"wav"]];
                
                gStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringHarmonicPointer.delegate = self;
                [gStringHarmonicPointer setVolume:1];
                [gStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"gHarm-1"
                                                     ofType:@"wav"]];
                
                gStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringHarmonicPointer.delegate = self;
                [gStringHarmonicPointer setVolume:1];
                [gStringHarmonicPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"gHarm-2_Dist"
                                                     ofType:@"wav"]];
                
                gStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringHarmonicPointer.delegate = self;
                [gStringHarmonicPointer setVolume:1];
                [gStringHarmonicPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"gHarm-2"
                                                     ofType:@"wav"]];
                
                gStringHarmonicPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringHarmonicPointer.delegate = self;
                [gStringHarmonicPointer setVolume:1];
                [gStringHarmonicPointer play];
                
            }
        }}
    
//For open string
    
    else if (_gStringOpen == YES) {
        
        [gStringHarmonicPointer stop];
        
        //If tuning is not changed
        if (_gStringSegueTuning == 1){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion is off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"G2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
        }
        
        //If tuning is down 1 semitone
        else if (_gStringSegueTuning == 2){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F#2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
        
        //If tuning is down 1 tone
        else if (_gStringSegueTuning == 3){
            
            //If distortion is on
            if (_distortion == YES) {
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2_Dist"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
            }
            
            //If distortion of off
            else if (_distortion == NO){
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                     pathForResource:@"F2"
                                                     ofType:@"wav"]];
                
                gStringPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                gStringPointer.delegate = self;
                [gStringPointer setVolume:1];
                [gStringPointer play];
                
            }
        }
    }
}

// Shows a pop up window with helpful information
- (IBAction)helpButton:(id)sender {
    
    // Play distorted harmonic
    if (_distortion == YES){
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"gHarm_Dist"
                                             ofType:@"wav"]];
        
        helpPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        helpPointer.delegate = self;
        [helpPointer setVolume:0.5];
        [helpPointer play];
    }
    
    // Play clean harmonic
    else if (_distortion == NO){
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"gHarm"
                                             ofType:@"wav"]];
        
        helpPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        helpPointer.delegate = self;
        [helpPointer setVolume:0.5];
        [helpPointer play];
    }
    
    // Pop up window contents
    UIAlertView *help = [[UIAlertView alloc] initWithTitle:@"Help" message:@"Use the fretboard by holding down a fret and then playing the string.\n\nUse headphones for best results.\n\nPress RETURN to go back!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Show the window
    [help show];
}

// Switches the view to the previous View Controller
- (IBAction)returnButton:(id)sender {
   
    if (_distortion == NO){
        
        //Play clean sound if distortion is off
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"Buzz_1"
                                             ofType:@"wav"]];
        
        returnPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        returnPointer.delegate = self;
        [returnPointer setVolume:0.7];
        [returnPointer play];
        
    }
    else if (_distortion == YES){
        
        //Play distorted sound if distortion is on
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                             pathForResource:@"Buzz_1_Dist"
                                             ofType:@"wav"]];
        
        returnPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        returnPointer.delegate = self;
        [returnPointer setVolume:0.7];
        [returnPointer play];
    }

    //Stoping all other audio pointers when leaving the View Controller
    [eStringPointer stop];
    [aStringPointer stop];
    [dStringPointer stop];
    [gStringPointer stop];
    [fretNoisePointer stop];
    [helpPointer stop];
    [eStringHarmonicPointer stop];
    [aStringHarmonicPointer stop];
    [dStringHarmonicPointer stop];
    [gStringHarmonicPointer stop];
}

@end
