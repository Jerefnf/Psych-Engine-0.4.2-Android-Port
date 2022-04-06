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
		title = 'Visuals and UI';
		rpcTitle = 'Visuals & UI Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Note Splashes',
			"Si no se marca, al presionar las notas \"¡Sick!\" no se mostrarán las NoteSplash.",
			'noteSplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Score Type:',
			"¿Cuál debería ser el estilo de puntuación?",
                        'scoreType',
                        'string',
                        'Kade Engine',
                        ['Psych Engine', 'Kade Engine', 'Disabled']);
                addOption(option);

		var option:Option = new Option('Memory Counter',
			'indicador de cuanto llevas o vas gastando la memoria.',
                        'memoryCounter',
                        'bool',
                        false);
                addOption(option);
		option.onChange = onChangeMemoryCounter;
/*
		var option:Option = new Option('Dynamic Cam',
                        'Si está marcado, habilita el movimiento dinámico de la leva. ¡Solo funciona con Vanilla FNF!.',
                        'dynamicCam',
                        'bool',
                        false);
                addOption(option); //not working
*/
		var option:Option = new Option('Play Hit Sounds',
                        'Sonido al presionar una nota.',
                        'playHitSounds',
                        'bool',
                        false);
                addOption(option);

		var option:Option = new Option('Icon Boping',
                        'Movimiento de los íconos.',
                        'iconBoping',
                        'bool',
                        false);
                addOption(option);

		var option:Option = new Option('Hide HUD',
			'Ocultar el UI, apto por si tienes pocos fps.',
			'hideHud',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Health Counter',
                        'Contador de vida.',
                        'healthCounter',
                        'bool',
                        false);
                addOption(option);
		
		var option:Option = new Option('Time Bar:',
			"¿Qué debe mostrar la barra de tiempo?",
			'timeBarType',
			'string',
			'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Flashing Lights',
			"¡Desmarque esto si es sensible a las luces intermitentes!",
			'flashing',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Camera Zooms',
			"Si no se marca, la cámara no se acercará en un golpe de ritmo.",
			'camZooms',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Judgements',
                        'Mostrador de Shits, Goods, Sicks y Bads total.',
                        'judgements',
                        'bool',
                        false);
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
/*
		var option:Option = new Option('Lane Opacity',
                        'How Opaque should the lane underlay be.',
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
*/
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