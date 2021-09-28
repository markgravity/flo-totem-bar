-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

-- Executed on load, calls general set-up functions
function FloBuffableTotemsButton_OnLoad(self)
end

function FloBuffableTotemsButton_UpdateBindings(self)
  if InCombatLockdown() then
		return;
	end

  ClearOverrideBindings(self);

  local key1, key2 = GetBindingKey("FLOBUFFABLETOTEMSBUTTON");

  if key1 then
    SetOverrideBindingClick(self, true, key1, self:GetName());
  end
  if key2 then
    SetOverrideBindingClick(self, true, key2, self:GetName());
  end

  self:SetAttribute('type', 'macro');
  FloBuffableTotemsButton_UpdateMarcro(self);
end


function FloBuffableTotemsButton_UpdateMarcro(self)
  self:SetScript("PreClick",function()
    FloBuffableTotemsButton_SetPreClick(self);
  end)
end

function FloBuffableTotemsButton_SetPreClick(self)

  if InCombatLockdown() then
    return;
  end

  local spells = FloLib_GetBuffableSpells();
  local macro = "/castsequence reset=combat/5 "

  for _, spell in ipairs(spells) do
    macro = macro .. spell.name .. ","
  end

  macro = macro .. "0";
  self:SetAttribute('macrotext', macro);
end
