//
//  VPViewController.m
//  ViocePlay
//
//  Created by jianing on 10/17/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "VPViewController.h"
#import "AudioToolbox/AudioToolbox.h"
#import <AVFoundation/AVFoundation.h>

@interface VPViewController ()

@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@end

@implementation VPViewController
{
    SystemSoundID shortSound;
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"hello-wav" ofType:@"wav"];
//    if (soundPath) {
//        NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
//        OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &shortSound);
//        if (err != kAudioServicesNoError) {
//            NSLog(@"-------- Could not load %@, error code: %ld", soundURL, err);
//        }
//    }
    
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"hello"
                                                          ofType:@"aiff"];
    if (musicPath) {
        NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL
                                                             error:nil];
        [audioPlayer setDelegate:self];
    }
}

- (IBAction)playSound:(UIButton *)sender {
//    AudioServicesPlaySystemSound(shortSound);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    if ([audioPlayer isPlaying]) {
        [audioPlayer stop];
        [sender setTitle:@"点击播放"
                forState:UIControlStateNormal];
    }
    else {
        [audioPlayer play];
        [sender setTitle:@"停止"
                forState:UIControlStateNormal];
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag
{
    [self.soundButton setTitle:@"点击播放"
                 forState:UIControlStateNormal];
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    [audioPlayer play];
}

@end
