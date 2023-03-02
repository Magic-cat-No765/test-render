FROM eclipse-temurin:17-jdk-jammy
# Comment
# RUN echo 'we are running some # of cool things'
RUN apt-get update && apt-get -y install python3 python3-pip && pip install gdown
RUN mkdir ./mc/
RUN gdown https://drive.google.com/uc?id=1h1HNtGJFAoSvJzUKCSOkPkhshW9bVchJ -O ./mc/mc.tar.gz && tar -xf ./mc/mc.tar.gz && rm ./mc/mc.tar.gz && mv ./Minecraft_1.14.4_Portable/Minecraft\ 1.14.4\ Portable/* ./mc/ && rm -rf ./Minecraft_1.14.4_Portable
WORKDIR ./mc/server/
COPY web/ .
RUN pip install -r requirements.txt
CMD python3 ./main.py
