SublimeText 2 URLHandler on OS X
=======================
This application enables SublimeText 2 to open `subl:` urls, as Textmate has as described [here](http://manual.macromates.com/en/using_textmate_from_terminal#url_scheme_html)

    subl://open/?file=/path/to/file.txt&line=10&column=2

Installation
------------
Clone the repo and run the application via Xcode.

Select `SublHandler` -> `Preferences...`, then change the path for the subl binary if necessary.

Test it
-------
Open terminal and type:
    open 'subl://open/?file=/etc/paths&line=5'


Uninstalling
------------
Delete following:

    /Applications/SublHandler.app
    ~/Library/Preferences/com.asuth.sublhandler.plist

Author
------

* Daisuke Murase :@typester (github, twitter, CPAN, etc..)
* Scott Wadden (SublimeText 2 port)
* Andrew Sutherland (Mountain Lion fixes)

License
-------

BSD.

