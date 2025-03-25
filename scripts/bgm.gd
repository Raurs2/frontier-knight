extends AudioStreamPlayer

class_name Bgm

const DARK_FANTASY_AMBIENT_DUNGEON_SYNTH_248213 = preload("res://assets/musics/dark-fantasy-ambient-dungeon-synth-248213.mp3")
const FAIRY_TALE_FANTASY_123608 = preload("res://assets/musics/fairy-tale-fantasy-123608.mp3")
const FANTASY_158150 = preload("res://assets/musics/fantasy-158150.mp3")
const FANTASY_CLASSICAL_THEMES_132199 = preload("res://assets/musics/fantasy-classical-themes-132199.mp3")
const FANTASY_MUSIC_LUMINA_143991 = preload("res://assets/musics/fantasy-music-lumina-143991.mp3")
const FANTASY_MUSIC_OVERTURE_ORCHESTRAL_AMP_CHOIR_113620 = preload("res://assets/musics/fantasy-music-overture-orchestral-amp-choir-113620.mp3")
const NOCTURNAL_FANTASY_ENCHANTED_LOOP_284212 = preload("res://assets/musics/nocturnal-fantasy-enchanted-loop-284212.mp3")
const PEACEFUL_FANTASY_MUSIC_160729 = preload("res://assets/musics/peaceful-fantasy-music-160729.mp3")
const SYNTHESIZER_FANTASY_308299 = preload("res://assets/musics/synthesizer-fantasy-308299.mp3")

const music_selection = {
	1 : DARK_FANTASY_AMBIENT_DUNGEON_SYNTH_248213,
	2 : FAIRY_TALE_FANTASY_123608,
	3 : FANTASY_158150,
	4 : FANTASY_CLASSICAL_THEMES_132199,
	5 : FANTASY_MUSIC_LUMINA_143991,
	6 : FANTASY_MUSIC_OVERTURE_ORCHESTRAL_AMP_CHOIR_113620,
	7 : NOCTURNAL_FANTASY_ENCHANTED_LOOP_284212,
	8 : PEACEFUL_FANTASY_MUSIC_160729,
	9 : SYNTHESIZER_FANTASY_308299
}

# Background Music player
func play_audio(index : int):
	stream = music_selection[index]
	volume_db = -15
	play()
