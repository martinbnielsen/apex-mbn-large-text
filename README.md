# apex-mbn-large-text
Oracle Application Express Plugin - MBN Large Text

#MBN Large Text
This plugin enables collapse/expand of large text columns in Interactive Reports.
The end user will, by default, only see a small amount of text, but can choose to expand to see the full text in a column.

##Changelog

####1.0 - Initial Release
####1.1 - Added expand/collapse JavaScript functions.

##Install
- Import plugin file "dynamic_action_plugin_com_mbndata_plugin_large_text.sql" into your application
- (Optional) Deploy the JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

##Plugin Settings
The plugin settings are highly customizable and you can change:
- **Width (px)** - The maximum width of the text column when collapsed.
- **Height (px)** - The maximum height of the column when collapsed.

## How to use
- Change the "HTML Expression" property for Interactive Reports Columns which should be collapsed (note: the tag MUST be a div)
```html
<div class="large_text">#CALL_STACK#</div>
```
- Add a Dynamic Action to the page:
  - Event = After Refresh
  -  Selection Type = region
  - Region = <Name of your Interactive Report Region>
- Create a True action for the dynamic action
  - Action = MBN Large Text
  - Set the Width and Height
  - Selection Type = jQuery Selector
  - jQuery Selector = .large_text
  - Fire On Page Load = True

## Collapse and Expand all
To collapse or expand all, two JavaScript function are supplied:
```js
mbndata.expand_all('.large_text');
or
mbndata.collapse_all('.large_text');
```

Please use the same JQuery selector as specified in the plugin (as parameter to the JavaScript functions).
 
###Demo Application
https://apex.oracle.com/pls/apex/f?p=42601:1

##Preview
![](https://github.com/martinbnielsen/apex-mbn-large-text/blob/master/images/MBN_Large_Text_Preview.png)
