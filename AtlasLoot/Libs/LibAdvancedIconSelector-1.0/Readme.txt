========================================================================================
    LibAdvancedIconSelector provides a searchable icon selection GUI to World
    of Warcraft addons.
    
    Copyright (c) 2011 David Forrester  (Darthyl of Bronzebeard-US)
      Email: darthyl@hotmail.com
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
========================================================================================

========================================================================================
    Please notify me if you wish to make use of this library in your addon!
    I need to know for testing purposes - to make sure that any changes I make
    aren't going to break someone else's addon!
========================================================================================

    Official website for AdvancedIconSelector:
    http://wow.curse.com/downloads/wow-addons/details/advancediconselector.aspx
    
    Official website for LibAdvancedIconSelector-1.0:
    http://wow.curse.com/downloads/wow-addons/details/libadvancediconselector-1.0.aspx
    
    Original author: Darthyl of Bronzebeard-US  <darthyl@hotmail.com>

========================================================================================

Setup work:  (to use LibAdvancedIconSelector-1.0 in your addon)

    1) Copy the "LibAdvancedIconSelector-1.0" directory into a "Libs" subdirectory of
       your addon.

    2) Add Libs\LibAdvancedIconSelector-1.0\LibAdvancedIconSelector-1.0.xml to your TOC.

========================================================================================

Basic usage example:

    local lib = LibStub("LibAdvancedIconSelector-1.0")
    local options = { okayCancel = false }
    local myIconWindow = lib:CreateIconSelectorWindow("MyIconWindow", UIParent, options)
    myIconWindow:SetPoint("CENTER")

And... if you want to enable search by keyword:

    myIconWindow:SetScript("BeforeShow", function(self)
        local keywordsLib = LibStub("LibAdvancedIconSelector-KeywordData-1.0", true)
        -- Load the keywords library if a newer version isn't already loaded.
        if not keywordsLib or keywordsLib:GetRevision() < GetAddOnMetadata("AdvancedIconSelector-KeywordData", "X-Revision") then
            LoadAddOn("AdvancedIconSelector-KeywordData")
        end
    end)

  NOTE: This code will only load keyword data if the user has installed AdvancedIconSelector
  IN ADDITION TO your addon.  You can distribute a copy of the keyword library with your
  addon so the user doesn't have to install AIS, but you MUST rename the folder so that it
  doesn't conflict with a possible AIS installation.  See the instructions at the top of
  AdvancedIconSelector-KeywordData.lua on how to do this.

  If you're doing this, replace "AdvancedIconSelector-KeywordData" in the example above
  with what you renamed the addon to, but DO NOT CHANGE the string "LibAdvancedIconSelector-KeywordData-1.0",
  as this is the string that's used to access the most recent keyword data provided by
  ANY addon.

========================================================================================

Library functionality:

  lib:Embed(addon)
    Embeds this library's functions into your addon.

  lib:CreateIconSelectorWindow(name, parent, options)
    Creates a new icon selector WINDOW, including search box, buttons, etc.

  lib:CreateIconSelectorFrame(name, parent, options)
    Creates a new icon selector FRAME, which includes only the icon display
    and its scroll bar.

========================================================================================

IconsFrame functionality:

  iconsFrame:SetSearchParameter(searchText)
    Sets the search parameter used to filter the icons displayed in the frame,
    and begins the search after a short delay (in case the user is still
    typing).

  iconsFrame:ShowEquippedIcons(b)
    Sets whether or not "equipped icons" are shown in the frame.
    (default: options.showEquippedIcons)

  iconsFrame:ShowMacroIcons(b)
    Sets whether or not "macro icons" are shown in the frame.
    (default: options.showMacroIcons)

  iconsFrame:ShowItemIcons(b)
    Sets whether or not "item icons" are shown in the frame.
    (default: options.showItemIcons)

  iconsFrame:SetSelectionByName(name)
    Sets the selection to the icon with the given texture filename,
    once it's been found, unless a new icon has been selected by the user
    before then.

  id, kind, texture = iconsFrame:GetSelectedIconInfo()
    Returns information about the currently selected icon.
      id => ID of the icon selected
      kind => "Equipped", "Macro", or "Item", depending on what was selected.
          "Equipped" => id corresponds to GetInventoryItemTexture("player", id)
          "Macro" => id corresponds to GetMacroIconInfo(id)
          "Item" => id corresponds to GetMacroItemIconInfo(id)
    nil is returned if nothing is selected.

  iconsFrame:SetScript(scriptType, handler)
    New script types have been added to the iconsFrame:
      OnSelectedIconChanged(self) - fired when the selection changes
      BeforeShow(self) - like OnShow, but fired just BEFORE the frame is shown.
        Note that this is a good time to make sure icon keyword data is loaded!

========================================================================================

IconsWindow functionality:

  Note: You can access the icon frame contained within an icon window through
  iconsWindow.iconsFrame.

  iconsWindow:SetScript(scriptType, handler)
    New script types have been added to the iconsWindow:
      OnOkayClicked(self) - fired when the Okay button is clicked
      OnCancelClicked(self) - fired when the Cancel, Close, or X button is clicked

========================================================================================

Options:

  You can pass an optional "options" table to
  lib:CreateIconSelectorWindow() and lib:CreateIconSelectorFrame() that
  specifies additional styling.  Officially supported options are as follows:

  Primary options:
     showEquippedIconsBox - adds a checkbox to display the equipped icon class (default = false)
     showMacroIconsBox - adds a checkbox to display the macro icon class (default = true)
     showItemIconsBox - adds a checkbox to display the item icon class (default = true)
     showEquippedIcons - show equipped item icons by default? (default = false)
     showMacroIcons - show macro icons by default? (default = true)
     showItemIcons - show item icons by default? (default = true)
     okayCancel - Okay/Cancel vs. Close only (default = true => Okay/cancel)
     customFrame - a custom frame to show at the top of the icon selector window.  This is where
       the name editbox is located on the equipment set / macro replacement UIs.
  Basic window options:
     width - initial width of the window
     height - initial height of the window
     enableResize - enable resizing of the frame? (default = true)
     enableMove - enable moving of the frame? (default = true)
     headerText - title of the frame (default = L["Icon Browser"])
  Additional window customization:
     allowOffscreen - enables positioning of the window offscreen (default = false)
     minResizeWidth - minimum resize width (default = 300)
     minResizeHeight - minimum resize height (default = 200)
     anchorFrame - disables move / resize functionality while this frame is shown (default = nil)
     noCloseButton - remove the X button? (default = false)
     bgFile - override background texture, as passed to SetBackdrop()
     edgeFile - override edge texture, as passed to SetBackdrop()
     tile - override tile parameter for SetBackdrop()
     tileSize - override background tile size, as passed to SetBackdrop()
     edgeSize - override edge segment size, as passed to SetBackdrop()
     insets - override insets for the background texture, as passed to SetBackdrop()
     contentInsets - override insets for frame contents
     headerTexture - override texture used for the frame header
     headerWidth - override width of the frame header
     headerOffsetX / headerOffsetY - override offset of the header text
     headerFont - override font to use for the header text

========================================================================================

For the time being, the functionality provided by the library is intentionally
very limited.  Let me know if there's something you need to do that's not
possible with the current API.
