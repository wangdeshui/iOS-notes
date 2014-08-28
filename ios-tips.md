# ios tips
## Find the size of a NSString
```objectivec
CGSize size = [@“Hello world” sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:@“Avenir-Book” size:20]}];
```
## Create a UILabel Where Each Letter in the String is a Different Color
```objectivec
+(NSMutableAttributedString*)buildString:(NSString*)txt withColors:(NSArray*)colors
{
   NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc]initWithString:txt];

   NSInteger count = attrString.length;

   for(int i = 0;i < count; i++)
   {
      NSRange range;
      range.location = i;
      range.length = 1;

      int colorIndex = i;
      while(colors.count <= colorindex="" br="">      {
         colorIndex -= colors.count;
      }

      UIColor* color = colors[colorIndex];
      [attrString addAttribute:NSForegroundColorAttributeName value:color range:range];
   }

   return attrString;
}
```

## Split a UIImage into Multiple Parts
```objectivec
-(void)splitImage:(UIImage *)image
{
   CGFloat imgWidth = image.size.width/2;
   CGFloat imgheight = image.size.height;
   CGRect leftImgFrame = CGRectMake(0, 0, imgWidth, imgheight);
   CGRect rightImgFrame = CGRectMake(imgWidth, 0, imgWidth, imgheight);

  CGImageRef left = CGImageCreateWithImageInRect(image.CGImage, leftImgFrame);
  CGImageRef right = CGImageCreateWithImageInRect(image.CGImage, rightImgFrame);

  UIImage* leftImage = [UIImage imageWithCGImage:left];
  UIImage* rightImage = [UIImage imageWithCGImage:right];

  CGImageRelease(left);
  CGImageRelease(right);
}


-(NSMutableArray *)getImagesFromImage:(UIImage *)image withRow:(NSInteger)rows withColumn:(NSInteger)columns
{
    NSMutableArray *images = [NSMutableArray array];
    CGSize imageSize = image.size;
    CGFloat xPos = 0.0, yPos = 0.0;
    CGFloat width = imageSize.width/rows;
    CGFloat height = imageSize.height/columns;
    for (int y = 0; y < columns; y++) {
        xPos = 0.0;
        for (int x = 0; x < rows; x++) {
            
            CGRect rect = CGRectMake(xPos, yPos, width, height);
            CGImageRef cImage = CGImageCreateWithImageInRect([image CGImage],  rect);
            
            UIImage *dImage = [[UIImage alloc] initWithCGImage:cImage];
            [images addObject:dImage];
            xPos += width;
        }
        yPos += height;
    }
    return images;
}     


```

## Find a Number from within an NSString

@"the string contains number: ab1234"
```objectivec
NSString* val = @"Find this number: 256";
NSString* numberString;

NSScanner *scanner = [NSScanner scannerWithString:val];
NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];

// Throw away characters before the first number.
[scanner scanUpToCharactersFromSet:numbers intoString:NULL];

// Collect numbers.
[scanner scanCharactersFromSet:numbers intoString:&numberString];
NSInteger number = numberString.integerValue;
```
## Working with NSDate

* Create a Date From Scratch:

    ```objectivec
    NSDateComponents* comps = [[NSDateComponents alloc]init];
    comps.year = 2014;
    comps.month = 3;
    comps.day = 31;

    NSCalendar* calendar = [NSCalendar currentCalendar];

    NSDate* date = [calendar dateFromComponents:comps];
    ```

* Add a day to a Date:

    ```objectivec
    NSDate* date = [NSDate date];

    NSDateComponents* comps = [[NSDateComponents alloc]init];
    comps.day = 1;

    NSCalendar* calendar = [NSCalendar currentCalendar];

    NSDate* tomorrow = [calendar dateByAddingComponents:comps toDate:date options:nil];
    ```


* Subtract a day from a Date:
```objectivec
    NSDate* date = [NSDate date];

    NSDateComponents* comps = [[NSDateComponents alloc]init];
    comps.day = -1;

    NSCalendar* calendar = [NSCalendar currentCalendar];

    NSDate* yesterday = [calendar dateByAddingComponents:comps toDate:date options:nil];
    ```

* Convert a Date to a String:

    ```objectivec
    NSDate* date = [NSDate date];

    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MMMM dd, yyyy";
    NSString* dateString = [formatter stringFromDate:date];
    ```


* Convert a String to a Date:

    ```objectivec
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MMMM dd, yyyy";
    NSDate* date = [formatter dateFromString:@"August 02, 2014"];
    ```

* Find how many days are in a month:

    ```objectivec
    NSDate* date = [NSDate date];

    NSCalendar* cal = [NSCalendar currentCalendar];
    NSRange currentRange = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    NSInteger numberOfDays = currentRange.length;
    ```

* Calculate how much time something took:

    ```objectivec
    NSDate* start = [NSDate date];

    for(int i = 0; i < 1000000000; i++);

    NSDate* end = [NSDate date];
    NSTimeInterval duration = [end timeIntervalSinceDate:start];
	```


* Find the Day Of Week for a specific Date:
```objectivec
NSDate* date = [NSDate date];
NSCalendar* cal = [NSCalendar currentCalendar];
NSInteger dow = [cal ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:date];
```

## device detection


* iPad

	BOOL iPad = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);

* iPhone

	BOOL iPhone = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
* iPhone 5 (4" screen)

	BOOL iPhone5 = ([ [ UIScreen mainScreen ] bounds ].size.height >= 568 );
* Retina Display

	BOOL retina =   ([UIScreen mainScreen].scale >= 2);
    
## OS Detection

* iOS 7

	BOOL iOS7 = (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
It's worth noting that you can also detect the OS by validating against API that you know only exists in a specific version of the OS:

BOOL iOS7 = NSClassFromString(@"UIInterpolatingMotionEffect") != nil;

## UIImage
Retina: image@2px.png

iPhone: image~iphone.png

iPad: image~ipad.png

Retina iPhone: image@2px~iphone.png

Retina iPad: image@2px~ipad.png