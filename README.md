# Video Thumbnail Generator

Dieses Skript generiert aus jedem im aktuellen Verzeichnis und dessen Unterordnern gefundenen MP4-Video eine Thumbnail-Kollage. Es werden insgesamt 18 Frames aus dem Video gleichmäßig extrahiert und in einer 3x6-Kachelanordnung dargestellt.

## Abhängigkeiten:

- Bash Shell
- Docker
- FFmpeg Docker Image (`jrottenberg/ffmpeg:latest-data-1`)

## Verwendung:

Führe das Skript einfach in einem Verzeichnis aus, in dem du Thumbnails für MP4-Videos generieren möchtest:

./path_to_script/script_name.sh


## Funktionsweise:

1. Das Skript definiert ein Ausgabeverzeichnis namens "thumbnails/" und erstellt es, falls es noch nicht existiert.
2. Es sucht nach allen MP4-Dateien im aktuellen Verzeichnis und in allen Unterordnern.
3. Für jede gefundene MP4-Datei:
    - Es wird der Dateiname berechnet, wobei alle `/` durch `_` ersetzt werden.
    - Es wird die Dauer des Videos in Sekunden ermittelt.
    - Aus dieser Dauer wird die benötigte Framerate berechnet, um insgesamt 18 Frames gleichmäßig über die gesamte Videozeit zu verteilen.
    - Unter Verwendung von Docker und FFmpeg wird aus dem Video eine Thumbnail-Kollage mit 3x6-Kacheln erstellt und im zuvor definierten "thumbnails/"-Verzeichnis gespeichert.

## Hinweis:

- Das Skript verwendet Docker, um FFmpeg zu betreiben. Dies stellt sicher, dass die notwendigen Abhängigkeiten nicht lokal installiert sein müssen, erfordert aber, dass Docker auf deinem System installiert und betriebsbereit ist. Das Skript erfordert außerdem geeignete Berechtigungen, um Docker-Container auszuführen.
- Andere Videoformate können ebenfalls funktionieren, wenn man die Dateiendung im Skript entsprechend anpasst oder erweitert.

---

**English Version Below**

# Video Thumbnail Generator

This script generates a thumbnail collage for each MP4 video found in the current directory and its subdirectories. It extracts a total of 18 frames from the video evenly and presents them in a 3x6 tile arrangement.

## Dependencies:

- Bash Shell
- Docker
- FFmpeg Docker Image (`jrottenberg/ffmpeg:latest-data-1`)

## Usage:

Simply execute the script in a directory where you wish to generate thumbnails for MP4 videos:

./path_to_script/script_name.sh


## How It Works:

1. The script defines an output directory named "thumbnails/" and creates it if it doesn't already exist.
2. It searches for all MP4 files in the current directory and all subdirectories.
3. For each found MP4 file:
    - It calculates the filename, replacing all `/` with `_`.
    - It determines the duration of the video in seconds.
    - From this duration, it calculates the frame rate required to evenly extract a total of 18 frames throughout the video's duration.
    - Using Docker and FFmpeg, it creates a thumbnail collage with 3x6 tiles and saves it in the previously defined "thumbnails/" directory.

## Note:

- The script uses Docker to operate FFmpeg. This ensures that the necessary dependencies don't have to be installed locally but requires that Docker is installed and operational on your system. The script also requires appropriate permissions to run Docker containers.
- Other video formats might also work if you adjust or expand the file extension in the script accordingly.
