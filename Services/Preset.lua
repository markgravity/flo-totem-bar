FTB.Lib.Preset = {};
local Preset = FTB.Lib.Preset;

function Preset.Create(name)
	local active = FLOTOTEMBAR_OPTIONS.active;

	-- Preset name is existed
	if FLOTOTEMBAR_OPTIONS[active.spec][name] ~= nil then
		Preset.ShowAlertPopup(Preset._NAME_EXISTED_MESSAGE);
		return;
	end

	FLOTOTEMBAR_OPTIONS[active.spec][name] = FLOTOTEMBAR_OPTIONS_DEFAULT[1]["Default"];
	Preset.Change(self, name);
end

function Preset.Delete()
	local active = FLOTOTEMBAR_OPTIONS.active;
 	local options = {};

	for name, option in pairs(FLOTOTEMBAR_OPTIONS[active.spec]) do
		if name ~= active.preset then
			options[name] = option;
		end
	end

	FLOTOTEMBAR_OPTIONS[active.spec] = options;
	FLOTOTEMBAR_OPTIONS.active.preset = "Default";
	Preset.Change(self, "Default");
end

function Preset.ShowCreatePopup(self)
	StaticPopup_Show("Preset._CREATE");
end

function Preset.ShowDeletePopup(self)
	StaticPopup_Show("Preset._CREATE_CONFIRM_DELETE", FLOTOTEMBAR_OPTIONS.active.preset);
end

function Preset.Change(self, name)
	FLOTOTEMBAR_OPTIONS.active.preset = name;
	FloTotemBar_TalentGroupChanged(FLOTOTEMBAR_OPTIONS.active);
end
