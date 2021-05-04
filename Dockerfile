FROM alpine:latest

RUN apk update
RUN apk add curl
RUN apk add unrar
RUN apk add unzip
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
RUN unzip rclone-current-linux-amd64.zip
RUN cp /rclone-*-linux-amd64/rclone /usr/bin/
RUN chown root:root /usr/bin/rclone
RUN chmod 755 /usr/bin/rclone
RUN apk add aria2
RUN apk add wget
RUN apk add py3-pip
#Cleaning&Finalising
RUN rm /rclone-current-linux-amd64.zip
RUN rm -r /rclone-*-linux-amd64/rclone
COPY Essential-Files /Essential-Files
RUN pip3 install jupyter
RUN pip3 install voila
RUN pip3 install ipywidgets
RUN pip3 install widgetsnbextension
RUN mkdir /Essential-Files
RUN mkdir /voila
RUN mkdir /voila/files
RUN chmod +x /Essential-Files/entrypoint.sh
CMD /Essential-Files/entrypoint.sh
