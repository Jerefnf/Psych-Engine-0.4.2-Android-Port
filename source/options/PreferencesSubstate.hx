package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Custom Options';
		rpcTitle = 'Visuals & UI Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Score Type:',                                                                  
			"¿Cuál debería ser el estilo de puntuación?",
                        'scoreType',
                        'string',
                        'Psych Engine',
                        ['Psych Engine', 'Kade Engine', 'Disabled']);
                addOption(option);

		var option:Option = new Option('Memory Counter',
			'indicador de cuanto llevas o vas gastando la memoria.',
                        'memoryCounter',
                        'bool',
                        true);
                addOption(option);
		option.onChange = onChangeMemoryCounter;

		var option:Option = new Option('Health Counter',
                        'Contador de Vida.',
                        'healthCounter',
                        'bool',
                        true);
                addOption(option);
		
		var option:Option = new Option('Time Bar:',
			"¿Qué debe mostrar la barra de tiempo?",
			'timeBarType',
			'string',
			'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);


		var option:Option = new Option('Judgements',
                        'Mostrador de Shits, Goods, Sicks y Bads total..',
                        'judgements',
                        'bool',
                        true);
                addOption(option);

		var option:Option = new Option('No Antimash',
                        'Desactivar Antimash, spam libre sin restricciones.',
                        'noAntimash',
                        'bool',
                        true);
                addOption(option);
		
		var option:Option = new Option('KE Timebar',
                        'Usar el estilo barra de Kade Engine.',
                        'keTimeBar',
                        'bool',
                        false);
                addOption(option);
		var option:Option = new Option('Health Bar Opacity',
			'¿Qué tan opacos deben ser la barra de salud y los íconos?.',
			'healthBarAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Arrows Opacity',
                        '¿Qué tan opacas deben ser las flechas?.',
			'arrowOpacity',
			'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
		option.decimals = 1;
                addOption(option);

		var option:Option = new Option('Lane Opacity',
                        '¿Qué tan opaco debe ser el Lane Underlay?.',
                        'laneOpacity',
                        'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
                option.decimals = 1;
                addOption(option);
		
		var option:Option = new Option('Enemy Lane Opacity',
                        'How Opaque should the opponent lane be.',
                        'opponentLaneOpacity',
                        'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
                option.decimals = 1;
                addOption(option);

                var option:Option = new Option('Enemy Arrows Opacity',
                        '¿Qué tan opacas deben ser las flechas del oponente?.',
                        'opponentArrowOpacity',
                        'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
                option.decimals = 1;
                addOption(option);

		var option:Option = new Option('FPS Counter',
			'Contador de FPS, fotogramas por segundo.',
			'showFPS',
			'bool',
			true);
		addOption(option);
		option.onChange = onChangeFPSCounter;

		super();
	}

	function onChangeFPSCounter()
	{
		if(Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.showFPS;
	}

	function onChangeMemoryCounter()
        {
                if(Main.memoryCounter != null)
                        Main.memoryCounter.visible = ClientPrefs.memoryCounter;
        }	
}