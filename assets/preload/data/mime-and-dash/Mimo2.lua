dashIdle = true
function onCreate()
	makeAnimatedLuaSprite('dash', 'Characters/mimo_2', 229, 235);
	addAnimationByPrefix('dash', 'aplause', 'mimo 2 applause', 30, false);
	addAnimationByPrefix('dash', 'idle', 'mimo 2 idle', 30, false);
	addAnimationByPrefix('dash', 'singLEFT', 'mimo 2 left', 24, false);
	addAnimationByPrefix('dash', 'singDOWN', 'mimo 2 down', 24, false);
	addAnimationByPrefix('dash', 'singUP', 'mimo 2 up', 24, false);
	addAnimationByPrefix('dash', 'singRIGHT', 'mimo 2 rigth', 24, false);
	scaleObject('dash', 1.5, 1.5);
	objectPlayAnimation('dash', 'idle', true);
	addLuaSprite('dash', true);
setObjectOrder('dadGroup',getObjectOrder('dash'))
setProperty('dash.alpha', 1)

    idleOffsets = {'0', '0'}
    leftOffsets = {'44', '-9'}
    downOffsets = {'-48', '-103'}
    upOffsets = {'-27', '10'}
    rightOffsets = {'29', '-56'}
    applauseOffsets = {'56', '-27'}
    
end

local dashAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "MimoNote" then
	    dashIdle = false
		objectPlayAnimation('dash', dashAnims[direction + 1], false);

	if direction == 0 then
		setProperty('dash.offset.x', leftOffsets[1]);
		setProperty('dash.offset.y', leftOffsets[2]);
		objectPlayAnimation('dash', 'singLEFT', true);

    elseif direction == 1 then
		setProperty('dash.offset.x', downOffsets[1]);
		setProperty('dash.offset.y', downOffsets[2]);
		objectPlayAnimation('dash', 'singDOWN', true);

	elseif direction == 2 then
		setProperty('dash.offset.x', upOffsets[1]);
		setProperty('dash.offset.y', upOffsets[2]);
		objectPlayAnimation('dash', 'singUP', true);

	elseif direction == 3 then
		setProperty('dash.offset.x', rightOffsets[1]);
		setProperty('dash.offset.y', rightOffsets[2]);
		objectPlayAnimation('dash', 'singRIGHT', true);

	if isSustainNote then
		objectPlayAnimation('dash', dashAnims[direction + 1], true);
			end
		end
	end
end

-- come Mierda Nickobelit.
local dashAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('dash', 'idle');
		setProperty('dash.offset.x', idleOffsets[1]);
		setProperty('dash.offset.y', idleOffsets[2]);
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('dash', 'idle');
		setProperty('dash.offset.x', idleOffsets[1]);
		setProperty('dash.offset.y', idleOffsets[2]);
	end
end

function onStepHit()
if curStep == 251 then
    	objectPlayAnimation('dash', 'aplause', true);
    	
end
end