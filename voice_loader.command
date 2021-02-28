#!/usr/bin/env python
# Credit: github.com/veax-void/
'''
No more then 100 chars in
a word or voice will be croped
'''
import gtts
import os

def get_configs(path='./config.txt', display=True):
    # Read config file
    f = open(path, 'r')
    data = f.read()
    f.close()

    # Save configs
    cfg = {}
    cfg_print = ''

    if display: cfg_print ='Config:\n'

    for setting in data.split('\n'):
        if len(setting) > 0:
            s_title, val = setting.split(':')
            val = val.strip()

            if display: cfg_print+=f'\t{s_title}: {val}\n'

            # handle bools 
            if (val == 'True' or val == 'False'):
                val = bool(val)

            cfg[s_title] = val
            
    if cfg['DISPLAY_CONFIG']: print(cfg_print)
    return cfg


def read_words(filename):
    f = open(filename, 'r', encoding='utf-8-sig')
    words_list = f.read().split()
    f.close()
    return words_list


def main():
    # Read configs
    cfg = get_configs(display=True)

    # Create dir for output if not exist
    if not os.path.exists(cfg['OUTPUT_MP3_PATH']):
        os.mkdir(cfg['OUTPUT_MP3_PATH'])

    # Read file with words
    words_list = read_words(cfg['FILE_WITH_WORDS_PATH'])
    print(f'\nLoaded {len(words_list)} words.')

    # Manage requests
    print('\nStart loading to {}:'.format(cfg['OUTPUT_MP3_PATH']))
    for i, word in enumerate(words_list):	
        print(f'[{i}/{len(words_list)}] Loading: {word} mp3...')
        # Init gTTS
        tts = gtts.tts.gTTS(
            word, tld=cfg['DOMAIN'], lang=cfg['LANGUAGE'])

        # Save mp3
        out_path = os.path.join(cfg['OUTPUT_MP3_PATH'], f'{word}.mp3')	
        tts.save(out_path)

    print('Done.')
	
if __name__ == '__main__':
    main()

