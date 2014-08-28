BFPaperColors
=============

> Flat colors taken from Google's Material Design: Paper.

![Screenshot](https://raw.githubusercontent.com/bfeher/BFPaperColors/master/Screen%20Shot%202014-07-16%20at%2013.34.20.png "Screenshot")

![Blue Detail](https://raw.githubusercontent.com/bfeher/BFPaperColors/master/Screen%20Shot%202014-07-16%20at%2013.35.13.png "Blue Detail")


About
---------
_UIColor+BFPaperColors_ is a category for _UIColor_ that adds class methods to conveniently produce **over 240 new colors** designed for flat or semi-flat interface designs by [Google's Material Design Labs](http://www.google.com/design/spec/style/color.html).


Usage
---------
Add the _UIColor+BFPaperColors_ header and implementation file to your project. (.h & .m)

After doing that, it is a simple as calling:`[UIColor paperColorXXXXX]` (where XXXXX is the color of your choice). Each paper color method is prefixed with the words "paperColor" for easy recognition in Xcode's code complete. All colors have a wide range of shades, noted by a number suffix. For example, A very light blue could be `[UIColor paperColorLightBlue100]` while a darker shade could be `[UIColor paperColorLightBlue700]`.


Cocoapods
-------

CocoaPods are the best way to manage library dependencies in Objective-C projects.
Learn more at http://cocoapods.org

Add this to your podfile to add the UIColor+BFPaperColors category to your project.
`pod 'UIColor+BFPaperColors',       '~> 1.0'`


License
--------
_UIColor+BFPaperColors_ uses the MIT License:

> Please see included [LICENSE file](https://raw.githubusercontent.com/bfeher/BFPaperColors/master/LICENSE).
