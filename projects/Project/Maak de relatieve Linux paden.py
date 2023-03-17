Maak de relatieve Linux paden

Je kunt gebruik maken van het script convert_path.py

chmod +x convert_path.py && ./convert_path.py "relative\path\to\model"
In VsCode selecteer je het bestand met de rechtermuisknop en kies je 'Copy Relative Path'
Pas het pad aan als het om een sub-directory of juist hoger gelegen directory gaat
Test de start-scripts vanuit een (git bash) terminal

Stel het niveau van logging in op INFO

logging.basicConfig(level=logging.INFO)
Verwijder tijdelijke bestanden en directories

Verwijder pycache directories

rm -r build/__pycache__
rm -r run/__pycache__
Verwijder checkpoint bestanden

rm notebook/*-checkpoint.ipynb
Maak zip-bestanden

Maak een zip-bestand van de directoriees build, run en (indien van toepassing) sh

Upload zip-bestanden

Upload de bestanden build.zip en run.zip naar je eigen Teams kanaal -> Deliverables periode 1/Project/Broncode

Upload het bestand notebooks.zip naar je eigen Teams kanaal -> Deliverables periode 1/Project/Notebooks