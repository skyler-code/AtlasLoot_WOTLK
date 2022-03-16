--[[========================================================================================
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
    ========================================================================================]]

--[[========================================================================================
      Please notify me if you wish to make use of this library in your addon!
      I need to know for testing purposes - to make sure that any changes I make
      aren't going to break someone else's addon!
    ========================================================================================]]

local MAJOR_VERSION = "LibAdvancedIconSelector-1.0"
local MINOR_VERSION = 1

if not LibStub then error(MAJOR_VERSION .. " requires LibStub to operate") end
local lib = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end
local L = LibStub("AceLocale-3.0"):GetLocale(MAJOR_VERSION, true)
LibStub("AceTimer-3.0"):Embed(lib)
local private = { }

local DEBUG = false
function lib:Debug(...)
	if DEBUG then
		print("|cff00ff00[LAIS] [Debug]|r", ...)
	end
end

lib:Debug("Addon loaded.")

local ICON_WIDTH = 36
local ICON_HEIGHT = 36
local ICON_SPACING = 4	-- Minimum spacing between icons
local ICON_PADDING = 4	-- Padding around the icon display
local INITIATE_SEARCH_DELAY = 0.3	-- The delay between pressing a key and the start of the search
local SCAN_TICK = 0.1				-- The interval between each search "tick"
local SCAN_PER_SECOND = 1000		-- How many icons to scan per tick?

assert(INVSLOT_FIRST_EQUIPPED == 1)	-- (some code currently relies on this assumption)
local EQUIPPED_ICONS = INVSLOT_LAST_EQUIPPED
local MACRO_ICONS	-- DO NOT INITIALIZE HERE OR THIS ADDON WILL TAKE MORE THAN HALF A SECOND TO LOAD
local ITEM_ICONS	-- DO NOT INITIALIZE HERE OR THIS ADDON WILL TAKE MORE THAN HALF A SECOND TO LOAD

-- Not all prepositions, but should help with re-capitalization of keyword data
local PREPS = { a = true, an = true, ["and"] = true, by = true, de = true, from = true, ["in"] = true, of = true, on = true, the = true, to = true, ["vs."] = true }

function lib:Embed(addon)
	addon.CreateIconSelectorWindow = lib.CreateIconSelectorWindow
	addon.CreateIconSelectorFrame = lib.CreateIconSelectorFrame
end

