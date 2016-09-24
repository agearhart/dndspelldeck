#Inspired by https://github.com/StephenSwat/DnD-Spelldeck
# Now users don't need to install Python or LaTex to create cards

from python:3.6-slim

#volume mapping for output
VOLUME ["/opt/output"]

RUN apt-get update && apt-get install -y texlive-full && apt-get -y install wget

RUN wget -O dndSpellbookPy.zip "https://github.com/StephenSwat/DnD-Spelldeck/archive/master.zip"

RUN unzip dndSpellbookPy.zip

RUN wget -O Mrs-Eaves-OT-Roman.ttf "http://fontsup.com/download/74505.html"

RUN cp Mrs-Eaves-OT-Roman.ttf /usr/share/fonts/

WORKDIR DnD-Spelldeck-master

ENTRYPOINT fc-cache -f -v && python3 generate.py > spells.tex && latexmk -pdfps -xelatex cards.tex printable.tex && ls -al && cp *.pdf /opt/output
