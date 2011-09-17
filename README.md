TextMate URLHandler for SublimeText 2 on OSX
=======================

This application enables SublimeText 2 to open TextMate's `txmt:` urls, as described [here](http://manual.macromates.com/en/using_textmate_from_terminal#url_scheme_html)

    txmt://open/?url=file:///etc/passwd&line=10&column=2

Requirements
------------

* Mac OS X (10.6 or 10.7)
* SublimeText 2

Installation
------------

Download [latest release](https://github.com/downloads/hiddenbek/subl-handler/SublHandler.zip).

Unzip it, and install it in your Applications directory.

Launch it and select `SublHandler` -> `Preferences...`, then set the path for the subl binary.

Test it
-------

Open terminal and type:

    open 'txmt://open/?url=file:///etc/hosts'

or just click any txmt link.

Uninstalling
------------

Delete following:

    /Applications/SublHandler.app
    ~/Library/Preferences/org.unknownplace.sublhandler.plist

Author
------

* Daisuke Murase :@typester (github, twitter, CPAN, etc..)
* Scott Wadden (SublimeText 2 port)

License
-------

BSD.

