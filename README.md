SublimeText URLHandler on OS X
==============================

This application enables SublimeText 2 and 3 to open `subl:` urls, as Textmate has as described [here](http://manual.macromates.com/en/using_textmate_from_terminal#url_scheme_html)

    subl://open/?file=/path/to/file.txt&line=10&column=2


Installation
------------

### Download Binary

Download the latest binary from the [releases](https://github.com/florianeckerstorfer/subl-handler/releases) page.

### Manual Installation

Clone the repo and run the application via Xcode.


Usage
-----

The **Preferences** dialog should show up everytime you launch the up directly. By default the path is set for Sublime Text 3, if you still use ST2 change it accordingly.

### Does it work?

Open Terminal.app and type:

    open 'subl://open/?file=/etc/paths&line=5'


Uninstallation
--------------

Delete the following files:

    /Applications/SublHandler.app
    ~/Library/Preferences/com.asuth.sublhandler.plist

You can also use [AppCleaner](http://www.freemacsoft.net/appcleaner/) or similar apps.

Author
------

The code in this repository is based on [mariussoutier](https://github.com/mariussoutier/subl-handler) fork of [asuth/subl-handler](https://github.com/asuth/subl-handler).

* Daisuke Murase :@typester (github, twitter, CPAN, etc..)
* Scott Wadden (SublimeText 2 port)
* Andrew Sutherland (Mountain Lion fixes)
* [Florian Eckerstorfer](http://florian.ec) (Mavericks, hide Dock icon, ST3)

License
-------

BSD.

