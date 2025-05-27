extends Control


@onready var startGame: Button =    $VBoxContainer/StartGame
@onready var boxContainer: BoxContainer =  $VBoxContainer
@onready var optionButton: OptionButton =  $VBoxContainer/OptionButton


var languageList: Array[String] = ['zh','en'];
#TODO 本地存储
#var currentLanguage = TranslationServer.get_locale();
var currentLanguage = 'zh'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(languageList.size()):
		if languageList[i] == currentLanguage:
			optionButton.select(i)
	
	if currentLanguage == "automatic":
		var preferred_language = OS.get_locale_language()
		TranslationServer.set_locale(preferred_language)
	else: 
		TranslationServer.set_locale(currentLanguage)
	
	startGame.grab_focus()
	
	for buttonChoose: Button in boxContainer.get_children():
		buttonChoose.mouse_entered.connect(buttonChoose.grab_focus)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _on_language_pressed() -> void:
	#print(language)
	#if(language == 'automatic'):
		#TranslationServer.set_locale('zh')
	#elif(language == 'zh'):
		#TranslationServer.set_locale('en')
	#else:
		#TranslationServer.set_locale('zh')


func _on_option_button_item_selected(index: int) -> void:
	print(index)
	var localLanguage = languageList[index]
	TranslationServer.set_locale(localLanguage)
	
	


func _on_start_game_pressed() -> void:
	pass # Replace with function body.


func _on_online_game_pressed() -> void:
	pass # Replace with function body.


func _on_setting_pressed() -> void:
	pass # Replace with function body.


func _on_exit_game_pressed() -> void:
	pass # Replace with function body.
