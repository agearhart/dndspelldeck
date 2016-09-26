#Inspired by https://github.com/StephenSwat/DnD-Spelldeck
# Now users don't need to install Python or LaTex to create cards

from python:3.6-slim

#volume mapping for output
VOLUME ["/opt/output"]

#install LaTeX
RUN apt-get update && apt-get install -y texlive-full

# add missing font
ADD http://fontsup.com/download/74505.html /usr/share/fonts/

#update system font list
RUN fc-cache -f -v

# download card generation python
ADD https://github.com/StephenSwat/DnD-Spelldeck/archive/master.zip dndSpellbookPy.zip

RUN unzip dndSpellbookPy.zip

WORKDIR DnD-Spelldeck-master

ENTRYPOINT python3 generate.py > tex/spells.tex && latexmk -cd -pdfps -xelatex tex/cards.tex tex/printable.tex && cp tex/printable.pdf /opt/output