-- See Docs\Readme.txt for a list of all supported options.
function lib:CreateIconSelectorWindow(name, parent, options)
	assert(name, "The icon selector window must have a name")
	if not options then options = { } end
	if not parent then parent = UIParent end
	
	local defaults = {
		width = 419,
		height = 343,
		enableResize = true,
		enableMove = true,
		showMacroIcons = true,
		showItemIcons = true,
		showMacroIconsBox = true,
		showItemIconsBox = true,
		okayCancel = true,
		minResizeWidth = 300,
		minResizeHeight = 200,
		insets = { left = 11, right = 11, top = 11, bottom = 10 },
		contentInsets = {
			left = 11 + 8, right = 11 + 8,
			top = 11 + 20, bottom = 10 + 8 },
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		tile = false,
		tileSize = 32,
		edgeSize = 32,
		headerWidth = 256,
		headerTexture = "Interface\\DialogFrame\\UI-DialogBox-Header",
		headerFont = "GameFontNormal",
		headerOffsetX = 0,
		headerOffsetY = -14,
		headerText = L["FRAME_TITLE"]
	}

	setmetatable(options, defaults)
	defaults.__index = defaults

	local frame = CreateFrame("Frame", name, parent)
	frame:Hide()
	frame:SetFrameStrata("MEDIUM")
	frame:SetSize(options.width, options.height)
	frame:SetMinResize(options.minResizeWidth, options.minResizeHeight)
	frame:SetToplevel(true)
	frame.options = options

	if options.customFrame then options.customFrame:SetParent(frame) end

	frame:SetBackdrop({
		edgeFile = options.edgeFile,
		bgFile = options.bgFile,
		tile = options.tile,
		tileSize = options.tileSize,
		edgeSize = options.edgeSize,
		insets = options.insets })

	if not options.noHeader then
		frame.header = frame:CreateTexture()
		frame.header:SetTexture(options.headerTexture)
		frame.header:SetWidth(options.headerWidth, 64)
		frame.header:SetPoint("TOP", 0, 12)

		frame.headerText = frame:CreateFontString()
		frame.headerText:SetFontObject(options.headerFont)
		frame.headerText:SetPoint("TOP", frame.header, "TOP", options.headerOffsetX, options.headerOffsetY)
		frame.headerText:SetText(options.headerText)
	end

	if not options.noCloseButton then
		frame.closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
		frame.closeButton:SetPoint("TOPRIGHT", 0, 0)

		frame.closeButton:SetScript("OnClick", function(...)
			if frame.OnCancel then
				frame:OnCancel(...)
			else
				frame:Hide()
			end
		end)
	end

	if options.enableResize then frame:SetResizable(true) end
	if options.enableMove then frame:SetMovable(true) end
	if not options.allowOffscreen then frame:SetClampedToScreen(true) end
	if options.enableResize or options.enableMove then frame:EnableMouse(true) end

	frame:RegisterForDrag("LeftButton")

	frame:SetScript("OnDragStart", function(frame, button)
		local x, y = frame.mouseDownX, frame.mouseDownY
		if x and y then
			local scale = UIParent:GetEffectiveScale()
			x = x / scale
			y = y / scale
			y = (y - frame:GetBottom()) * scale
			x = (frame:GetRight() - x) * scale

			-- (set anchorTo if you want your frame to conditionally be moveable / resizeable)
			if not options.anchorFrame or not options.anchorFrame:IsShown() then
				if options.enableResize and x < 20 and y < 20 then
					frame:StartSizing()
				elseif options.enableMove then
					frame:StartMoving()
				end
			end
		end
	end)
	
	frame:SetScript("OnDragStop", function(frame, button)
		frame:StopMovingOrSizing()
	end)

	frame:SetScript("OnMouseDown", function(frame, button)
		if button == "LeftButton" then
			frame.mouseDownX, frame.mouseDownY = GetCursorPosition()
		end
	end)

	frame:SetScript("OnMouseUp", function(frame, button)
		if button == "LeftButton" then
			frame.mouseDownX, frame.mouseDownY = nil, nil
		end
	end)

	frame.iconsFrame = lib:CreateIconSelectorFrame(name .. "_IconsFrame", frame, options)
	frame.iconsFrame:ShowEquippedIcons(options.showEquippedIcons)
	frame.iconsFrame:ShowMacroIcons(options.showMacroIcons)
	frame.iconsFrame:ShowItemIcons(options.showItemIcons)

	frame.searchLabel = frame:CreateFontString()
	frame.searchLabel:SetFontObject("GameFontNormal")
	frame.searchLabel:SetText(L["Search:"])
	frame.searchLabel:SetHeight(22)

	frame.searchBox = CreateFrame("EditBox", name .. "_SearchBox", frame, "InputBoxTemplate")
	frame.searchBox:SetAutoFocus(false)
	frame.searchBox:SetHeight(22)
	frame.searchBox:SetScript("OnTextChanged", function(editBox, userInput)
		if userInput then
			frame.iconsFrame:SetSearchParameter(editBox:GetText())
		end
	end)

	frame.cancelButton = CreateFrame("Button", name .. "_Cancel", frame, "UIPanelButtonTemplate")
	if options.okayCancel then
		frame.cancelButton:SetText(L["Cancel"])
	else
		frame.cancelButton:SetText(L["Close"])
	end
	frame.cancelButton:SetSize(78, 22)
	frame.cancelButton:SetScript("OnClick", function(...)
		if frame.OnCancel then
			frame:OnCancel(...)
		else
			frame:Hide()
		end
	end)

	if options.okayCancel then
		frame.okButton = CreateFrame("Button", name .. "_OK", frame, "UIPanelButtonTemplate")
		frame.okButton:SetText(L["Okay"])
		frame.okButton:SetSize(78, 22)
		frame.okButton:SetScript("OnClick", function(...)
			if frame.OnOkay then
				frame:OnOkay(...)
			end
		end)
	end

	frame.AIS_SetScript = frame.SetScript
	function frame:SetScript(scriptType, handler)
		if scriptType == "OnOkayClicked" then
			self.OnOkay = handler
		elseif scriptType == "OnCancelClicked" then	-- hook for icon keyword editor button overlays
			self.OnCancel = handler
		else
			self:AIS_SetScript(scriptType, handler)
		end
	end

	if options.showEquippedIconsBox then
		frame.equippedIconsButton = CreateFrame("CheckButton", name .. "_EquippedIcons", frame, "UICheckButtonTemplate")
		_G[name .. "_EquippedIconsText"]:SetText(L["Equipped icons"])
		frame.equippedIconsButton:SetChecked(frame.iconsFrame.showEquippedIcons)
		frame.equippedIconsButton:SetSize(24, 24)
		frame.equippedIconsButton:SetScript("OnClick", function(button, mouseButton, down)
			frame.iconsFrame:ShowEquippedIcons(button:GetChecked())
		end)
	end

	if options.showMacroIconsBox then
		frame.macroIconsButton = CreateFrame("CheckButton", name .. "_MacroIcons", frame, "UICheckButtonTemplate")
		_G[name .. "_MacroIconsText"]:SetText(L["Macro icons"])
		frame.macroIconsButton:SetChecked(frame.iconsFrame.showMacroIcons)
		frame.macroIconsButton:SetSize(24, 24)
		frame.macroIconsButton:SetScript("OnClick", function(button, mouseButton, down)
			frame.iconsFrame:ShowMacroIcons(button:GetChecked())
		end)
	end

	if options.showItemIconsBox then
		frame.itemIconsButton = CreateFrame("CheckButton", name .. "_ItemIcons", frame, "UICheckButtonTemplate")
		_G[name .. "_ItemIconsText"]:SetText(L["Item icons"])
		frame.itemIconsButton:SetChecked(frame.iconsFrame.showItemIcons)
		frame.itemIconsButton:SetSize(24, 24)
		frame.itemIconsButton:SetScript("OnClick", function(button, mouseButton, down)
			frame.iconsFrame:ShowItemIcons(button:GetChecked())
		end)
	end

	frame:SetScript("OnSizeChanged", private.OnWindowSizeChanged)

	return frame
