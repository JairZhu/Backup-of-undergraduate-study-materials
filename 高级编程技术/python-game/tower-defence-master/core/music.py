import pygame


def play_music():
    # 循环播放音乐
    music_file = 'music/music.mid'
    freq = 44100
    bitsize = -16
    channels = 2
    buffer = 2048
    pygame.mixer.init(freq, bitsize, channels, buffer)
    pygame.mixer.music.set_volume(0.8)
    while True:
        play(music_file)

def play(music_file):
    clock = pygame.time.Clock()
    pygame.mixer.music.load(music_file)
    pygame.mixer.music.play()
    while pygame.mixer.music.get_busy():
        clock.tick(30)
