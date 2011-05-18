JavaScript Tools TextMate Bundle
===

Help
---

Opens this help file.

Run Javascript (⌘R)
---

Attempts to run the current javascript document or selection in TextMate's Web Preview window.

Javascript Lint
---

> JSLint takes a JavaScript source and scans it. If it finds a problem, it returns a message describing the problem and an approximate location within the source. The problem is not necessarily a syntax error, although it often is. JSLint looks at some style conventions as well as structural problems. It does not prove that your program is correct. It just provides another set of eyes to help spot problems. - <http://www.jslint.com/lint.html>

* **Validate Syntax** (⌃⇧V) uses Douglas Crockford's jslint to check your script for errors and warnings and shows the results in a new window. The *Validate Javascript* window will give you a description and hyperlink when problems are found. The hyperlink will take you straight to the where jslint suspects the problem arises.

* **Validate Syntax Quick** (⌘S) same as above except that instead of a dedicated window you simply get a tooltip showing the number of errors and warnings. This command overrides the Save behavior so every time you save your javascript it will be passed through jslint. Of course it only applies to javascript files so you don't need to worry about accidentally jslint'ing your non-javascript files.

* **Edit Lint Validation settings** allows you to customize what jslint considers when checking your script. The format and meaning of the options are straightforward and well documented within the settings file itself.

Formatting / Compression
---

* **Format Javascript** (⌃Q) attempts to beautify your javascript by inserting uniform line breaks and indentation throughout your current document or selection.

* **Dojo ShrinkSafe (current file)** (⌃⌘C) uses a custom Rhino build from the Dojo Toolkit project to compress your current javascript document. Before compressing it attempts to insert missing semi-colons so you should consider running *Validate Syntax* and fixing missing semi-colons prior to using this command.

* **Dean Edwards Packer (current file)** (⌃⌘C) compresses and obfuscates your current javascript document. It currently relies on the Packr ruby port which is based on version 3 of Packer. According to Dean Edwards, **"All statements, *including function declarations*, must be correctly terminated with semi-colons"** before you run this command. After an email exchange with James Coglan, author of Packr, it's been decided that base62 encoding not be on by default as having it off yields more efficiency when your scripts are gzipped.  
However, if you would like base62 encoding, just set the Variable `TM_JST_PB62` to `true` in the Advanced pane of the TextMate preferences or in your TextMate Project variables (Refer to **section 9.2** of the TextMate Help manual for more information on shell variables).

* **YUI! Compressor (current file)** (⌃⌘C) compresses your current javascript document. By default it assumes your character set is UTF-8. Additionally it uses the preserve semi-colons option, to keep from creating new jslint warnings. Both of these settings can be easily overridden. To use a different character set create a `TM_JST_YCHAR` shell variable with the value set to the character set you're using, like `iso8859`. Similarly, you can set the `TM_JST_YSEMI` variable to `false` to get non-essential semi-colons removed. Other available variables are `TM_JST_YLNBK`, `TM_JST_YMUNG` and `TM_JST_YOPTI` which control line breaks, obfuscation and micro optimizations, respectively. The `TM_JST_YLNBK` value is the column where you want to insert line breaks, like `80`; `0` is a special value that will insert a line break after each semi-colon. Setting the value of `TM_JST_YMUNG` to `false` disables the obfuscation of local symbols; likewise setting `TM_JST_YOPTI` to `false` disables all of the YUI! Compressor built-in micro optimizations. Refer to **section 9.2** of the TextMate Help manual for more information on shell variables.

* **JSMin (current file)** (⌃⌘C) uses Douglas Crockford's JSMin to minimize your current javascript document. It will not do any semi-colon insertion or removal.

* **JSMin selection** (⌃⌥⇧Q) same as the above except it only applies to the selected portion of your current javascript document.

* **Convert Javascript to Bookmarklet** (⌃⌥⇧Q) turns your current javascript selection or document into a [bookmarklet][bkml] for use in a web browser.

* **Convert Bookmarklet to Javascript** (⌃⌥⇧Q) does the opposite of the above; turns an existing bookmarklet into a standard javascript.


Licenses
---

* **[JSLint][lint]** Copyright 2002 Douglas Crockford
* **[Dojo Toolkit][dojo]** [BSD License][dbsd] or [Academic Free License version 2.1][dafl]
* **[Rhino][rhino]** [MPL 1.1/GPL 2.0][rmpl] [except where noted][radd]
* **[Dean Edwards Packer][pack]** [LGPL License][lgpl]
* **[Packr][packr]** [MIT License][mit]
* **[YUI! Compressor][yuic]** [BSD License][ybsd]
* **[JSMin][jsmin]** Copyright 2001 Douglas Crockford

[rhino]:  http://developer.mozilla.org/en/docs/Rhino_documentation
[rmpl]:   http://www.mozilla.org/MPL/
[radd]:   http://developer.mozilla.org/en/docs/Rhino_License
[dojo]:   http://dojotoolkit.org/docs/shrinksafe
[dbsd]:   http://trac.dojotoolkit.org/browser/dojo/trunk/LICENSE#L13
[dafl]:   http://trac.dojotoolkit.org/browser/dojo/trunk/LICENSE#L43
[pack]:   http://dean.edwards.name/packer/
[packr]:  http://blog.jcoglan.com/packr/
[lint]:   http://www.jslint.com/
[lgpl]:   http://creativecommons.org/licenses/LGPL/2.1/
[mit]:    http://www.opensource.org/licenses/mit-license
[yuic]:   http://developer.yahoo.com/yui/compressor/
[ybsd]:   http://developer.yahoo.com/yui/license.html
[jsmin]:  http://www.crockford.com/javascript/jsmin.html
[bkml]:   http://en.wikipedia.org/wiki/Bookmarklet
