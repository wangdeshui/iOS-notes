# iOS debug

## print
* po
print object description
* p
print primtive value

##exper
will be evaluated in real time

```objectivec

expr self.view.hidden=YES

```
    
## back trace
bt
bt all
back trace all thread
## thread
* thread backtrace all
* thread list
* thread select 1
* thread until 100
* thread return @"Custom Return String"

## frame
Inspect local variables in realtime
* frame variable
>(MainViewController *const) self = 0x000000010921cca0
(SEL) _cmd = "doSomething"
(NSString *) value = nil

* frame variable self
>(lldb) frame variable self
(MainViewController *const) self = 0x000000010921cca0
* frame select 2
* frame select -relative -1
