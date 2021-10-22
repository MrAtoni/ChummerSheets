# ChummerSheets
A few printable sheets for Chummer5.

Chummer is a character generator for Shadowrun 5th edition.
https://github.com/chummer5a/chummer5a

## How to install

### From the zip-file

**Make sure Chummer5 isn't running.** If it is, close it.

1. Unzip the contents of this zip-file.

2. Move the "MrAtoni Sheets" folder into the folder where your chummer program is.
  - "MrAtoni Sheets" **HAS TO BE** a subfolder of the folder where Chummer5.exe is.

3. In the "MrAtoni Sheets" folder, run Install.bat

When you start Chummer next time, the new sheets should now be found in the print dialog (in the top of the drop-down)

Install.bat has to be rerun each time you upgrade Chummer.

### By copying the files

**Make sure Chummer5 isn't running.** If it is, close it.

1. Download the following files in your prefered way:
  - MrAtonis Combat Stats.xsl
  - MrAtonis Combat stats.xslt
  - MrAtonis Decker Sheet.xsl
  - MrAtonis Decker Sheet.xslt

2. Locate where Chummer is on your disk (The folder with Chummer5.exe)

3. Move the downloaded files to the sheets-folder inside the Chummer-directory.

4. Open the file [Chummer-directory]\data\sheets.xml
  - It's recomended that you **create a backup** of the file first

5. After `<sheets lang="en-us">` add the following codesnippet, and save.
```xml
<sheet> 
  <id>5af43585-1942-4ab9-b0b3-b0984e9f0f53</id> 
  <name>--Combat Stats--</name> 
  <filename>MrAtonis Combat Stats</filename> 
</sheet> 
<sheet> 
  <id>3287781c-a7c4-42cc-8fd3-9d069dab5762</id> 
  <name>--Decker Sheet--</name> 
  <filename>MrAtonis Decker Sheet</filename> 
</sheet> 
```

When you start Chummer next time, the new sheets should now be found in the print dialog (in the top of the drop-down)

You have to redo step 4 and 5 each time you update Chummer.


## Description of the sheets

### Combat Stats

This is a sheet for easy access to your combat stats.

It lists your initiative rolls, your defence rolls and damage resist rolls.

It also lists your Armor and its rating and your Weapons and the attack roll to use it.

Theres allso an optional combat cheet sheet that will be printed on a new paper (or the back of the combat sheet, sepending on your printer settings)

### Decker Sheet

This is a three page sheet listing your Cyberdecks.

It then lists all matrix actions, a short description of each action and the calculated roll to make.

*I have addes the extra actions a technomanzer can make, so it should work for technomanzers too. But I have not tested it thoroughly*