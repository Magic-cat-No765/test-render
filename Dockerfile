FROM eclipse-temurin:17-jdk-jammy
# Comment
# RUN echo 'we are running some # of cool things'
RUN apt update && apt install python3.9-dev && pip3 install gdown