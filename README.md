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

Das Skript verwendet Docker, um FFmpeg zu betreiben. Dies stellt sicher, dass die notwendigen Abhängigkeiten nicht lokal installiert sein müssen, erfordert aber, dass Docker auf deinem System installiert und betriebsbereit ist. Das Skript erfordert außerdem geeignete Berechtigungen, um Docker-Container auszuführen.
