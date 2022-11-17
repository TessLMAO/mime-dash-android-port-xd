function onCreate()
	
	addCharacterToList('gf-idol', 'gf')
	addCharacterToList('gf-idol', 'gf')
	
	makeLuaSprite('back', 'Stage/bg', -420, -139);
	setLuaSpriteScrollFactor('back', 1.0, 1.0);
	scaleObject('back', 1.24,1.24);
	
	makeLuaSprite('over', 'Stage/bullet-point', 0,0);
	setObjectCamera('over', 'hud');
	scaleObject('over', 2.0,2.0);
	
	makeLuaSprite('negro', 'blackscreen', 0,0);
	setObjectCamera('negro', 'hud');
	scaleObject('negro', 4.0,4.0);
	
	makeLuaSprite('cartel', 'Stage/sign', -420, -139);
	setLuaSpriteScrollFactor('cartel', 1.0, 1.0);
	scaleObject('cartel', 1.24,1.24);
	
	makeLuaText('sion', "Recreation By SION | Mod Masked", 0, 850, 20);
	setProperty('sion.alpha',0.45);
    setTextSize('sion',18);
    setTextFont("sion", "berkshireswash-regular.ttf")
    addLuaText('sion');
  
	addLuaSprite('back', false);
	addLuaSprite('cartel', false);
	addLuaSprite('over', false);
	addLuaSprite('negro', false);
end

function onEvent(name,value1,value2)
	if name == 'Sion' then 
		
		if value1 == 'inicio' then

       doTweenAlpha('negro', 'negro', 0, 1.5, 'currentBeat');

        end
        
        if value1 == 'final' then

         doTweenAlpha('negro', 'negro', 1, 4, 'currentBeat');

        
	end
end
end