end

function private.OnWindowSizeChanged(frame, width, height)
	local spacing = 4
	local options = frame.options
	local contentInsets = options.contentInsets

	if options.customFrame then
		options.customFrame:SetPoint("TOPLEFT", contentInsets.left, -contentInsets.top)
		options.customFrame:SetPoint("RIGHT", -contentInsets.right, 0)
		frame.iconsFrame:SetPoint("TOPLEFT", options.customFrame, "BOTTOMLEFT", 0, -spacing)
	else
		frame.iconsFrame:SetPoint("TOPLEFT", contentInsets.left, -contentInsets.top)
	end
	frame.iconsFrame:SetPoint("RIGHT", -contentInsets.right, 0)
	frame.cancelButton:SetPoint("BOTTOMRIGHT", -contentInsets.right, contentInsets.bottom)
	if frame.okButton then
		frame.okButton:SetPoint("BOTTOMRIGHT", frame.cancelButton, "BOTTOMLEFT", -2, 0)
	end
	frame.searchLabel:SetPoint("BOTTOMLEFT", contentInsets.left, contentInsets.bottom)
	frame.searchBox:SetPoint("LEFT", frame.searchLabel, "RIGHT", 6, 0)
	frame.searchBox:SetPoint("RIGHT", frame.okButton or frame.cancelButton, "LEFT", -spacing, 0)

	local lastButton = nil
	if frame.equippedIconsButton then
		frame.equippedIconsButton:SetPoint("BOTTOMLEFT", frame.searchLabel, "TOPLEFT", -2, 0)
		lastButton = frame.equippedIconsButton
	end

	if frame.macroIconsButton then
		if lastButton then
			frame.macroIconsButton:SetPoint("LEFT", _G[lastButton:GetName() .. "Text"], "RIGHT", 2, 0)
		else
			frame.macroIconsButton:SetPoint("BOTTOMLEFT", frame.searchLabel, "TOPLEFT", -2, 0)
		end
		lastButton = frame.macroIconsButton
	end

	if frame.itemIconsButton then
		if lastButton then
			frame.itemIconsButton:SetPoint("LEFT", _G[lastButton:GetName() .. "Text"], "RIGHT", 2, 0)
		else
			frame.itemIconsButton:SetPoint("BOTTOMLEFT", frame.searchLabel, "TOPLEFT", -2, 0)
		end
		lastButton = frame.itemIconsButton
	end

	if lastButton then
		frame.iconsFrame:SetPoint("BOTTOM", lastButton, "TOP", 0, spacing)
	else
		frame.iconsFrame:SetPoint("BOTTOM", frame.cancelButton, "TOP", 0, spacing)
	end
end

