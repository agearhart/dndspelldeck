# dndspellbook
Inspired by Stephen Swat's DnD-Spelldeck for spell card generation without having to install LaTex and Python, https://github.com/StephenSwat/DnD-Spelldeck

This is the repository for the docker file for https://hub.docker.com/r/pnzrdrgoon/dndspelldeck/

# How To Use
With this Dockerfile you don't need to know git, python, nor LaTeX. To use this first install Docker on your machine:
https://www.docker.com/products/docker-desktop

Once installed you can use run the Dockerfile to to generate the PDFs for you by running the command:
docker run -it -v c:/temp:/opt/output pnzrdrgoon/dndspelldeck:latest

## Docker Paramaters
### -it
For interactive processes (like a shell), you must use -i -t together in order to allocate a tty for the container process. -i -t is often written -it

### -v
This is a volume mount and directs the script where the output files should go.  In the example above /opt/output of the Dockerfile is pointed to C:\Temp folder.  This means that any output generated from the execution of the Dockerfile is written to a file in C:Temp

Once complete you should be able to find the PDF generated at C:\Temp
