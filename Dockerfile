#Inspired by https://github.com/StephenSwat/DnD-Spelldeck
# Now users don't need to install Python or LaTex to create cards

from python:3.6-slim

#volume mapping for output
VOLUME ["/output"]

RUN apt-get update && apt-get install -y texlive-full && apt-get -y install wget

RUN wget -O dndSpellbookPy.zip "https://github.com/StephenSwat/DnD-Spelldeck/archive/master.zip"

RUN unzip dndSpellbookPy.zip

WORKDIR DnD-Spelldeck-master

ENTRYPOINT python3 generate.py > spells.tex && latexmk -xelatex spells.tex printable.tex && latexmk -pdf printable.tex /output/spellCards.pdf