-- See Docs\Readme.txt for a list of all supported options.
function lib:CreateIconSelectorFrame(name, parent, options)
	assert(name, "The icon selector frame must have a name")
	if not options then options = { } end

	-- To prevent slow loading time, don't force WoW to traverse the icons directory until an
	-- icon selector is actually created.
	if not MACRO_ICONS then
		MACRO_ICONS = GetNumMacroIcons()
		ITEM_ICONS = GetNumMacroItemIcons()
	end

	local defaults = {
		showMacroIcons = true,
		showItemIcons = true
	}

	if options.__index then
		setmetatable(options.__index, defaults)
	else
		setmetatable(options, defaults)
	end
	defaults.__index = defaults
	
	local iconsFrame = CreateFrame("Frame", name, parent)
	iconsFrame.scrollOffset = 0
	iconsFrame.iconsX = 1
	iconsFrame.iconsY = 1
	iconsFrame.fauxResults = 0	-- (fake results to keep top-left icon stationary when resizing)
	iconsFrame.searchResults = { }
	iconsFrame.icons = { }
	iconsFrame.showEquippedIcons = options.showEquippedIcons
	iconsFrame.showMacroIcons = options.showMacroIcons
	iconsFrame.showItemIcons = options.showItemIcons
	iconsFrame.showDynamic = options.showDynamic

	iconsFrame:SetScript("OnSizeChanged", private.OnIconsFrameSizeChanged)

	iconsFrame:SetScript("OnShow", function(self)
		-- Call the BeforeShow handler, which is an excellent time to load a keyword library.
		if iconsFrame.BeforeShow then iconsFrame:BeforeShow() end

		-- Every time the frame is displayed, look up the most recent keywords library.
		self.keywordsLib = LibStub("LibAdvancedIconSelector-KeywordData-1.0", true)

		private.RestartSearch(self)
	end)

	-- Create the scroll bar
	iconsFrame.scrollFrame = CreateFrame("ScrollFrame", name .. "_ScrollFrame", iconsFrame, "FauxScrollFrameTemplate")
	iconsFrame.scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
		if offset == 0 then iconsFrame.fauxResults = 0 end	-- Remove all faux results when the top of the list is hit.
		FauxScrollFrame_OnVerticalScroll(iconsFrame.scrollFrame, offset, ICON_HEIGHT + ICON_SPACING, iconsFrame.UpdateScrollFrame)
	end)

	-- Create the internal frame to display the icons
	iconsFrame.internalFrame = CreateFrame("Frame", name .. "_Internal", iconsFrame)
	iconsFrame.internalFrame.parent = iconsFrame
	iconsFrame.internalFrame:SetScript("OnSizeChanged", private.OnInternalFrameSizeChanged)

	-- When the frame is hidden, release all icon textures.
	iconsFrame.internalFrame:SetScript("OnHide", function(self)
		for i = 1, #iconsFrame.icons do
			local button = iconsFrame.icons[i]
			if button then
				button:SetNormalTexture(nil)
			end
		end
	end)

	-- This is called when vertically scrolled, or the icons frame is resized.
	function iconsFrame.UpdateScrollFrame()
		local maxLines = ceil((iconsFrame.fauxResults + #iconsFrame.searchResults + (iconsFrame.searchFinished and 0 or 1)) / iconsFrame.iconsX)
		local displayedLines = iconsFrame.iconsY
		local lineHeight = ICON_HEIGHT + ICON_SPACING
		FauxScrollFrame_Update(iconsFrame.scrollFrame, maxLines, displayedLines, lineHeight)

		iconsFrame.scrollOffset = FauxScrollFrame_GetOffset(iconsFrame.scrollFrame)

		-- Update the icon display to match the new scroll offset
		private.UpdateIcons(iconsFrame)
	end

	-- Call this to filter the search results!
	function iconsFrame:SetSearchParameter(searchText)
		self.searchParameter = searchText
		if self.initiateSearchTimer then lib:CancelTimer(self.initiateSearchTimer) end
		self.initiateSearchTimer = lib:ScheduleTimer(private.OnInitiateSearchTimerElapsed, INITIATE_SEARCH_DELAY, self)
	end

	-- Changes whether equipped icons are displayed
	function iconsFrame:ShowEquippedIcons(b)
		self.showEquippedIcons = b
		private.RestartSearch(self)
	end

	-- Changes whether macro icons are displayed
	function iconsFrame:ShowMacroIcons(b)
		self.showMacroIcons = b
		private.RestartSearch(self)
	end

	-- Changes whether item icons are displayed
	function iconsFrame:ShowItemIcons(b)
		self.showItemIcons = b
		private.RestartSearch(self)
	end

	-- Sets the selection to the given texture (will be delayed)
	function iconsFrame:SetSelectionByName(texture)
		private.SetSelectedIcon(self, nil)
		self.initialSelection = texture
		if texture then
			self.firstScan = true
			private.RestartSearch(self)
		else
			private.UpdateIcons(self)
		end
	end

	-- Returns id, kind, texture of the icon that is selected.
	function iconsFrame:GetSelectedIconInfo()
		return private.GetInfo(self.selectedID)
	end

	iconsFrame.AIS_SetScript = iconsFrame.SetScript
	function iconsFrame:SetScript(scriptType, handler)
		if scriptType == "OnSelectedIconChanged" then
			self.OnSelectedIconChanged = handler
		elseif scriptType == "OnButtonUpdated" then	-- hook for icon keyword editor button overlays
			self.OnButtonUpdated = handler
		elseif scriptType == "BeforeShow" then
			self.BeforeShow = handler
		else
			self:AIS_SetScript(scriptType, handler)
		end
	end

	-- Selects the next icon.  Used by icon keyword editor. (NOT intended for external use, as it doesn't take current search filter into account)
	function iconsFrame:SelectNextIcon()
		if self.selectedID then
			private.SetSelectedIcon(iconsFrame, private.Skip(self.selectedID + 1, iconsFrame.showEquippedIcons, iconsFrame.showMacroIcons, iconsFrame.showItemIcons))
			private.UpdateIcons(iconsFrame)
		end
	end

	-- Start the search for icons
	iconsFrame:SetSearchParameter(nil)
	
	return iconsFrame
end

function private.OnIconsFrameSizeChanged(iconsFrame, width, height)
	iconsFrame.scrollFrame:SetPoint("TOP", iconsFrame)
	iconsFrame.scrollFrame:SetPoint("BOTTOMRIGHT", iconsFrame, -21, 0)

	iconsFrame.internalFrame:SetPoint("TOPLEFT", iconsFrame)
	iconsFrame.internalFrame:SetPoint("BOTTOMRIGHT", iconsFrame, -16, 0)
end

function private.OnInternalFrameSizeChanged(internalFrame, width, height)
	local iconsFrame = internalFrame.parent

	local oldFirstIcon = 1 + iconsFrame.scrollOffset * iconsFrame.iconsX - iconsFrame.fauxResults
	iconsFrame.iconsX = floor((floor(width + 0.5) - 2 * ICON_PADDING + ICON_SPACING) / (ICON_WIDTH + ICON_SPACING))
	iconsFrame.iconsY = floor((floor(height + 0.5) - 2 * ICON_PADDING + ICON_SPACING) / (ICON_HEIGHT + ICON_SPACING))

	-- Center the icons
	local leftPadding = (width - 2 * ICON_PADDING - (iconsFrame.iconsX * (ICON_WIDTH + ICON_SPACING) - ICON_SPACING)) / 2
	local topPadding = (height - 2 * ICON_PADDING - (iconsFrame.iconsY * (ICON_HEIGHT + ICON_SPACING) - ICON_SPACING)) / 2

	local lastIconY = nil
	for y = 1, iconsFrame.iconsY do
		local lastIconX = nil
		for x = 1, iconsFrame.iconsX do
			local i = (y - 1) * iconsFrame.iconsX + x

			-- Create the button if it doesn't exist (but don't set its normal texture yet)
			local button = iconsFrame.icons[i]
			if not button then
				button = CreateFrame("CheckButton", nil, iconsFrame.internalFrame)
				iconsFrame.icons[i] = button
				button:SetSize(36, 36)
				button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
				button:SetCheckedTexture("Interface\\Buttons\\CheckButtonHilight")

				button:SetScript("OnClick", function(button, mouseButton, down)
					if button.textureKind and button.textureID then
						if iconsFrame.selectedButton then
							iconsFrame.selectedButton:SetChecked(false)
						end
						button:SetChecked(true)
						iconsFrame.selectedButton = button
						private.SetSelectedIcon(iconsFrame, button.globalID)
					else
						button:SetChecked(false)
					end
				end)
				
				button:SetScript("OnEnter", function(button, motion)
					if button.texture then
						local keywordString = private.LookupKeywords(iconsFrame, button.texture)
						local keywords = private.GetTaggedStrings(keywordString, nil)
						local spells = private.GetTaggedStrings(keywordString, "spell")

						GameTooltip:SetOwner(button, "ANCHOR_TOPRIGHT")
						GameTooltip:ClearLines()
						if button.textureKind == "Equipped" then
							GameTooltip:AddDoubleLine(NORMAL_FONT_COLOR_CODE .. L["Equipped item texture:"] .. FONT_COLOR_CODE_CLOSE, GRAY_FONT_COLOR_CODE .. tostring(button.textureID) .. FONT_COLOR_CODE_CLOSE)
						elseif button.textureKind == "Macro" then
							GameTooltip:AddDoubleLine(NORMAL_FONT_COLOR_CODE .. L["Macro texture:"] .. FONT_COLOR_CODE_CLOSE, GRAY_FONT_COLOR_CODE .. tostring(button.textureID) .. FONT_COLOR_CODE_CLOSE)
						elseif button.textureKind == "Item" then
							GameTooltip:AddDoubleLine(NORMAL_FONT_COLOR_CODE .. L["Item texture:"] .. FONT_COLOR_CODE_CLOSE, GRAY_FONT_COLOR_CODE .. tostring(button.textureID) .. FONT_COLOR_CODE_CLOSE)
						end
						GameTooltip:AddLine(tostring(button.texture), 1, 1, 1)
						private.AddTaggedInformationToTooltip(keywordString, "spell", L["Spell: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "companion", L["Companion: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "mount", L["Mount: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "talent", L["Talent: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "tab", L["Tab: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "passive", L["Passive: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "racial", L["Racial: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "racial_passive", L["Racial Passive: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "mastery", L["Mastery: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "professions", L["Professions: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "pet_command", L["Pet Command: "], NORMAL_FONT_COLOR)
						private.AddTaggedInformationToTooltip(keywordString, "pet_stance", L["Pet Stance: "], NORMAL_FONT_COLOR)
						if keywords and strlen(keywords) > 0 then
							GameTooltip:AddLine(GRAY_FONT_COLOR_CODE .. L["Additional keywords: "] .. tostring(keywords) .. FONT_COLOR_CODE_CLOSE, 1, 1, 1, true)
						end
						GameTooltip:Show()
					end
				end)

				button:SetScript("OnLeave", function(button, motion)
					GameTooltip:Hide()
				end)
			end
			button:Show()	-- (yes, this is necessary; we hide excess buttons)

			if not lastIconX then
				if not lastIconY then
					button:SetPoint("TOPLEFT", iconsFrame.internalFrame, leftPadding + ICON_PADDING, -topPadding - ICON_PADDING)
				else
					button:SetPoint("TOPLEFT", lastIconY, "BOTTOMLEFT", 0, -ICON_SPACING)
				end
				lastIconY = button
			else
				button:SetPoint("TOPLEFT", lastIconX, "TOPRIGHT", ICON_SPACING, 0)
			end
			
			lastIconX = button
		end
	end

	-- Hide any excess buttons.  Release the textures, but keep the buttons 'til the window is closed.
	for i = iconsFrame.iconsY * iconsFrame.iconsX + 1, #iconsFrame.icons do
		button = iconsFrame.icons[i]
		if button then
			button:SetNormalTexture(nil)
			button:Hide()
		end
	end
	
	-- Add padding at the top to make the old and new first icon constant
	local newFirstIcon = 1 + iconsFrame.scrollOffset * iconsFrame.iconsX - iconsFrame.fauxResults
	iconsFrame.fauxResults = iconsFrame.fauxResults + newFirstIcon - oldFirstIcon

	-- Increase faux results if below 0
	if iconsFrame.fauxResults < 0 then
		local scrollDown = -ceil((iconsFrame.fauxResults + 1) / iconsFrame.iconsX) + 1	-- careful!  Lots of OBOBs here if not done right.
		iconsFrame.fauxResults = iconsFrame.fauxResults + scrollDown * iconsFrame.iconsX
		assert(iconsFrame.fauxResults >= 0)
		local newOffset = max(FauxScrollFrame_GetOffset(iconsFrame.scrollFrame) + scrollDown, 0)
		FauxScrollFrame_SetOffset(iconsFrame.scrollFrame, newOffset)
	end
	
	-- Decrease faux results if above iconsX
	if iconsFrame.fauxResults > iconsFrame.iconsX and iconsFrame.iconsX > 0 then
		local scrollUp = floor(iconsFrame.fauxResults / iconsFrame.iconsX)
		iconsFrame.fauxResults = iconsFrame.fauxResults - scrollUp * iconsFrame.iconsX
		assert(iconsFrame.fauxResults < iconsFrame.iconsX)
		local newOffset = max(FauxScrollFrame_GetOffset(iconsFrame.scrollFrame) - scrollUp, 0)
		FauxScrollFrame_SetOffset(iconsFrame.scrollFrame, newOffset)
	end

	iconsFrame.UpdateScrollFrame()
end

function private.UpdateIcons(iconsFrame)
	if iconsFrame:IsShown() then
		local firstIcon = 1 + iconsFrame.scrollOffset * iconsFrame.iconsX - iconsFrame.fauxResults
		local last = iconsFrame.iconsX * iconsFrame.iconsY
	
		if iconsFrame.selectedButton then
			iconsFrame.selectedButton:SetChecked(false)
			iconsFrame.selectedButton = nil
		end

		for i = 1, last do
			local button = iconsFrame.icons[i]
			if button then
				local resultIndex = firstIcon + i - 1
				if iconsFrame.searchResults[resultIndex] then
					button.globalID = iconsFrame.searchResults[resultIndex]
					button.textureID, button.textureKind, button.texture = private.GetInfo(button.globalID)
					if button.globalID == iconsFrame.selectedID then
						button:SetChecked(true)
						iconsFrame.selectedButton = button
					end

					if iconsFrame.showDynamic then
						if button.globalID == EQUIPPED_ICONS + 1 then
							if not button.dynamicText then
								button.dynamicText = button:CreateFontString()
								button.dynamicText:SetFontObject("GameFontNormalSmall")
								button.dynamicText:SetPoint("BOTTOM", button, "BOTTOM", 0, 2)
								button.dynamicText:SetText("(dynamic)")
							end
							button.dynamicText:Show()
						else
							if button.dynamicText then button.dynamicText:Hide() end
						end
					end
				else
					button.globalID = nil
					button.textureID = nil
					button.texture = nil
					button.textureKind = nil
					button:SetChecked(false)
				end
				button:SetNormalTexture(button.texture)

				-- Hook for the icon keyword editor
				if iconsFrame.OnButtonUpdated then iconsFrame.OnButtonUpdated(button) end
			end
		end
	end
end

-- This function makes up for LUA's primitive string matching support and replaces all occurrances of a word
-- in a string, regardless of whether it's at the beginning, middle, or end.  This is extremely inefficient, so you
-- should only do it once: when the search parameter changes.
function private.ReplaceWord(str, word, replacement)
	str = gsub(str, "^" .. word .. "$", replacement)			-- (entire string)
	str = gsub(str, "^" .. word .. " ", replacement .. " ")		-- (beginning of string)
	str = gsub(str, " " .. word .. "$", " " .. replacement)		-- (end of string)
	repeat
		str, n = gsub(str, " " .. word .. " ", " " .. replacement .. " ")	-- (middle of string)
	until not n or n == 0
	return str
end

-- Lowercases a string, but preserves the case of any characters after a %.
function private.StrlowerPattern(str)
	local lastE = -1	-- (since -1 + 2 = 1)
	local result = ""

	repeat
		local s, e = strfind(str, "%", lastE + 2, true)
		if e then
			local nextLetter = strsub(str, e + 1, e + 1)
			result = result .. strlower(strsub(str, lastE + 2, e - 1)) .. "%" .. nextLetter
		else
			result = result .. strlower(strsub(str, lastE + 2))
		end
		lastE = e
	until not e
	return result
end

-- Coerces the search parameter to something useable.  Replaces NOT with !, etc.
function private.FixSearchParameter(parameter)
	-- Instantly fail if there's NOT NOT, AND AND, or OR OR in the pattern.  These are unsupported due to LUA's relatively primitive string matching.

	-- Trim the parameter
	parameter = strtrim(parameter)

	-- Lowercase the string except for stuff after % signs. (since you can search by pattern)
	parameter = private.StrlowerPattern(parameter)

	-- Replace all "NOT" with !
	parameter = private.ReplaceWord(parameter, "not", "!")

	-- Replace all "AND" with ,
	parameter = private.ReplaceWord(parameter, "and", " ")

	-- Replace all "OR" with ;
	parameter = private.ReplaceWord(parameter, "or", ";")

	-- Join any !s to the word that follows it. (but only if the ! is standing on it's own)
	repeat
		local n1, n2
		parameter, n1 = gsub(parameter, "^(!+) +", "%1")
		parameter, n2 = gsub(parameter, " (!+) +", " %1")
	until n1 == 0 and n2 == 0

	-- Get rid of quotes; they have no meaning as of now and are used only to allow searching for "AND", "OR", and "NOT".
	parameter = gsub(parameter, '"+', "")

	-- Finally, get rid of any extra spaces
	parameter = gsub(strtrim(parameter), "  +", " ")

	return parameter
end

function private.OnInitiateSearchTimerElapsed(iconsFrame)
	iconsFrame.initiateSearchTimer = nil	-- single-shot timer handles become invalid IMMEDIATELY after elapsed

	-- Parse the search parameter
	if iconsFrame.searchParameter then
		local tmp = private.FixSearchParameter(iconsFrame.searchParameter)
		local parts = { strsplit(";", tmp) }
		for i = 1, #parts do
			local tmp = strtrim(parts[i])
			parts[i] = { }
			for v in gmatch(tmp, "[^ ,]+") do
				tinsert(parts[i], v)
			end
		end
		iconsFrame.parsedParameter = parts
	else
		iconsFrame.parsedParameter = nil
	end

	private.RestartSearch(iconsFrame)
end

function private.RestartSearch(iconsFrame)
	wipe(iconsFrame.searchResults)
	iconsFrame.searchFinished = false
	iconsFrame.searchIndex = 0
	iconsFrame.updateNeeded = true
	if not iconsFrame.searchTimer then
		iconsFrame.searchTimer = lib:ScheduleRepeatingTimer(private.OnSearchTick, SCAN_TICK, iconsFrame)
	end
end

-- Returns true if the given texture / keywords matches the search parameter
function private.Matches(texture, keywords, parameter)
	if not parameter then return true end
	texture = strlower(texture)
	keywords = keywords and strlower(keywords)
	for i = 1, #parameter do		-- OR parameters
		local p_i = parameter[i]
		local termFailed = false
		
		for j = 1, #p_i do			-- AND parameters
			local s = p_i[j]
			if #s > 0 then
				local xor = 0
				local plainText = true

				while strsub(s, 1, 1) == "!" do	-- ! indicates negation of this term
					s = strsub(s, 2)
					xor = bit.bxor(xor, 1)
				end

				if strsub(s, 1, 1) == "=" then	-- = indicates pattern matching for this term
					s = strsub(s, 2)
					plainText = false
				end

				local ok1, result1 = pcall(strfind, texture, s, 1, plainText)
				local result2 = false
				if keywords then _, result2 = pcall(strfind, keywords, s, 1, plainText) end
				if not ok1 or bit.bxor((result1 or result2) and 1 or 0, xor) == 0 then
					termFailed = true
					break
				end
			end
		end

		if not termFailed then
			return true
		end
	end
end

function private.OnSearchTick(iconsFrame)
	for entriesScanned = 0,SCAN_PER_SECOND do
		iconsFrame.searchIndex = iconsFrame.searchIndex + 1
		iconsFrame.searchIndex = private.Skip(iconsFrame.searchIndex, iconsFrame.showEquippedIcons, iconsFrame.showMacroIcons, iconsFrame.showItemIcons)

		if not iconsFrame.searchIndex or not iconsFrame:IsVisible() then
			lib:CancelTimer(iconsFrame.searchTimer)
			iconsFrame.searchTimer = nil  -- timer handles are invalid once canceled
			iconsFrame.searchFinished = true
			lib:Debug("Found " .. #iconsFrame.searchResults .. " results")
			break
		end

		local id, kind, texture = private.GetInfo(iconsFrame.searchIndex)
		if iconsFrame.firstScan then
			-- Cancel the scan for the selected item if something's already been selected by the user.
			if iconsFrame.selectedID then
				iconsFrame.firstScan = false
			-- Otherwise, cancel it only if we find the texture we're looking for.
			elseif texture == iconsFrame.initialSelection then
				lib:Debug("Found selected texture at global index", iconsFrame.searchIndex)
				private.SetSelectedIcon(iconsFrame, iconsFrame.searchIndex)
				iconsFrame.firstScan = false		-- Don't need to search for selected item anymore
			end
		end
		
		if texture then
			local keywordString = private.LookupKeywords(iconsFrame, texture)
			if private.Matches(texture, keywordString, iconsFrame.parsedParameter) then
				tinsert(iconsFrame.searchResults, iconsFrame.searchIndex)
				iconsFrame.updateNeeded = true
			end
		end
	end

	if iconsFrame.updateNeeded then
		iconsFrame.updateNeeded = false
		iconsFrame.UpdateScrollFrame()
		private.UpdateIcons(iconsFrame)
	end
end

-- Returns the given global ID after skipping the designated categories, or nil if past the max global id.
function private.Skip(id, includeEquipped, includeMacros, includeItems)
	local origID = id
	
	if not id or id < 1 then
		return nil
	end

	if id >= 1 and id <= EQUIPPED_ICONS and not includeEquipped then
		return private.Skip(EQUIPPED_ICONS + 1, includeEquipped, includeMacros, includeItems)
	end

	id = id - EQUIPPED_ICONS
	if id >= 1 and id <= MACRO_ICONS and not includeMacros then
		return private.Skip(EQUIPPED_ICONS + MACRO_ICONS + 1, includeEquipped, includeMacros, includeItems)
	end

	id = id - MACRO_ICONS
	if id >= 1 and id <= ITEM_ICONS and not includeItems then
		return private.Skip(EQUIPPED_ICONS + MACRO_ICONS + ITEM_ICONS + 1, includeEquipped, includeMacros, includeItems)
	end

	id = id - ITEM_ICONS
	if id >= 1 then
		return nil
	end

	return origID
end

-- Returns id, kind, texture given a global id.  Returns nil if past the max global id.
function private.GetInfo(id)
	if not id or id < 1 then
		return nil
	end

	if id <= EQUIPPED_ICONS then
		return id, "Equipped", GetInventoryItemTexture("player", id)
	end
	
	id = id - EQUIPPED_ICONS
	if id <= MACRO_ICONS then
		return id, "Macro", GetMacroIconInfo(id)
	end
	
	id = id - MACRO_ICONS
	if id <= ITEM_ICONS then
		return id, "Item", GetMacroItemIconInfo(id)
	end

	return nil
end

function private.SetSelectedIcon(iconsFrame, globalID)
	iconsFrame.selectedID = globalID	-- (nil is okay)
	if iconsFrame.OnSelectedIconChanged then
		iconsFrame:OnSelectedIconChanged()
	end
end

-- Default keyword lookup function
function private.LookupKeywords(iconsFrame, texture)
	if iconsFrame.keywordsLib then
		return iconsFrame.keywordsLib:GetKeywords(texture)
	end
end

-- Returns the strings that have the given tag (filters out the tags if nil)
function private.GetTaggedStrings(str, tag)
	if not str then return nil end
	if not tag then
		return gsub(str, "[^ ]+:[^ ]+[ ]*", "")
	else
		local result = nil	-- (nil is by far the most common result - so don't return an empty table)
		for match in gmatch(" " .. str, " " .. tag .. ":([^ ]+)") do if not result then result = { match } else tinsert(result, match) end end
		return result
	end
end

-- Re-capitalizes each word of a string, excluding certain prepositions.  This is needed 'cause
-- all keyword data is lowercase (for quick searching).
function private.Capitalize(str)
	local s, e = 0, 0
	repeat
		s, e, cap = strfind(str, "([^ %-%.%(%)]+)[ %-%.%(%)]*", e + 1)
		if e then
			if s == 1 or not PREPS[cap] then
				str = strsub(str, 1, s - 1) .. strupper(strsub(str, s, s)) .. strsub(str, s + 1)
			end
		end
	until not e
	return str
end

-- Converts a keyword string like "ice_lance(mage)" into "Ice Lance (Mage)", r, g, b
function private.MakeSpellTooltipString(str, defaultColor)
	str = gsub(str, "_", " ")	-- Re-insert spaces
	local spellName, className = strmatch(str, "^(.+)%(([^%)]+)%)$")
	if not className then spellName = str end	-- Sometimes class isn't specified.
	if spellName then
		-- Capitalize the first letter of each word, excluding certain prepositions.
		spellName = private.Capitalize(spellName)

		if className then	-- (note: class name is sometimes also a profession name, race name, etc.)
			className = private.Capitalize(className)
			local classColorIndex = strupper(className)
			if classColorIndex == "DEATH KNIGHT" then classColorIndex = "DEATHKNIGHT" end
			local classColor = RAID_CLASS_COLORS[classColorIndex]
			if classColor then
				return spellName .. " (" .. className .. ")", classColor.r, classColor.g, classColor.b
			else
				return spellName .. " (" .. className .. ")", defaultColor.r, defaultColor.g, defaultColor.b	-- invalid / multiple classes
			end
		end
		return spellName, defaultColor.r, defaultColor.g, defaultColor.b
	end
end

function private.AddTaggedInformationToTooltip(keywordString, tag, tooltipTag, defaultColor)
	local spellNames = private.GetTaggedStrings(keywordString, tag)
	if spellNames then
		for _,spellBundle in ipairs(spellNames) do
			local spellName, classR, classG, classB = private.MakeSpellTooltipString(spellBundle, defaultColor)
			GameTooltip:AddLine(tooltipTag .. tostring(spellName), classR, classG, classB, false)
		end
	end
end
