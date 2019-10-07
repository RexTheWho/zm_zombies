EditorWave = EditorWave or class(MissionScriptEditor)
function EditorWave:create_element()
	self.super.create_element(self)
	self._element.class = "ElementWave"
end

function EditorWave:_build_panel()
	self:_create_panel()
	self:BooleanCtrl("ending_check")
	self:BooleanCtrl("special_wave")
end
