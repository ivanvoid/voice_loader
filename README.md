# Voice loader
Small automation package for downloading mp3 of pronunciations from Google translate using gTTS lib.  
- [gTTS source by pndurette](https://github.com/pndurette/gTTS)

## Usage
- Put words you wanna pronounce for in `ur_words.csv` file
- Change configs in `config.txt`
  - **FILE_WITH_WORDS_PATH**: path_to/ur_words.csv
  - **OUTPUT_MP3_PATH**: output_folder 
  - **LANGUAGE**: language (IETF language tag) [en, et, etc...]
  - **DOMAIN**: Top-level domain for the Google Translate host, i.e translate.google.domain [com, com.au, etc...]
  - **SLOW_READING**: Reads text more slowly [True/False]
  - **DISPLAY_CONFIG**: Disply this config file or not [True/False]
- Double click on `voice_loader.command` or run `python voice_loader.py` in terminal 
